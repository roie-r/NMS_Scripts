------------------------------------------------------------------
dofile('LIB/_exml_2_lua.lua')
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

local ECT = {
	{
		SPECIAL_KEY_WORDS	= {'Id', 'MP_ONFOOT',	'DamageType', 'VehicleGun'},
		SECTION_UP			= 1,
		SECTION_SAVE_TO		= 'gc_damage_multiplier'
	},
	{
		SECTION_EDIT 		= 'gc_damage_multiplier',
		INTEGER_TO_FLOAT	= 'Force',
		VALUE_CHANGE_TABLE 	= {
			{'Multiplier',	0}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'Id', 'SELF_VEHICLE'},
		PRECEDING_KEY_WORDS = 'Multipliers',
		CREATE_HOS			= true,
		SECTION_ADD_NAMED 	= 'gc_damage_multiplier'
	},
	{
		SECTION_EDIT 		= 'gc_damage_multiplier',
		VALUE_CHANGE_TABLE 	= {
			{'DamageType',	'Explosion'}
		}
	},
	{
		SPECIAL_KEY_WORDS	= {'Id', 'SELF_VEHICLE'},
		PRECEDING_KEY_WORDS = 'Multipliers',
		SECTION_ADD_NAMED 	= 'gc_damage_multiplier'
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
	{
		SPECIAL_KEY_WORDS	= {'TransferMech', 'TkTextureResource.xml'},
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
			{'Ignore',		1.5},
			{'Ignore',		2.5},
			{'Ignore',		3},
			{'Ignore',		2}
		}
	},
	{--	Higher substance amount at shops
		REPLACE_TYPE 		= 'All',
		MATH_OPERATION 		= '*',
		INTEGER_TO_FLOAT	= 'Preserve',
		PRECEDING_KEY_WORDS = 'MaxAmountOfSubstanceAvailable',
		VALUE_CHANGE_TABLE 	= {
			{'Ignore',		1.5},
			{'Ignore',		2.5},
			{'Ignore',		3},
			{'Ignore',		2}
		}
	}
}
for _,dmg in ipairs({
	{id='DOOR',				dt='Laser',			ml=0.15},
	{id='DEPOT',			dt='Laser',			ml=0.01},
	{id='CREATURE',			dt='Laser',			ml=0.1},
	{id='ROBOT',			dt='VehicleLaser',	ml=0.3},
	{id='FIEND',			dt='Laser',			ml=0.1},
	{id='SELF_ONFOOT',		dt='Cannon',		ml=0.01},
	{id='SELF_ONFOOT',		dt='Explosion',		ml=0.02},
}) do
	ECT[#ECT+1] = {
		INTEGER_TO_FLOAT	= 'Force',
		SECTION_UP			= 1,
		SPECIAL_KEY_WORDS	= {'Id', dmg.id, 'DamageType', dmg.dt},
		VALUE_CHANGE_TABLE	= {
			{'Multiplier',	dmg.ml}
		}
	}
end

local gc_products	= LoadRuntimeMbin('METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN') --<< preload_source_discard
local shipparts		= {}
for _,prd in ipairs(gc_products.template.Table) do
	if prd.Icon.Filename:match('.+SHIPPARTS.+') then
		shipparts[#shipparts+1] = prd.ID
	end
end

for _,trade in ipairs({
	{shop='ExpShip',			id= '.-N_WING[ABCDEF].-'},	-- mid-space korvax		: explorer wings ABCDEF
	{shop='TraShip',			id= '.-S_WING[12AB].-'},	-- mid-space gek		: dropship wings 12AB
	{shop='WarShip',			id= '.-T_WING[ABDEF].-'},	-- mid-space vykeen		: fighter wings  ABDEF
	{shop='LoneExp',			id= '.-N_WING[GHIKLT].-'},	-- landing pad korvax	: explorer wings GHIKLT
	{shop='LoneTra',			id= '.-S_WING[CDE].-'},		-- landing pad gek		: dropship wings CDE
	{shop='LoneWar',			id= '.-T_WING[GHIJK].-'},	-- landing pad vykeen	: fighter wings  GHIJK
	{shop='PirateVisitor',		id= '.-[TSN]_COC.-'},		-- ?					: cockpit all
	{shop='Shop',				id= '.-S_COC.-'},			-- trade station, orb?	: cockpit dropship
	{shop='TechShop',			id= '.-T_COC.-'}, 			-- minor settlement ?	: cockpit fighter
	{shop='Scrap',				id= '.-N_COC.-'},			-- station scraper		: cockpit explorer
	{shop='BuilderShop',		id= '.-[ST]_ENGI.-'}		-- robot/phage shop		: engines all
}) do
	ECT[#ECT+1] = {
		SPECIAL_KEY_WORDS	= {trade.shop, 'GcTradeData.xml'},
		PRECEDING_KEY_WORDS = 'OptionalProducts',
		ADD					= (
			function()
				local T = {}
				for _,part in ipairs(shipparts) do
					if part:match(trade.id) then
						T[#T+1] = string.format(
							'<Property value="NMSString0x10.xml"><Property name="Value" value="%s"/></Property>',
							part
						)
					end
				end
				return table.concat(T)
			end
		)()
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META default reality.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.64',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/DEFAULTREALITY.MBIN',
		EXML_CHANGE_TABLE	= ECT
	}
}}}}
