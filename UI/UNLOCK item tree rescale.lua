-----------------------------------
local mod_desc = [[
  rescale unlockable item tree
  (Original by FriendlyFirePL)
]]---------------------------------

-- scalling and position values
local sc_main = '@ * 0.85'
local sc_cost = '@ * 0.75'
local pos_x = 48
local pos_y = 84

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ UI rescale unlockable item tree',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'UI/SLOTTREENODE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{-- scale down whole node + locked icon overlay
				SPECIAL_KEY_WORDS	= {
					{'ID',	'NORMAL'},
					{'ID',	'LOCK'},
					{'ID',	'SEASONLOCK'}
				},
				VALUE_CHANGE_TABLE	= {
					{'Width',			sc_main},
					{'Height',			sc_main}
				},
			},
			{-- change position of attachment points for lines
				SPECIAL_KEY_WORDS	= {'ID', 'TREE_.-'},
				VALUE_CHANGE_TABLE = {
					{'Position X',		sc_main},
					{'Position Y',		sc_main}
				},
			},
			{-- reposition cost group
				SPECIAL_KEY_WORDS	= {'ID','COST'},
				VALUE_CHANGE_TABLE	= {
					{'Position X',		pos_x},
					{'Position Y',		pos_y},
					{'Vertical',		'Top'}
				}
			},
			{-- reposition cost label text
				SPECIAL_KEY_WORDS	= {'ID','TEXT'},
				VALUE_CHANGE_TABLE	=
				{
					{'Position X',		pos_x},
					{'Position Y',		0},
					{'Horizontal',		'Center'},
					{'Width Percentage',true},
					{'Height Percentage',true},
				}
			},
			{-- rework cost label font
				SPECIAL_KEY_WORDS	= {'ID','TEXT'},
				SECTION_UP_SPECIAL	= 1,
				REPLACE_TYPE		= 'All',
				VALUE_CHANGE_TABLE	= {
					{'Font Height',		sc_cost},
					{'Auto Adjust Font Height',false}
				}
			},
			{-- rework cost background, enable gradient
				SPECIAL_KEY_WORDS	= {'Position X', '28.000000'},
				SECTION_UP_SPECIAL	= 2,
				REPLACE_TYPE		= 'All',
				VALUE_CHANGE_TABLE	= {
					{'Gradient',		'Horizontal'},
					{'Corner Radius',	6}
				}
			},
			{-- change colour to get gradient effect
				SPECIAL_KEY_WORDS	= {'Position X', '28.000000'},
				SECTION_UP_SPECIAL	= 2,
				AFTER_KEY_WORDS		= 'Gradient Colour',
				REPLACE_TYPE		= 'All',
				VALUE_CHANGE_TABLE	= {
					{'R',	1},
					{'G',	0.4},
					{'B',	0}
				}
			},
			{-- reposition cost background
				SPECIAL_KEY_WORDS	= {'Position X', '28.000000'},
				VALUE_CHANGE_TABLE	=
				{
					{'Position X',		pos_x},
					{'Position Y',		0},
					{'Width',			sc_cost},
					{'Height',			sc_main},
					{'Horizontal',		'Center'},
					{'Width Percentage',true},
					{'AnchorPercent',	true},
				}
			}
		}
	}
}}}}
