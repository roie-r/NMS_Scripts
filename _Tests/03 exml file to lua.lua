-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_mxml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_mxml_2_lua.lua')
-----------------------------------------------------------------------------------------

local function ConvertMbin(mbin)
	local function fileExists(path)
		local f = io.open(path)
		return f ~= nil and f:close()
	end
	if not fileExists(mbin:gsub('.mbin$', '.mxml')) then
		os.execute(
			('D:/MODZ_stuff/NoMansSky/Tools/AMUMSS/MODBUILDER/MBINCompiler.latest.exe -y -q %s'):format(mbin)
		)
	end
end

local function GetFileName(f)
	return f:match('([^\\/]+)%.')
end

local mbins = {
	'METADATA/REALITY/TABLES/REWARDTABLE.MBIN',														-- 1
	'METADATA/SIMULATION/MISSIONS/TABLES/MULTIPLAYERMISSIONTABLE.MBIN',								-- 2
	'MODELS/COMMON/PLAYER/PLAYERCHARACTER/PLAYERCHARACTER/ENTITIES/PLAYERCHARACTER.ENTITY.MBIN',	-- 3
	'METADATA/REALITY/DEFAULTREALITY.MBIN',															-- 4
	'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN',										-- 5
	'METADATA/REALITY/TABLES/NMS_MODULARCUSTOMISATIONPRODUCTS.MBIN',								-- 6
	'METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN',									-- 7
	'METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN',												-- 8
	'METADATA/GAMESTATE/PLAYERDATA/MODULARCUSTOMISATIONDATATABLE.MBIN',								-- 9
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN',							-- 10
	'METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.MBIN',										-- 11
	'GCGALAXYGLOBALS.GLOBAL.MBIN'																	-- 12
}
-----------------------------------------------------------------------------------------
local inx = 4

local mbin = mbins[inx]:lower()
if mbin:sub(2, 2) ~= ':' then
	mbin = 'D:/MODZ_stuff/NoMansSky/UNPACKED/'..mbin
end
ConvertMbin(mbin)
local fname	= GetFileName(mbin)
local r_src	= io.open(mbin:gsub('.mbin$', '.mxml'), 'r')
local w_src = nil
-----------------------------------------------------------------------------------------
--- PrintMxmlAsLua ---
w_src = io.open('d:/_dump/'..fname..'.lua', 'w')
w_src:write( PrintMxmlAsLua({mxml=r_src:read('*a'), use_id=true, sq_k=false, intern=false}) )
print('saved '..fname..' as PrintMxmlAsLua')
w_src:close()

--- write PrintMxmlAsLua back to mxml ---
-- local l2m = dofile('d:/_dump/'..fname..'.lua')
-- w_src = io.open('d:/_dump/'..fname..'.mxml', 'w')
-- w_src:write(ToMxmlFile(l2m))
-- print('saved '..fname..' PrintMxmlAsLua back to MXML')
-- w_src:close()
---------------------------------------------------------------------------------------
--- ToLua convert and write back to mxml ---
-- local m2l = ToLua(r_src:read('*a'))
-- w_src = io.open('d:/_dump/'..fname..'.MXML', 'w')
-- w_src:write(ToMxmlFile(m2l))
-- print('saved '..fname..' using ToLua back to MXML')
-- w_src:close()
---------------------------------------------------------------------------------------
r_src:close()
