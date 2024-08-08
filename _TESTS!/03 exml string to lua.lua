-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_exml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_exml_2_lua.lua')
-----------------------------------------------------------------------------------------

section_08 = [[
<Property value="TkMaterialFlags.xml">
			<Property name="MaterialFlag" value="_F07_UNLIT"/>
		</Property>]]

-- local a = ToLua(section_08)

local tbl_08 = 'exml_source'

local w_src = io.open('d:/_dump/'..tbl_08..'.lua', 'w')

w_src:write(PrintExmlAsLua({exml=section_08}))
w_src:close()
print('saved '..tbl_08..' LUA to _dump')
