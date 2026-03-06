---------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
---------------------------------------------------------------------
local mod_desc = [[
  - Add cusomization options for the skiff.
  - restore the costruct head eye lights
   * requires changing palette colorAlt in BUILDERLIGHTS.TEXTURE.MBIN
   (done in textures script)
]]-------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META ui cutomization palettes',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/CHARACTERCUSTOMISATIONUIDATA.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Skiff', 'GcCustomisationUI'},
				VALUE_CHANGE_TABLE 	= {
					{'ForceShowAllColourOptions', true}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Skiff', 'GcCustomisationUI'},
				PRECEDING_KEY_WORDS = 'ColourGroups',
				REMOVE				= 'Section'
			},
			{
				SPECIAL_KEY_WORDS	= {'Vehicle_Mech', 'GcCustomisationUI'},
				PRECEDING_KEY_WORDS = 'ColourGroups',
				SEC_SAVE_TO			= 'mech_colour_groups'
			},
			{
				SEC_EDIT 			= 'mech_colour_groups',
				SPECIAL_KEY_WORDS	= {'Title', 'CUSTOMISE_TERTIARY'},
				REPLACE_TYPE 		= 'OnceInside',
				PRECEDING_KEY_WORDS = 'Palette',
				VALUE_CHANGE_TABLE 	= {
					{'Palette',		'SailShip_Sails'},
					{'ColourAlt',	'Primary'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Skiff', 'GcCustomisationUI'},
				PRECEDING_KEY_WORDS = 'GcCustomisationGroup',
				SEC_ADD_NAMED		= 'mech_colour_groups'
			},
			{
				SPECIAL_KEY_WORDS	= {
					{'DescriptorOption', 'HEAD_ASTBOT[12]',	'Title', 'CUSTOMISE_TERTIARY'},
					{'DescriptorOption', 'BHEAD_%d.-',		'Title', 'CUSTOMISE_TERTIARY'}
				},
				ADD_OPTION			= 'AddAfterSection',
				ADD					= ToMxml({
					meta	= {name='ColourGroups', value='GcCustomisationColourGroup'},
					Title	= 'Light Color',
					Palette	= {
						meta		= {name='Palette', value='TkPaletteTexture'},
						Palette		= 'Custom_Head',
						ColourAlt	= 'Alternative3'
					}
				})
			}
		}
	}
}}}}