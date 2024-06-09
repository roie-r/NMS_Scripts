---------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
---------------------------------------------------------------------
local mod_desc = [[
  restore the costruct head eye lights
  * requires changing palette colorAlt in BUILDERLIGHTS.TEXTURE.MBIN
   (done in textures script)
]]-------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META costruct head eyes.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.72',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	-- {
		-- MBIN_FILE_SOURCE	= 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONTEXTUREOPTIONDATA.MBIN',
		-- EXML_CHANGE_TABLE	= {
			-- {
				-- SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'EYES_BUILDER'},
				-- VALUE_CHANGE_TABLE 	= {
					-- {'ColourAlt',	'Alternative3'} -- Alternative2
				-- }
			-- }
		-- }
	-- },
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/CHARACTERCUSTOMISATIONUIDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= (
					function()
						local T = {}
						for _,head in ipairs({
							'HEAD_ASTBOT1',
							'HEAD_ASTBOT2',
							'BHEAD_3',
							'BHEAD_4',
							'BHEAD_5',
							'BHEAD_6',
							'BHEAD_7',
							'BHEAD_9',
							'BHEAD_10',
							'BHEAD_11',
							'BHEAD_12',
							'BHEAD_13',
							'BHEAD_14',
							'BHEAD_15',
							'BHEAD_16',
							'BHEAD_17'
						}) do
							T[#T+1] = {'DescriptorOption', head, 'Title', 'CUSTOMISE_TERTIARY'}
						end
						return T
					end
				)(),
				ADD_OPTION			= 'AddAfterSection',
				ADD					= ToExml({
					meta	= {'value', 'GcCustomisationColourGroup.xml'},
					Title	= 'Light Color',
					Palette	= {
						meta		= {'Palette', 'TkPaletteTexture.xml'},
						Palette		= 'Custom_Head',
						ColourAlt	= 'Alternative3'
					}
				})
			}
		}
	}
}}}}