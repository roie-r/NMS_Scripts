---------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  true for ships & black in customizing palettes
  procedural royal ship palette
  math.floor(X / 255 * 1000) / 1000 == X * 0.00392
]]----------------------------------------------------------

local base_colors = {
	paint = {
		enabled		= true,
		name		= 'Paint',
		num_colors	= 'All',
		palette		= {
			'D6d6d6ff',
			'Ffffffff',
			'555555ff',
			'C7c7c7ff',
			'Ffffffff',
			{-0.998,-0.998,-0.998},
			'Ebebebff',
			{-1,	-1,		-1},
			{-0.999,-0.999,-0.999},
			'B3b3b3ff',
			'808080ff',
			'4d4d4dff',
			'262626ff',
			'000000ff',
			{-0.1,	-0.1,	-0.1},
			{-0.99,	-0.99,	-0.99},
			'490910ff',
			'5a0b12ff',
			'7f1521ff',
			'991924ff',
			'4d0008ff',
			'63000bff',
			'7f0b11ff',
			'991919ff',
			'Ad421bff',
			'C1551fff',
			'D8732bff',
			'C16911ff',
			'D37d1fff',
			'Daae03ff',
			'Ecd409ff',
			'Fff319ff',
			'Fffa42ff',
			'F7ff66ff',
			'A5dd39ff',
			'7cc731ff',
			'4e952aff',
			'104c29ff',
			'135b31ff',
			'18713dff',
			'1e8d47ff',
			'22a251ff',
			'176761ff',
			'1f8a81ff',
			'4dbab1ff',
			'15506eff',
			'1b688fff',
			'2691c6ff',
			'5eb8e5ff',
			'89cbe5ff',
			'083980ff',
			'1746a0ff',
			'1b5eb6ff',
			'2c82d3ff',
			'051766ff',
			'0e227aff',
			'103195ff',
			'1740acff',
			'310f4fff',
			'4a166cff',
			'804db5ff',
			'Cf8dceff',
			'C977b7ff',
			'904683ff'
		}
	},
	royals = {
		enabled		= true,
		name		= 'SpaceBottom',
		num_colors	= 'All',
		palette		= {
			'4356ffff',
			'c67608ff',
			'b2ab00ff',
			'9adb05ff',
			'd3b916ff',
			'03ffc7ff',
			'848e9aff',
			'06b4ffff',
			'16b9ffff',
			'08aaf6ff',
			'961affff',
			'770348ff',
			'af0549ff',
			'380202ff',
			'ad5151ff',
			'ff795cff',
			'a0b483ff',
			'3c8690ff',
			'264669ff',
			'6171ffff',
			'c444aaff',
			'0b9648ff',
			'3e5d7fff',
			'771d60ff',
			'823737ff',
			'2d0c0cff',
			'885b29ff',
			'0e442dff',
			'0d1923ff',
			'381f36ff',
			'a51f02ff',
			'0b808aff',
			'480d67ff',
			'637805ff',
			'4199eaff',
			'6392ffff',
			'5f8e53ff',
			'733233ff',
			'2c4f8fff',
			'b5842dff',
			'824965ff',
			'a72727ff',
			'5e397bff',
			'741142ff',
			'106345ff',
			'866b6bff',
			'81362fff',
			'0b0942ff',
			'74c9baff',
			'3c90deff',
			'ad86cfff',
			'e584c2ff',
			'ffffffff',
			'4c4c4cff',
			'8c3737ff',
			'8a5e47ff',
			'c09d70ff',
			'3e7a57ff',
			'3e6f70ff',
			'3b4a67ff',
			'5e4770ff',
			'8f556cff',
			'aaaaaaff',
			{-1,	-1,		-1},
		}
	},
	bioship_body = {
		enabled		= true,
		name		= 'BioShip_Body',
		num_colors	= '_16',
		palette		= {
			'ffffffff',
			'ffffffff',
			'737373ff',
			'737373ff',
			{-1,	-1,		-1},
			{-1,	-1,		-1},
			'1d120dff',
			'1d120dff',
			'ffffffff',
			'ffffffff',
			'737373ff',
			'737373ff',
			{-1,	-1,		-1},
			{-1,	-1,		-1},
			'1d120dff',
			'1d120dff',
			'630005ff',
			'630005ff',
			'ad421bff',
			'ad421bff',
			'c16911ff',
			'c16911ff',
			'daae03ff',
			'daae03ff',
			'630005ff',
			'630005ff',
			'ad421bff',
			'ad421bff',
			'c16911ff',
			'c16911ff',
			'daae03ff',
			'daae03ff',
			'f2e81bff',
			'f2e81bff',
			'6eb527ff',
			'6eb527ff',
			'094c25ff',
			'094c25ff',
			'139099ff',
			'139099ff',
			'f2e81bff',
			'f2e81bff',
			'6eb527ff',
			'6eb527ff',
			'094c25ff',
			'094c25ff',
			'139099ff',
			'139099ff',
			'2b76c1ff',
			'2b76c1ff',
			'0b2072ff',
			'0b2072ff',
			'3d0b5bff',
			'3d0b5bff',
			'7e3a72ff',
			'7e3a72ff',
			'2b76c1ff',
			'2b76c1ff',
			'0b2072ff',
			'0b2072ff',
			'3d0b5bff',
			'3d0b5bff',
			'7e3a72ff',
			'7e3a72ff'
		}
	},
	bioship_skin = {
		enabled		= true,
		name		= 'BioShip_Underbelly',
		num_colors	= '_16',
		palette		= {
			'ffffffff',
			'fff5f5f5',
			'ffffffff',
			'ffedf2f3',
			'c0a58fff',
			'c0a58fff',
			'a7886eff',
			'a7886eff',
			'ffffffff',
			'ffffffff',
			'ffffffff',
			'ffffffff',
			'c0a58fff',
			'c0a58fff',
			'a7886eff',
			'a7886eff',
			'da837dff',
			'da837dff',
			'f6a980ff',
			'f6a980ff',
			'fece8bff',
			'fece8bff',
			'ffec8fff',
			'ffec8fff',
			'da837dff',
			'da837dff',
			'f6a980ff',
			'f6a980ff',
			'fece8bff',
			'fece8bff',
			'ffec8fff',
			'ffec8fff',
			'ffff92ff',
			'ffff92ff',
			'd7f699ff',
			'd7f699ff',
			'b7efa4ff',
			'b7efa4ff',
			'a5edd5ff',
			'a5edd5ff',
			'ffff92ff',
			'ffff92ff',
			'd7f699ff',
			'd7f699ff',
			'b7efa4ff',
			'b7efa4ff',
			'a5edd5ff',
			'a5edd5ff',
			'a7e2fbff',
			'a7e2fbff',
			'96b9feff',
			'96b9feff',
			'c2adedff',
			'c2adedff',
			'f4cef8ff',
			'f4cef8ff',
			'a7e2fbff',
			'a7e2fbff',
			'96b9feff',
			'96b9feff',
			'c2adedff',
			'c2adedff',
			'f4cef8ff',
			'f4cef8ff'
		}
	}
}

local function RebuildPaletteColors(gc_data)
	local function hex2rgb(hex)
		local n = {}
		for i=1, (hex:len()/2) do
			n[#n+1] = tonumber(hex:sub(i*2-1, i*2), 16) * 0.00392
		end
		return n
	end
	local function asc2prc(as)
		for i=1, #as do as[i] = as[i] * 0.00392 end
		return as
	end
	local function Convert2Rgba(c)
		if type(c) == 'string' then
			return hex2rgb(c)
		elseif c[1] > 1 or c[2] > 1 or c[3] > 1 then
			return asc2prc(c)
		end
		return c
	end
	local T = {}
	for _,c in ipairs(gc_data.palette) do
		T[#T+1] = ColorData(Convert2Rgba(c))
	end
	-- Assign the exml table with its designated meta
	T.META = {'name', 'Colours'}
	return ToExml(T)
end

local function AddToChangeTable()
	local T = {}
	T[1] = {
		FSKWG	= {},
		PKW		= 'Colours',
		REMOVE	= 'Section'
	}
	for _,gc_data in pairs(base_colors) do
		if gc_data.enabled then
			T[1].FSKWG[#T[1].FSKWG + 1] = {gc_data.name, 'GcPaletteData.xml'}
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
	return T
end

local function EditSingle(name, i, rgba)
	return {
		SPECIAL_KEY_WORDS	= {name, 'GcPaletteData.xml'},
		PRECEDING_KEY_WORDS = 'Colour.xml',
		SECTION_ACTIVE		= i,
		VALUE_CHANGE_TABLE 	= {
			{'R',	rgba[1]},
			{'G',	rgba[2]},
			{'B',	rgba[3]},
			{'A',	rgba[4] or 1}
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META player main palettes.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				T = {}
				for i=2, 58, 8 do
					T[#T+1] = EditSingle('SailShip_Sails', i, {0.36, 0.38, 0.42})
				end
				return T
			end
		)()
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.MBIN',
		EXML_CHANGE_TABLE	= AddToChangeTable()
	},
	{
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
