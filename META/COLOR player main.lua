----------------------------------------------------
dofile('LIB/lua_2_exml.lua')
----------------------------------------------------
mod_desc = [[
  true black for ships & customizing palettes
  procedural royal ship palette
  * hex color is in ARGB format
]]--------------------------------------------------

local base_colors = {
	paint = {
		enabled		= true,
		name		= 'Paint',
		num_colors	= 'All',
		palette		= {
			'FFD6D6D6',
			'FFFFFFFF',
			'FF555555',
			'FFC7C7C7',
			'FFFFFFFF',
			{1,	-0.86,	-0.86,	-0.86},
			'EBEBEBFF',
			{1,	-1,		-1,		-1},
			{1,	-1,		-1,		-1},
			'FFB3B3B3',
			'FF808080',
			'FF4D4D4D',
			'FF262626',
			{1,	-1,		-1,		-1},
			{1,	-0.1,	-0.1,	-0.1},
			{1,	-0.9,	-0.9,	-0.9},
			'FF490910',
			'FF5A0B12',
			'FF7F1521',
			'FF991924',
			'FF4D0008',
			'FF63000B',
			'FF7F0B11',
			'FF991919',
			'FFAD421B',
			'FFC1551F',
			'FFD8732B',
			'FFC16911',
			'FFD37D1F',
			'FFDAAE03',
			'FFECD409',
			'FFFFF319',
			'FFFFFA42',
			'FFF7FF66',
			'FFA5DD39',
			'FF7CC731',
			'FF4E952A',
			'FF104C29',
			'FF135B31',
			'FF18713D',
			'FF1E8D47',
			'FF22A251',
			'FF176761',
			'FF1F8A81',
			'FF4DBAB1',
			'FF15506E',
			'FF1B688F',
			'FF2691C6',
			'FF5EB8E5',
			'FF89CBE5',
			'FF083980',
			'FF1746A0',
			'FF1B5EB6',
			'FF2C82D3',
			'FF051766',
			'FF0E227A',
			'FF103195',
			'FF1740AC',
			'FF310F4F',
			'FF4A166C',
			'FF804DB5',
			'FFCF8DCE',
			'FFC977B7',
			'FF904683'
		}
	},
	royals = {
		enabled		= true,
		name		= 'SpaceBottom',
		num_colors	= 'All',
		palette		= {
			'FF4356FF',
			'FFC67608',
			'FFB2AB00',
			'FF9ADB05',
			'FFD3B916',
			'FF03FFC7',
			'FF848E9A',
			'FF06B4FF',
			'FF16B9FF',
			'FF08AAF6',
			'FF961AFF',
			'FF770348',
			'FFAF0549',
			'FF380202',
			'FFAD5151',
			'FFFF795C',
			'FFA0B483',
			'FF3C8690',
			'FF264669',
			'FF6171FF',
			'FFC444AA',
			'FF0B9648',
			'FF3E5D7F',
			'FF771D60',
			'FF823737',
			'FF2D0C0C',
			'FF885B29',
			'FF0E442D',
			'FF0D1923',
			'FF381F36',
			'FFA51F02',
			'FF0B808A',
			'FF480D67',
			'FF637805',
			'FF4199EA',
			'FF6392FF',
			'FF5F8E53',
			'FF733233',
			'FF2C4F8F',
			'FFB5842D',
			'FF824965',
			'FFA72727',
			'FF5E397B',
			'FF741142',
			'FF106345',
			'FF866B6B',
			'FF81362F',
			'FF0B0942',
			'FF74C9BA',
			'FF3C90DE',
			'FFAD86CF',
			'FFE584C2',
			'FFFFFFFF',
			'FF4C4C4C',
			'FF8C3737',
			'FF8A5E47',
			'FFC09D70',
			'FF3E7A57',
			'FF3E6F70',
			'FF3B4A67',
			'FF5E4770',
			'FF8F556C',
			'FFAAAAAA',
			{-1,	-1,		-1},
		}
	},
	bioship_body = {
		enabled		= true,
		name		= 'BioShip_Body',
		num_colors	= '_16',
		palette		= {
			'FFFFFFFF',
			'FFFFFFFF',
			'FF737373',
			'FF737373',
			{1,	-1,		-1,		-1},
			{1,	-1,		-1,		-1},
			'FF1D120D',
			'FF1D120D',
			'FFFFFFFF',
			'FFFFFFFF',
			'FF737373',
			'FF737373',
			{1,	-1,		-1,		-1},
			{1,	-1,		-1,		-1},
			'FF1D120D',
			'FF1D120D',
			'FF630005',
			'FF630005',
			'FFAD421B',
			'FFAD421B',
			'FFC16911',
			'FFC16911',
			'FFDAAE03',
			'FFDAAE03',
			'FF630005',
			'FF630005',
			'FFAD421B',
			'FFAD421B',
			'FFC16911',
			'FFC16911',
			'FFDAAE03',
			'FFDAAE03',
			'FFF2E81B',
			'FFF2E81B',
			'FF6EB527',
			'FF6EB527',
			'FF094C25',
			'FF094C25',
			'FF139099',
			'FF139099',
			'FFF2E81B',
			'FFF2E81B',
			'FF6EB527',
			'FF6EB527',
			'FF094C25',
			'FF094C25',
			'FF139099',
			'FF139099',
			'FF2B76C1',
			'FF2B76C1',
			'FF0B2072',
			'FF0B2072',
			'FF3D0B5B',
			'FF3D0B5B',
			'FF7E3A72',
			'FF7E3A72',
			'FF2B76C1',
			'FF2B76C1',
			'FF0B2072',
			'FF0B2072',
			'FF3D0B5B',
			'FF3D0B5B',
			'FF7E3A72',
			'FF7E3A72'
		}
	},
	bioship_skin = {
		enabled		= true,
		name		= 'BioShip_Underbelly',
		num_colors	= '_16',
		palette		= {
			'FFFFFFFF',
			'F5FFF5F5',
			'FFFFFFFF',
			'F3FFEDF2',
			'FFC0A58F',
			'FFC0A58F',
			'FFA7886E',
			'FFA7886E',
			'FFFFFFFF',
			'FFFFFFFF',
			'FFFFFFFF',
			'FFFFFFFF',
			'FFC0A58F',
			'FFC0A58F',
			'FFA7886E',
			'FFA7886E',
			'FFDA837D',
			'FFDA837D',
			'FFF6A980',
			'FFF6A980',
			'FFFECE8B',
			'FFFECE8B',
			'FFFFEC8F',
			'FFFFEC8F',
			'FFDA837D',
			'FFDA837D',
			'FFF6A980',
			'FFF6A980',
			'FFFECE8B',
			'FFFECE8B',
			'FFFFEC8F',
			'FFFFEC8F',
			'FFFFFF92',
			'FFFFFF92',
			'FFD7F699',
			'FFD7F699',
			'FFB7EFA4',
			'FFB7EFA4',
			'FFA5EDD5',
			'FFA5EDD5',
			'FFFFFF92',
			'FFFFFF92',
			'FFD7F699',
			'FFD7F699',
			'FFB7EFA4',
			'FFB7EFA4',
			'FFA5EDD5',
			'FFA5EDD5',
			'FFA7E2FB',
			'FFA7E2FB',
			'FF96B9FE',
			'FF96B9FE',
			'FFC2ADED',
			'FFC2ADED',
			'FFF4CEF8',
			'FFF4CEF8',
			'FFA7E2FB',
			'FFA7E2FB',
			'FF96B9FE',
			'FF96B9FE',
			'FFC2ADED',
			'FFC2ADED',
			'FFF4CEF8',
			'FFF4CEF8'
		}
	}
}

local function RebuildPaletteColors(gc_data)
	local function asc2prc(as)
		for i=1, #as do
			as[i] = math.floor(as[i] / 255 * 1000) / 1000
		end
		return as
	end
	local function Convert2Rgb(color)
		if type(color) == 'string' then
			return {c=color}
		elseif  color[1] > 1 or color[2] > 1 or color[3] > 1 then
			return asc2prc(color)
		end
		return color
	end
	local T = {}
	for _,col in ipairs(gc_data.palette) do
		T[#T+1] = ColorData(Convert2Rgb(col))
	end
	-- Assign the exml table with its designated meta
	T.META = {'name', 'Colours'}
	return ToExml(T)
end

local function EditSingle(name, i, rgba)
	return {
		SPECIAL_KEY_WORDS	= {name, 'GcPaletteData.xml'},
		PRECEDING_KEY_WORDS = 'Colour.xml',
		SECTION_ACTIVE		= -i,
		VALUE_CHANGE_TABLE 	= {
			{'R',	rgba[1]},
			{'G',	rgba[2]},
			{'B',	rgba[3]},
			{'A',	rgba[4] or 1}
		}
	}
end

local function AddToChangeTable()
	local T = {}
	T[1] = {
		SKW		= {},
		PKW		= 'Colours',
		REMOVE	= 'Section'
	}
	for _,gc_data in pairs(base_colors) do
		if gc_data.enabled then
			T[1].SKW[#T[1].SKW + 1] = {gc_data.name, 'GcPaletteData.xml'}
			T[#T+1] = {
				PRECEDING_KEY_WORDS = gc_data.name,
				VALUE_CHANGE_TABLE 	= {
					{'NumColours',	gc_data.num_colors}
				}
			}
			T[#T+1] = {
				PRECEDING_KEY_WORDS = gc_data.name,
				ADD 				= RebuildPaletteColors(gc_data)
			}
		end
	end
	-- dimmer sailship gray sail
	for i=2, 58, 8 do
		T[#T+1] = EditSingle('SailShip_Sails', i, {0.36, 0.38, 0.42})
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META player main palettes.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.38',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,UNUSED_VARIABLE',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.MBIN',
		EXML_CHANGE_TABLE	= AddToChangeTable()
	},
	{
	--	|true black| in customizing palettes
		MBIN_FILE_SOURCE	= 'METADATA/GAMESTATE/PLAYERDATA/CUSTOMISATIONCOLOURPALETTES.MBIN',
		EXML_CHANGE_TABLE	= {
			[1] = EditSingle('Player',				20, {-1, -1, -1}),
			[2] = EditSingle('Freighter',			20, {-1, -1, -1}),
			[3] = EditSingle('Vehicle',				20, {-1, -1, -1}),
			[4] = EditSingle('Vehicle_Bike',		20, {-1, -1, -1}),
			[5] = EditSingle('Vehicle_Truck',		20, {-1, -1, -1}),
			[6] = EditSingle('Vehicle_WheeledBike',	20, {-1, -1, -1}),
			[7] = EditSingle('Vehicle_Submarine',	20, {-1, -1, -1}),
			[8] = EditSingle('Vehicle_Mech',		20, {-1, -1, -1}),
		}
	}
}}}}
