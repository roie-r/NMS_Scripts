------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
------------------------------------------------------
local mod_desc = [[
  Vykeen monolith accepts Effigy instead of dagger
  cheaper slots
]]----------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY various',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_BATCHNAME		= '+REALITY ~@~collection',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|INVENTORY|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/INVENTORYTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = {'ShipInventoryMaxUpgradeSize', 'Corvette', 'MaxTechInventoryCapacity'},
				VALUE_CHANGE_TABLE 	= {
					{'A',			60}, -- 50
					{'S',			80}, -- 60
				}
			}
		}
	},
	{--	|SUBSTANCES|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCSUBSTANCETABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= (
			function()
				local T = {}
				for id, sym in pairs({
					EX_YELLOW	= 'UI_CU_EX_SYM',
					EX_RED		= 'UI_CD_EX_SYM',
					EX_GREEN	= 'UI_EM_EX_SYM',
					EX_BLUE		= 'UI_IN_EX_SYM',
					EX_PURPLE	= 'UI_QU_EX_SYM',
					SPACEGUNK1	= 'UI_SGUNK1_SYM',
					SPACEGUNK2	= 'UI_SGUNK2_SYM',
					SPACEGUNK3	= 'UI_SGUNK3_SYM',
					SPACEGUNK4	= 'UI_SGUNK4_SYM',
					SPACEGUNK5	= 'UI_SGUNK5_SYM',
					TIMEDUST	= 'UI_TIMEDUST_SYM',
					TIMEMILK	= 'UI_TIMEMILK_SYM',
					ROBOT2		= 'UI_ROBOT2_SYM',
				}) do
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'ID', id},
						VALUE_CHANGE_TABLE 	= {
							{'Symbol',		sym}
						}
					}
				end
				for id, rgb in pairs({
					AF_METAL	= 'Ff8a7f72',	-- tainted metal
					ROCKETSUB	= 'Ff355a7d',	-- tritium
					LAVA1		= 'Ff354f69',	-- basalt
					WATERWORLD1	= 'Ff284452',	-- lithium
				}) do
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'ID', id},
						PRECEDING_KEY_WORDS = 'Colour',
						VALUE_CHANGE_TABLE 	= Hex2VCT(rgb)
					}
				end
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'ID', 'RADIO1'},
					VALUE_CHANGE_TABLE 	= {
						{'SubstanceCategory', 'Fuel'}
					}
				}
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'ID', 'RUINSUB', 'Icon', 'TkTextureResource'},
					VALUE_CHANGE_TABLE 	= {
						{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/U4SUBSTANCES/SUBSTANCE.RUIN.DUST.DDS'}
					}
				}
				return T
			end
		)()
	},
	{--	|COSTTABLE|
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/COSTTABLE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Id', 'WAR_FIND_PORTAL', 'Id', 'WAR_CURIO2'},
				VALUE_CHANGE_TABLE 	= {
					{'Id',			'WAR_CURIO1'}
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Id', 'C_PILOT_.-'},
					{'Id', 'C_PET_SLOT'},
					{'Id', 'C_WEAP_UPGRADE'},
					{'Id', 'C_INV_WEAP_C.-'},
					{'Id', 'C_INV_SAL_CASH.-'}
				},
				REPLACE_TYPE 		= 'All',
				INTEGER_TO_FLOAT	= 'Preserve',
				MATH_OPERATION 		= '*',
				PRECEDING_KEY_WORDS = 'Costs',
				VALUE_CHANGE_TABLE 	= {
					{'Costs',		0.2}
				}
			}
		}
	},
	{--	|QS shop| remove fireworks
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/PURCHASEABLESPECIALS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', 'SPEC_FIREWORK.-'},
					{'ID', 'ODD_EGG'},
					{'ID', 'MYSTERY_BEACON'}
				},
				REMOVE				= 'Section'
			}
		}
	},
	{--	|Seasons shop| remove unwanted
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/UNLOCKABLESEASONREWARDS.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS 	= {
					{'ID', '.-FIREPACK.-'},
					{'ID', 'MYSTERY_TRACKER'},
					{'ID', 'S10_PART1B'},
					{'ID', 'EXPD_TITLE18'}
				},
				REMOVE				= 'Section'
			}
		}
	}
}}}}

local __locale_text_import__ = {
---	New text ---
	UI_CD_EX_SYM		= { EN = [[Cd+]]},
	UI_EM_EX_SYM		= { EN = [[Em+]]},
	UI_IN_EX_SYM		= { EN = [[In+]]},
	UI_CU_EX_SYM		= { EN = [[Cu+]]},
	UI_QU_EX_SYM		= { EN = [[Qu+]]},
	UI_SGUNK1_SYM		= { EN = [[Ю]]	},
	UI_SGUNK2_SYM		= { EN = [[Ψ]]	},
	UI_SGUNK3_SYM		= { EN = [[FeO]]},
	UI_SGUNK4_SYM		= { EN = [[Щ]]	},
	UI_SGUNK5_SYM		= { EN = [[œ]]	},
	UI_TIMEDUST_SYM		= { EN = [[Љ]]	},
	UI_TIMEMILK_SYM		= { EN = [[Ҩ]]	},
	UI_ROBOT2_SYM		= { EN = [[An]]	},

---	Existing text overwritten ---
	UI_LAUNCHSUB2_SYM	= { EN = [[H2]]	},
	UI_HEXITE_SYM		= { EN = [[Ӂ]]	},
	UI_SUNGOLD_SYM		= { EN = [[ζ]]	},
	UI_SOULFRAG_SYM		= { EN = [[§]]	},
	UI_WORMDUST_SYM		= { EN = [[∂]]	},

}--- __locale_text_import__ (do not delete)

--[[>-<LocTable>-<
--<< New texts >>--
=UI_CD_EX_SYM
EN = Cd+

=UI_EM_EX_SYM
EN = Em+

=UI_IN_EX_SYM
EN = In+

=UI_CU_EX_SYM
EN = Cu+

=UI_QU_EX_SYM
EN = Qu+

=UI_SGUNK1_SYM
EN = Ю

=UI_SGUNK2_SYM
EN = Ψ

=UI_SGUNK3_SYM
EN = FeO

=UI_SGUNK4_SYM
EN = Щ

=UI_SGUNK5_SYM
EN = œ

=UI_TIMEDUST_SYM
EN = Љ

=UI_TIMEMILK_SYM
EN = Ҩ

=UI_ROBOT2_SYM
EN = An

--<< Existing texts >>--
=UI_LAUNCHSUB2_SYM
EN = H2

=UI_HEXITE_SYM
EN = Ӂ

=UI_SUNGOLD_SYM
EN = ζ

=UI_SOULFRAG_SYM
EN = §

=UI_WORMDUST_SYM
EN = ∂

>-<LocTable>-<]]
