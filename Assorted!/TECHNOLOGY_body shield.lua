----------------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/table_entry.lua')
----------------------------------------------------------------------------
mod_desc = [[
  balatant cheat to protect your person against bugs and annoying travelers
  * Text is added in the new language file script
  * The blueprint is added by 'Hazard Protection Unit' (REFRESH_HAZ reward)
  * Must be merged with the main Technology table script
]]--------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TECHNOLOGY addon body shield.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_BATCHNAME		= '__TABLE technology merged.pak',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Table',
				ADD					= ToExml(TechnologyEntry({
					id				= 'BODYSHIELD',
					name			= 'BODYSHIELD_NAME',
					namelower		= 'BODYSHIELD_NAME_L',
					subtitle		= 'BODYSHIELD_SUB',
					description		= 'BODYSHIELD_DESC',
					icon			= 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.SHIELD.RED2.DDS',
					color			= {c='095c77ff'},
					chargeable		= true,
					chargeamount	= 400,
					chargetype		= 'Catalyst',
					chargeby		= {'POWERCELL', 'CATALYST2', 'CATALYST1'},
					primaryitem		= true,
					category		= 'Suit',
					rarity			= 'Always',
					value			= 5,
					requirements	= { {'POWERCELL', 1, 'Product'} },
					basestat		= 'Suit_Armour_Shield',
					statbonuses		= {
						{'Suit_Armour_Shield',			1,	1},
						{'Suit_Armour_Shield_Strength',	24,	1},
						{'Suit_Armour_Health',			60,	20}
					},
					fragmentcost	= 980
				}))
			}
		}
	}
}}}}