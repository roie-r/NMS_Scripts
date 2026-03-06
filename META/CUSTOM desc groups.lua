------------------------------------------------------------------
local mod_desc = [[
  - Add back top fins to scientific cockpit parts
  - Add vulture parts to dropship custom groups
  - Add fighter wingK with tail group
]]----------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META custom decriptor groups',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_BATCHNAME		= '+META ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|customization desc| parts
		MBIN_FILE_SOURCE = 'METADATA/GAMESTATE/PLAYERDATA/CHARACTERCUSTOMISATIONDESCRIPTORGROUPSDATA.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE = {
			{-- Add back top fins to scientific cockpit
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS	= {'Id', 'SCIEN_COCK'},
				PRECEDING_KEY_WORDS = 'Descriptors',
				ADD_OPTION			= 'AddEndSection',
				ADD					= '<Property name="Descriptors" value="_BACKACC_1" />'
			},
			{-- Add vulture parts to dropship
				SPECIAL_KEY_WORDS	= {'GroupID', 'DROPS_COCKS13'},
				PRECEDING_KEY_WORDS = 'Descriptors',
				REPLACE_TYPE		= 'OnceInside',
				VALUE_CHANGE_TABLE	= {
					{'Descriptors',	'_COCKPIT_S13'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'GroupID', 'DROPS_ENGIS13'},
				PRECEDING_KEY_WORDS = 'Descriptors',
				REPLACE_TYPE		= 'OnceInside',
				VALUE_CHANGE_TABLE	= {
					{'Descriptors',	'_ENGINES_S13'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'GroupID', 'DROPS_WINGS13'},
				PRECEDING_KEY_WORDS = 'Descriptors',
				REPLACE_TYPE		= 'OnceInside',
				VALUE_CHANGE_TABLE	= {
					{'Descriptors',	'_WINGS_S13'}
				}
			},
			{--	add fighter wingK with tail group
				SPECIAL_KEY_WORDS	= {'GroupID', 'FIGHT_WINGKAA'},
				SEC_SAVE_TO			= 'custom_descriptor_group'
			},
			{
				SEC_EDIT 			= 'custom_descriptor_group',
				VALUE_CHANGE_TABLE 	= {
					{'GroupID',		'FIGHT_WINGKAAT'}
				}
			},
			{
				SEC_EDIT 			= 'custom_descriptor_group',
				PRECEDING_KEY_WORDS = 'Descriptors',
				ADD_OPTION			= 'AddEndSection',
				ADD					= '<Property name="Descriptors" value="_ACC_A7" />'
			},
			{
				SPECIAL_KEY_WORDS	= {'GroupID', 'FIGHT_WINGKAA'},
				ADD_OPTION			= 'AddAfterSection',
				SEC_ADD_NAMED		= 'custom_descriptor_group',
			}
		}
	}
}}}}
