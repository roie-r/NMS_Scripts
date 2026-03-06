------------------------------------------------------------------
dofile('Dictionary.lua')
------------------------------------------------------------------
local mod_desc = [[
  Disable all multiplayer damage
  Reduce damage to creatures from mining laser
  !(doesn't work) Reduce self-inflicted damage from vehicle gun
  proper icon for the mech inventory
  More items at shops
  Higher substance amount at shops
  Add ship parts to various shops
]]----------------------------------------------------------------

local mx_ct = {
	{
		SPECIAL_KEY_WORDS	= {'Id', 'MP_ONFOOT',	'DamageType', 'VehicleGun'},
		SECTION_UP			= 1,
		SEC_SAVE_TO			= 'gc_damage_multiplier'
	},
	{
		SEC_EDIT 			= 'gc_damage_multiplier',
		VALUE_CHANGE_TABLE 	= {
			{'Multiplier',	0}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'Id', 'SELF_VEHICLE'},
		PRECEDING_KEY_WORDS = 'Multipliers',
		CREATE_HOS			= true,
		SEC_ADD_NAMED		= 'gc_damage_multiplier'
	},
	{
		SEC_EDIT 			= 'gc_damage_multiplier',
		VALUE_CHANGE_TABLE 	= {
			{'DamageType',	'Explosion'}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'Id', 'SELF_VEHICLE'},
		PRECEDING_KEY_WORDS = 'Multipliers',
		SEC_ADD_NAMED		= 'gc_damage_multiplier'
	},
	{
		SPECIAL_KEY_WORDS	= {'ID', 'UI_BUGS_HINT'},
		PRECEDING_KEY_WORDS = 'Icon',
		VALUE_CHANGE_TABLE 	= {
			{'Filename',	'TEXTURES/UI/HUD/ICONS/PICKUPS/PICKUP.GRUB.DDS'}
		}
	},
	{
		REPLACE_TYPE 		= 'All',
		SPECIAL_KEY_WORDS	= {'Filename', 'TEXTURES/UI/HUD/ICONS/PICKUPS/PICKUP.TERRAIN.DDS'},
		SECTION_UP			= 1,
		AKW					= 'IconBinocs', -- AFTER_KEY_WORDS ??
		VALUE_CHANGE_TABLE 	= {
			{'Filename',	'TEXTURES/UI/HUD/ICONS/SCANNING/PICKUP.TERRAIN.DDS'}
		}
	},
	{
		REPLACE_TYPE 		= 'All',
		SPECIAL_KEY_WORDS	= {
			{'Id', 'MP_ONFOOT'},
			{'Id', 'MP_SHIP'},
			{'Id', 'MP_VEHICLE'}
		},
		VALUE_CHANGE_TABLE 	= {
			{'Multiplier',	0}
		}
	},
	{-- add modifiers for auto-ingestor: jetpack drain
		SPECIAL_KEY_WORDS	= {'Suit_Jetpack_Tank', 'GcMinMaxFloat'},
		VALUE_CHANGE_TABLE 	= {
			{'Min',			3}, -- 1
			{'Max',			6}, -- 3
		}
	},
	{-- old bug fix
		SPECIAL_KEY_WORDS	= {'TransferMech', 'TkTextureResource'},
		VALUE_CHANGE_TABLE 	= {
			{'Filename',	'TEXTURES/UI/FRONTEND/ICONS/CATEGORIES/INVCAT.MECH.DDS'}
		}
	},
	{--	More items at shops
		REPLACE_TYPE 		= 'All',
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		PRECEDING_KEY_WORDS = 'TradeSettings',
		VALUE_CHANGE_TABLE 	= {
			{'MinItemsForSale',	1.5},
			{'MaxItemsForSale',	2}
		}
	},
	{--	Higher substance amount at shops
		REPLACE_TYPE 		= 'All',
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		PRECEDING_KEY_WORDS = 'MinAmountOfSubstanceAvailable',
		VALUE_CHANGE_TABLE 	= {
			{'Poor',		1.5},
			{'Average',		2},
			{'Wealthy',		3},
			{'Pirate',		2}
		}
	},
	{--	Higher substance amount at shops
		REPLACE_TYPE 		= 'All',
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		PRECEDING_KEY_WORDS = 'MaxAmountOfSubstanceAvailable',
		VALUE_CHANGE_TABLE 	= {
			{'Poor',		1.5},
			{'Average',		2},
			{'Wealthy',		3},
			{'Pirate',		2}
		}
	}
}

local prp_val = '<Property name="%s" value="%s"/>'

-- "move" fossils to optional shop items instead of alwayspresent
mx_ct[#mx_ct+1] = {
	SPECIAL_KEY_WORDS	= {'BoneShop', 'GcTradeData'},
	PRECEDING_KEY_WORDS = 'AlwaysPresentProducts',
	REMOVE				= 'Section'
}
local fosil = {}
for id, dat in pairs(DICTIONARY) do
	if dat.category == 'ExhibitBone' then
		fosil[#fosil+1] = prp_val:format('OptionalProducts', id)
	end
end
mx_ct[#mx_ct+1] = {
	SPECIAL_KEY_WORDS	= {'BoneShop', 'GcTradeData'},
	PRECEDING_KEY_WORDS = 'OptionalProducts',
	CREATE_HOS			= true,
	ADD					= table.concat(fosil)
}
-- Add to bones shop barter options
local barters = {
	'FOS_BI_TAIL_E',
	'FOS_BI_TAIL_F',
	'FOS_BI_TAIL_G',
	'FOS_HEAD_DJ',
	'FOS_HEAD_IG',
	'STONE_EYE_PROD',
	'STORM_CRYSTAL',
	'CAVECUBE',
	'ALBUMENPEARL',
	'GRAVBALL',
	'CLAMPEARL',
	'SACVENOM',
	'DEEPSEA_PROD',
	'VENTGEM',
	'GEODE_ASTEROID',
	'GEODE_CRYSTAL',
	'GEODE_RARE',
	'TRA_MINERALS1',
	'TRA_MINERALS2',
	'TRA_MINERALS3',
	'TRA_MINERALS4',
	'TRA_MINERALS5',
}
for i, id in pairs(barters) do
	barters[i] = prp_val:format('AlwaysConsideredBarterProducts', id)
end
mx_ct[#mx_ct+1] = {
	SPECIAL_KEY_WORDS	= {'BoneShop', 'GcTradeData'},
	PRECEDING_KEY_WORDS = 'AlwaysConsideredBarterProducts',
	ADD_OPTION			= 'AddEndSection',
	ADD					= table.concat(barters)
}

-- replace damage multipliers
for _,dmg in ipairs({
	{id='DOOR',				dt='Laser',			ml=0.15},
	{id='DEPOT',			dt='Laser',			ml=0.01},
	{id='CREATURE',			dt='Laser',			ml=0.1},
	{id='ROBOT',			dt='VehicleLaser',	ml=0.3},
	{id='FIEND',			dt='Laser',			ml=0.1},
	{id='SELF_ONFOOT',		dt='Cannon',		ml=0.01},
	{id='SELF_ONFOOT',		dt='Explosion',		ml=0.02},
}) do
	mx_ct[#mx_ct+1] = {
		SECTION_UP			= 1,
		SPECIAL_KEY_WORDS	= {'Id', dmg.id, 'DamageType', dmg.dt},
		VALUE_CHANGE_TABLE	= {
			{'Multiplier',	dmg.ml}
		}
	}
end

local shop_shipparts_patterns = {
	ExpShip		= {-- mid-space korvax
		'.-N_WING[A-F].-',		-- explorer wings A-F
		'.-L_WING[AB][A-E].-',	-- sailship wings AB
	},
	TraShip		= {-- mid-space gek
		'.-S_WING[12AB].-',		-- dropship wings 12AB
		'.-S_ENGI[AC].-',		-- dropship engines
		'.-L_WING[CD][A-E].-',	-- sailship wings CD
	},
	WarShip		= {-- mid-space vykeen
		'.-T_WING[ABDEF].-',	-- fighter wings  ABDEF
		'.-T_ENGI.-',			-- fighter engines
		'.-L_WING[EF][A-E].-',	-- sailship wings EF
	},
	LoneExp		= {-- landing pad korvax
		'.-N_WING[GHIKLT].-',	-- explorer wings GHIKLT
		'.-L_WING[AB][A-E].-',	-- sailship wings AB
	},
	LoneTra		= {-- landing pad gek
		'.-S_WING[CDES].-',		-- dropship wings CDES
		'.-S_ENGI[BCS].-',		-- dropship engines
		'.-L_WING[CD][A-E].-',	-- sailship wings CD
	},
	LoneWar		= {-- landing pad vykeen
		'.-T_WING[GHIJK].-',	-- fighter wings  GHIJK
		'.-T_ENGI.-',			-- fighter engines
		'.-L_WING[EF][A-E].-',	-- sailship wings EF
	},
	PirateVisitor= {-- ?
		'.-[TSN]_COC.-',		-- cockpit all
		'.-L_SAIL[ABC].-',		-- sailship sail
	},
	Shop		= {-- trade terminal
		'.-S_COC.-',			-- cockpit dropship
		'.-L_SAIL[ABC].-',		-- sailship sail
	},
	TechShop	= {-- minor settlement
		'.-T_COC.-', 			-- cockpit fighter
		'.-L_SAIL[ABC].-',		-- sailship sail
	},
	Scrap		= {-- station scraper
		'.-N_COC.-',			-- cockpit explorer
		'.-L_SAIL[ABC].-',		-- sailship sail
	},
	IllegalProds= {-- illegals shop pilot
		'.-[ST]_ENGI.-',		-- engines all
		'.-L_BODY[A-F].-',		-- sailship body
	},
	BuilderShop	= {-- robot camp
		'.-[ST]_ENGI.-',		-- engines all
		'.-L_BODY[A-F].-',		-- sailship body
	}
}
local ship_parts = {}
for id, dat in pairs(DICTIONARY) do
	if dat.source == 'ModularCustomisationProducts' and dat.category == 'CustomisationPart' then
		ship_parts[#ship_parts+1] = id
	end
end
for shop, patterns in pairs(shop_shipparts_patterns) do
	local T = {}
	for _,id in ipairs(ship_parts) do
		for _,p in ipairs(patterns) do
			if id:match(p) then
				T[#T+1] = prp_val:format('OptionalProducts', id)
			end
		end
	end
	mx_ct[#mx_ct+1] = {
		SPECIAL_KEY_WORDS	= {shop, 'GcTradeData'},
		PRECEDING_KEY_WORDS = 'OptionalProducts',
		ADD					= table.concat(T)
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ REALITY default',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {
	{
		MBIN_CHANGE_TABLE	= {
			{
				MBIN_FILE_SOURCE 	= 'METADATA/REALITY/DEFAULTREALITY.MBIN',
				EXML_CREATE			= false,
				MXML_CHANGE_TABLE	= mx_ct
			}
		}
	}
}}
