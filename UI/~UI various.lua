-------------------------------------------------------------------------------
local mod_desc = [[
  Add another slot to staff building page for substances
   (content data for the slot added to:
     METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN)
  Ship fabricator: move palette to make space for texture options
  Add space in the menu's Units display for larger numbers
  Remove cinematic black bars
  Remove icon slot borders
  smaller item slot amount font
  smaller dialog and dialog options font
  repalce game font family
]]-----------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ UI various',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_BATCHNAME		= '+UI ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|staff builder extra slot|
		MBIN_FILE_SOURCE	= 'UI/MULTITOOL_BUILDER_PAGE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'SLOT03GRP'},
				SECTION_UP_SPECIAL	= 2,
				SEC_SAVE_TO			= 'gc_ng_uilayer_data'
			},
			{
				SEC_EDIT 			= 'gc_ng_uilayer_data',
				SPECIAL_KEY_WORDS	= {'ID', 'SLOT03GRP'},
				VALUE_CHANGE_TABLE 	= {
					{'ID',			'SLOT04GRP'},
					{'Position X',	49.602}
				}
			},
			{
				SEC_EDIT 			= 'gc_ng_uilayer_data',
				SECTION_UP_SPECIAL	= 1,
				SPECIAL_KEY_WORDS	= {'ID', 'LABEL'},
				VALUE_CHANGE_TABLE 	= {
					{'Text',		''}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'INPUT'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS	= 'Children',
				ADD_OPTION			= 'AddEndSection',
				SEC_ADD_NAMED		= 'gc_ng_uilayer_data'
			}
		}
	},
	{--	|ship builder UI| palette tweak
		MBIN_FILE_SOURCE  	= 'UI/SHIP_BUILDER_PAGE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE 	= {
			{
				SPECIAL_KEY_WORDS	= {'ID','COLOUR'},
				VALUE_CHANGE_TABLE	= {
					{'Position Y',	44},
					{'Height',		580}
				}
			}
		}
	},
	{--	|ship discovery screen| fix
		MBIN_FILE_SOURCE  	= 'UI/HUD/SHIP/SIDESCREENSOLARSYSTEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE 	=
		{
			{
				SPECIAL_KEY_WORDS	= {'ID','PLANET'},
				VALUE_CHANGE_TABLE	= {
					{'Position X',	40}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID','DISCOVER'},
				VALUE_CHANGE_TABLE	= {
					{'Position Y',	131}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID','DISTANCE'},
				VALUE_CHANGE_TABLE	= {
					{'Position Y',	80}
				}
			}
		}
	},
	{--	|inv_no border_small amount font|
		MBIN_FILE_SOURCE	= 'UI/COMPONENTS/INVENTORY/SQU_SLOT_ITEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'ID', 'TEXTLOW.-'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',			84},	-- 82
					{'Height',				23},	-- 32
					{'Drop Shadow Offset',	0}, 	-- 3
					{'Outline Size',		2} 		-- 4
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				SPECIAL_KEY_WORDS 	= {'Gradient', 'Vertical'},
				PRECEDING_KEY_WORDS	= {'Gradient Colour'},
				VALUE_CHANGE_TABLE 	= {
					{'A',			0.35} -- 0.9
				}
			},
			{-- remove slot background
				SPECIAL_KEY_WORDS	= {'ID','BACKGROUND'},
				VALUE_CHANGE_TABLE	= {
					{'Width',				100},	-- 93.4567
					{'Height',				100}	-- 93
				}
			}
		}
	},
	{--	|all_no border_small amount font|
		MBIN_FILE_SOURCE	= 'UI/SLOTS/SLOT_ITEM.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {'ID', 'TITLE'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',			0}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {'ID', 'TEXTLOW.-'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'Position Y',			82},
					{'Height',				22},
					{'Drop Shadow Offset',	0},
					{'Outline Size',		2}
				}
			},
			{-- remove slot background
				SPECIAL_KEY_WORDS	= {'ID','BACKGROUND'},
				VALUE_CHANGE_TABLE	= {
					{'Width',				100},	-- 93.4567
					{'Height',				86.55}	-- 80
				}
			}
		}
	},
	{--	|smaller dialog font|
		MBIN_FILE_SOURCE	= 'UI/INTERACTIONDIALOGPAGE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 35,
				VALUE_CHANGE_TABLE 	= {
					{'Font Height',	28} -- 30
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				VALUE_MATCH			= 28,
				VALUE_CHANGE_TABLE 	= {
					{'Font Height',	24}
				}
			}
		}
	},
	{--	|smaller dialog options font|
		MBIN_FILE_SOURCE	= 'UI/COMPONENTS/RESPONDBUTTONSCROLL.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE 	= {
					{'Font Height',	26} -- 36 >> 30
				}
			}
		}
	},
	{--	|more space for units|
		MBIN_FILE_SOURCE	= 'UI/COMPONENTS/USERBAR.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'ID', 'GRP_UNITS'},
				VALUE_CHANGE_TABLE 	= {
					{'Width',		210}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'UNITS'},
				VALUE_CHANGE_TABLE 	= {
					{'Width',		176}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'GRP_TECH'},
				VALUE_CHANGE_TABLE 	= {
					{'Position X',	210},
					{'Width',		152}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ID', 'GRP_SPEC'},
				VALUE_CHANGE_TABLE 	= {
					{'Position X',	0},
					{'Width',		152}
				}
			}
		}
	},
	{--	|no black bars|
		MBIN_FILE_SOURCE	= {
			'UI/HUD/HUDBARS.MBIN',
			'UI/COMPONENTS/INTERACTION/CINEMATICBARS.MBIN'
		},
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				VALUE_CHANGE_TABLE 	= {
					{'Is Hidden',	true}
				}
			}
		}
	}
}}},
	ADD_FILES	= {
		{
			EXTERNAL_FILE_SOURCE= 'D:/MODZ_stuff/NoMansSky/Sources/Fonts/Ubuntu-Regular.ttf',
			FILE_DESTINATION	= 'UI/GAMEFONT.TTF'
		},
	}
}

local __locale_text_import__ = {
---	New text ---
	UI_EMOTE_CHAT_FEED_CREATURE_ALT = {
		EN = [[Offer %PRODUCT%]]
	},

---	Existing text overwritten ---
	UI_SETTLEMENT_PROD_RATE_TIME = {
		EN = [[<IMG>PRODUCTSMALL<>%NUM% ready in <IMG>CLOCK<>%TIME%]]
	},
	UI_BIGGS_QUICK_MENU_AUTO_STN = {
		EN = [[%NAME%]]
	},
	UI_BIGGS_QUICK_MENU_AUTO_PLT = {
		EN = [[%NAME%]]
	},
	INTRCT_EMPTY = {
		EN = [[ ]]
	},
	QUICK_MENU_TIP_THIRDPERSONSHIP = {
		EN = [[Toggle Camera View]]
	},
	NOTIFY_BINOCULARS			= { EN = ' ' },
	NOTIFY_BOOST				= { EN = ' ' },
	NOTIFY_SHIPBOOST			= { EN = ' ' },
	NOTIFY_SHIPJUMP				= { EN = ' ' },
	NOTIFY_SCANNER				= { EN = ' ' },
	NOTIFY_JETPACK				= { EN = ' ' },
	NOTIFY_NOJETPACK			= { EN = ' ' },
	NOTIFY_SHIPJUMP_PC			= { EN = ' ' },
	NOTIFY_TORCH				= { EN = ' ' },
	NOTIFY_TAKEOFF				= { EN = ' ' },
	UI_CREATURE_MOUNT_TITLE		= { EN = ' ' },
	UI_CREATURE_MOUNT_MSG		= { EN = ' ' },
	UI_NEXUS_SALVAGE_TITLE		= { EN = ' ' },
	UI_NEXUS_TECHFRAG_TITLE		= { EN = ' ' },
	UI_NOTIFY_SHIP_SUMMON		= { EN = ' ' },
	UI_NOTIFY_TAKEOFF			= { EN = ' ' },
	UI_NOTIFY_LASER_SUB			= { EN = ' ' },
	UI_NOTIFY_LASER_MSG3		= { EN = ' ' },
	UI_NOTIFY_EXOCRAFT_TIP_TITLE= { EN = ' ' },
	UI_NOTIFY_SHIP_TIP_TITLE	= { EN = ' ' },
	UI_NOTIFY_TIP_TITLE			= { EN = ' ' },
	UI_NOTIFY_LASER_OSD			= { EN = ' ' },
	UI_BIGGS_STORE_BOX_TITLE	= { EN = ' ' },
	UI_BIGGS_STORE_BOX_MSG		= { EN = ' ' },
	UI_BIGGS_AUTOPILOT_TITLE	= { EN = ' ' },
	UI_BIGGS_AUTOPILOT_MSG		= { EN = ' ' },

}--- __locale_text_import__ (do not delete)

--[[>-<LocTable>-<
--<< New texts >>--
=UI_EMOTE_CHAT_FEED_CREATURE_ALT
EN =Offer %PRODUCT%

--<< Existing texts >>--
=UI_SETTLEMENT_PROD_RATE_TIME
EN =<IMG>PRODUCTSMALL<>%NUM% ready in <IMG>CLOCK<>%TIME%

=UI_BIGGS_QUICK_MENU_AUTO_STN
EN =%NAME%
--<<Autopilot request: %NAME%>>--

=UI_BIGGS_QUICK_MENU_AUTO_PLT
EN =%NAME%
--<<Autopilot request: planet %NAME%>>--

=PC_MENU_QUIT_TO_DESKTOP
EN =Just Go Away

=INTRCT_EMPTY
EN = 

=MECH_SCAN_FACT
EN =Industrial Facilities

=VEHICLE_BUILDING_NPC
EN =Racial Monuments

=SIGNAL_PLAQUE
EN =Racial Plaque Detected

=SIGNAL_MONOLITH
EN =Racial Monolith Detected

=QUICK_MENU_TIP_THIRDPERSONSHIP
EN =Toggle Camera View

=NOTIFY_BINOCULARS
EN = 

=NOTIFY_BOOST
EN = 

=NOTIFY_SHIPBOOST
EN = 

=NOTIFY_SHIPJUMP
EN = 

=NOTIFY_SCANNER
EN = 

=NOTIFY_JETPACK
EN = 

=NOTIFY_NOJETPACK
EN = 

=NOTIFY_SHIPJUMP_PC
EN = 

=NOTIFY_TORCH
EN = 

=NOTIFY_TAKEOFF
EN = 

=UI_CREATURE_MOUNT_TITLE
EN = 

=UI_CREATURE_MOUNT_MSG
EN = 

=UI_NEXUS_SALVAGE_TITLE
EN = 

=UI_NEXUS_TECHFRAG_TITLE
EN = 

=UI_NOTIFY_SHIP_SUMMON
EN = 

=UI_NOTIFY_TAKEOFF
EN = 

=UI_NOTIFY_LASER_SUB
EN = 

=UI_NOTIFY_LASER_MSG3
EN = 

=UI_NOTIFY_EXOCRAFT_TIP_TITLE
EN = 

=UI_NOTIFY_SHIP_TIP_TITLE
EN = 

=UI_NOTIFY_TIP_TITLE
EN = 

=UI_NOTIFY_LASER_OSD
EN = 

=UI_BIGGS_STORE_BOX_TITLE
EN = 

=UI_BIGGS_STORE_BOX_MSG
EN = 

=UI_BIGGS_AUTOPILOT_TITLE
EN = 

=UI_BIGGS_AUTOPILOT_MSG
EN = 

>-<LocTable>-<]]
