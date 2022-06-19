--[[-------------------------------------------------------------------------
MIT License

Copyright (c) 2020 yobson1

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
---------------------------------------------------------------------------]]

--[[ 
    Original Code written by: yobson1
    https://github.com/yobson1/glua-soundduration
]]--


local debug = false
local sprint = debug and print or function() end

local MP3Data = {
	versions = {"2.5", "x", "2", "1"},
	layers = {"x", "3", "2", "1"},
	bitrates = {
		["V1Lx"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		["V1L1"] = {0, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448},
		["V1L2"] = {0, 32, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384},
		["V1L3"] = {0, 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320},
		["V2Lx"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		["V2L1"] = {0, 32, 48, 56, 64, 80, 96, 112, 128, 144, 160, 176, 192, 224, 256, 288},
		["V2L2"] = {0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160},
		["V2L3"] = {0, 8, 16, 24, 32, 40, 48, 56, 64, 80, 96, 112, 128, 144, 160},
		["VxLx"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		["VxL1"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		["VxL2"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		["VxL3"] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	},
	sampleRates = {
		["x"] = {0, 0, 0},
		["1"] = {44100, 48000, 32000},
		["2"] = {22050, 24000, 16000},
		["2.5"] = {11025, 12000, 8000}
	},
	samples = {
		x = {
			["x"] = 0,
			["1"] = 0,
			["2"] = 0,
			["3"] = 0
		},
		["1"] = {
			["x"] = 0,
			["1"] = 384,
			["2"] = 1152,
			["3"] = 1152
		},
		["2"] = {
			["x"] = 0,
			["1"] = 384,
			["2"] = 1152,
			["3"] = 576
		}
	}
}

local function MP3FrameSize(samples, layer, bitrate, sampleRate, paddingBit)
	local size

	if layer == 1 then
		size = math.floor(((samples * bitrate * 125) / sampleRate) + paddingBit * 4)
	else
		size = math.floor(((samples * bitrate * 125) / sampleRate) + paddingBit)
	end

	return (size == size and size < math.huge) and size or 0
end

local function ParseMP3FrameHeader(buffer)
	buffer:Skip(1)
	local b1, b2 = buffer:ReadByte(), buffer:ReadByte()

	-- Get the version
	local versionBits = bit.rshift(bit.band(b1, 0x18), 3)
	local version = MP3Data.versions[versionBits + 1]
	local simpleVersion = version == "2.5" and "2" or version

	-- Get the layer
	local layerBits = bit.rshift(bit.band(b1, 0x06), 1)
	local layer = MP3Data.layers[layerBits + 1]

	-- Get the bitrate
	local bitrateKey = "V" .. simpleVersion .. "L" .. layer
	local bitrateIndex = bit.rshift(bit.band(b2, 0xf0), 4)
	local bitrate = MP3Data.bitrates[bitrateKey][bitrateIndex + 1] or 0

	-- Get the sample rate
	local sampleRateIdx = bit.rshift(bit.band(b2, 0x0c), 2)
	local sampleRate = MP3Data.sampleRates[version][sampleRateIdx + 1] or 0

	local sample = MP3Data.samples[simpleVersion][layer]

	-- Get padding bit
	local paddingBit = bit.rshift(bit.band(b2, 0x02), 1)

	-- Seek back to where we were
	buffer:Skip(-3)

	return {
		bitrate = bitrate,
		sampleRate = sampleRate,
		frameSize = MP3FrameSize(sample, layer, bitrate, sampleRate, paddingBit),
		samples = sample
	}
end

local soundDecoders = {
	["mp3"] = function(buffer)
		local duration = 0

		-- Check for ID3v2 metadata and skip it if present
		if buffer:Read(3) == "ID3" then
			sprint("ID3v2 metadata detected")

			-- Skip the version and revision
			buffer:Skip(2)

			-- Read the flags byte
			local ID3Flags = buffer:ReadByte()

			-- Check for footer flag
			local footerSize = bit.band(ID3Flags, 0x10) == 0x10 and 10 or 0

			-- Calculate total ID3v2 size
			local z0, z1, z2, z3 = buffer:ReadByte(), buffer:ReadByte(), buffer:ReadByte(), buffer:ReadByte()
			local ID3Size = 10 + ((bit.band(z0, 0x7f) * 2097152) + (bit.band(z1, 0x7f) * 16384) + (bit.band(z2, 0x7f) * 128) + bit.band(z3, 0x7f)) + footerSize
			sprint("Total ID3v2 size: ", ID3Size, " bytes")

			-- Skip the total ID3v2 size - 10 since we already seeked past the first 10 bytes, which is the header
			buffer:Skip(ID3Size - 10)
		else
			-- Go back to the start of the buffer
			buffer:Skip(-buffer:Tell())
		end

		local prevTell = buffer:Tell()
		while buffer:Tell() < buffer:Size() - 10 do
			-- Read the next 4 bytes from the buffer
			local b1, b2, b3, b4 = buffer:ReadByte(), buffer:ReadByte(), buffer:ReadByte(), buffer:ReadByte()

			-- Sometimes it doesn't seek by 4 bytes properly?
			buffer:Seek(prevTell + 4)

			-- Looking for 1111 1111 111 (frame synchronization bits)
			if b1 == 0xff and bit.band(b2, 0xe0) == 0xe0 then
				-- Go back to the start of the header
				buffer:Skip(-4)

				-- Parse the header and add to the duration of this frame
				local frameHeader = ParseMP3FrameHeader(buffer)
				sprint("Found next MP3 frame header @ ", buffer:Tell(), ":", frameHeader.frameSize)

				if frameHeader.frameSize > 0 and frameHeader.samples > 0 then
					buffer:Skip(frameHeader.frameSize)
					duration = duration + (frameHeader.samples / frameHeader.sampleRate)
				else
					buffer:Skip(1)
				end
			-- Skip ID3v1 metadata
			elseif b1 == 0x54 and b2 == 0x41 and b3 == 0x47 then -- "TAG"
				if b4 == 0x2b then -- "+"
					sprint("Skipping ID3v1+ metadata")
					buffer:Skip(227 - 4)
				else
					sprint("Skipping ID3v1 metadata")
					buffer:Skip(128 - 4)
				end
			else
				-- Skip ahead a total of 1 byte
				buffer:Skip(-3)
			end

			prevTell = buffer:Tell()
		end

		return duration
	end,
	-- Reference: http://soundfile.sapp.org/doc/WaveFormat/
	["wav"] = function(buffer)
		-- Get channels
		buffer:Seek(22)
		local channels = buffer:ReadShort()

		-- Get sample rate
		local sampleRate = buffer:ReadLong()

		-- Get samples
		buffer:Seek(34)
		local bitsPerSample = buffer:ReadShort()
		local divisor = bitsPerSample / 8
		local samples = (buffer:Size() - 44) / divisor

		return samples / sampleRate / channels
	end
}

function NewSoundDuration(soundPath)
	local extension = soundPath:GetExtensionFromFilename()
	if extension and soundDecoders[extension] then
		local buffer = file.Open("sound/" .. soundPath, "r", "GAME")
		local result = soundDecoders[extension](buffer)
		buffer:Close()
		return result
	end

	return SoundDuration(soundPath)
end