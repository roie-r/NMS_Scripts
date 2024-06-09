-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_exml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_exml_2_lua.lua')
-----------------------------------------------------------------------------------------

local function ConvertMbin(mbin)
	function fileExists(path)
		local f = io.open(path, "r")
		return f ~= nil and io.close(f)
	end
	if not fileExists(mbin:gsub('.MBIN$', '.EXML')) then
		os.execute(string.format(
			'D:/MODZ_stuff/NoMansSky/Tools/AMUMSS/MODBUILDER/MBINCompiler.latest.exe convert -y -q --input-format=MBIN %s',
			mbin
		))
	end
end

local mbin = {
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/CATALOGUECRAFTING.MBIN',											-- 1
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/MISSIONS/SEASONALMISSIONTABLE.MBIN',							-- 2
	'D:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.MBIN',	-- 3
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/REWARDTABLE.MBIN',										-- 4
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN',				-- 5
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN',						-- 6
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/VOXELGENERATORSETTINGS.MBIN',						-- 7
	'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSFULL.MBIN',	-- 8
}
-----------------------------------------------------------------------------------------
local index	 = 6
local tbl_08 = 'EXML_SOURCE'

ConvertMbin(mbin[index])
local r_src  = io.open(mbin[index]:gsub('.MBIN$', '.EXML'), 'r')
local w_src  = io.open('d:/_dump/'..tbl_08..'.lua', 'w')

w_src:write( PrintExmlAsLua({exml=r_src:read('*a'), name=tbl_08}) )
r_src:close()
w_src:close()

print('saved '..tbl_08..' LUA to _dump')
---------------------------------------------------------------------------------------
-- dofile('d:/_dump/'..tbl_08..'.lua')
-- io.open('d:/_dump/'..tbl_08..'.EXML', 'w'):write(FileWrapping(EXML_SOURCE))

-- print('saved '..tbl_08..' EXML to _dump')
