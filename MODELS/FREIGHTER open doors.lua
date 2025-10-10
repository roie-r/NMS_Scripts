--[[	Y translations
idx	start	end
1:	-1.44	 0.11
2:			 1.27
3:			 1.27
4:	0.42	-0.87
5:			-3.36
6:			-3.36
7:	0.42	 3.24
8:	0.42	-4.23
9:	-0.004	-2.83	top door
10: -0.004	 4.65	bottom door
--]]

local mx_ct = {}	 -- original goes from 0.0 to -2.8

for i=0, 180 do
	local sec = {
		SKW = {'AnimFrameData', 'TkAnimNodeFrameData'},
		SECTION_ACTIVE = i,	-- PS: indexes on MXMLs start from 0, if looping through Lua, be careful
		VCT = {
			{'Y', '@*1'},	-- in-line math to multiply with 1, essentially doing nothing
			{'Y', '@*1'},
			{'Y', '@*1'},
			{'Y', '@*1'},
			{'Y', '@*1'},
			{'Y', '@*1'},
			{'Y', 0.4 + 5.5 * i / 180},	-- first of the last four, a different operation / value replacement
			{'Y', 0.4 - 6.8 * i / 180},
			{'Y', -5.5 * i / 180},
			{'Y', 6.8 * i / 180}
		}
	}
	mx_ct[#mx_ct+1] = sec
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME			= '+ MODEL open freighter doors',
	MOD_AUTHOR				= 'Lo2k+Lyravega',
	LUA_AUTHOR				= 'Lo2k',
	NMS_VERSION				= '5.83',
	MOD_DESCRIPTION			= 'This mod opens wide the freighter doors',
	MODIFICATIONS			= {
		{
			MBIN_CHANGE_TABLE	= {
				{
					MBIN_FILE_SOURCE	= {'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/ACCESSORIES/HANGARPARTS/HANGARDOOR/ANIMS/HANGARDOOR_OPEN.ANIM.MBIN'},
					MXML_CHANGE_TABLE	= mx_ct
				}
			}
		}
	}
}