---------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  restore the costruct head eye lights
  * requires changing palette colorAlt in BUILDERLIGHTS.TEXTURE.MBIN
   (done in textures script)
]]-------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META costruct head eyes.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONTEXTUREOPTIONDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'EYE'},
				PRECEDING_KEY_WORDS = 'Options',
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'EYE'},
				PRECEDING_KEY_WORDS = 'Tips',
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'EYE'},
				ADD					= ToExml(StringArray({0, 1, 2, 3, 4, 5, 6, 7, 8}, 'Options', 20))
			},
			{
				SPECIAL_KEY_WORDS	= {'TextureOptionsID', 'EYE'},
				VALUE_CHANGE_TABLE 	= {
					{'TextureOptionsID',	'BUILDEREYES'},
					{'Group',				'BUILDEREYES'},
					{'ColourAlt',			'Alternative3'} -- regular = 2
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/CHARACTERCUSTOMISATIONUIDATA.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {
					{'DescriptorOption', 'HEAD_ASTBOT1', 'TextureOptionGroup', 'HEAD_ASTRO'},
					{'DescriptorOption', 'HEAD_ASTBOT2', 'TextureOptionGroup', 'HEAD_ASTRO'},
				},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= ToExml({
					META	= {'value', 'GcCustomisationTextureGroup.xml'},
					Title				= 'BUILD_GROUP_LIGHTS',
					TextureOptionGroup	= 'BUILDEREYES'
				})
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'DescriptorOption', 'HEAD_ASTBOT1', 'Title', 'CUSTOMISE_TERTIARY'},
					{'DescriptorOption', 'HEAD_ASTBOT2', 'Title', 'CUSTOMISE_TERTIARY'},
				},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= ToExml({
					META	= {'value', 'GcCustomisationColourGroup.xml'},
					Title	= 'Headlights Color',
					{
						META		= {'Palette', 'TkPaletteTexture.xml'},
						Palette		= 'Custom_Head',
						ColourAlt	= 'Alternative3'
					}
				})
			}
		}
	}
}}}}