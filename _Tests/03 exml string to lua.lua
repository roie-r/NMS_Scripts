-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_mxml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_mxml_2_lua.lua')
-----------------------------------------------------------------------------------------

section_08 = [[<Property name="Grass" value="GcPaletteData">
	<Property name="NumColours" value="All"/>
	<Property name="Colours">
		<Property name="Colours" _index="0">
			<Property name="R" value="0.678000"/>
			<Property name="G" value="0.573000"/>
			<Property name="B" value="0.518000"/>
			<Property name="A" value="1.000000"/>
		</Property>
		<Property name="Colours" _index="1">
			<Property name="R" value="0.464000"/>
			<Property name="G" value="0.305000"/>
			<Property name="B" value="0.219000"/>
			<Property name="A" value="1.000000"/>
		</Property>
		<Property name="Colours" _index="63">
			<Property name="R" value="0.337000"/>
			<Property name="G" value="0.163000"/>
			<Property name="B" value="0.404000"/>
			<Property name="A" value="1.000000"/>
		</Property>
	</Property>
</Property>

]]

-- local e2l = ToLua(section_08)
-- print( TableToString(e2l) )

local w_src = io.open('d:/_dump/mxml_source.lua', 'w')
w_src:write(PrintMxmlAsLua(section_08))
w_src:close()

-- local w_src  = io.open('d:/_dump/mxml_source.mxml', 'w')
-- w_src:write( ToMxmlFile(ToLua(section_08)) )
-- w_src:close()

-- l2e = dofile('d:/_dump/mxml_source.lua')
-- io.open('d:/_dump/mxml_source.MXML', 'w'):write(ToMxml(l2e))

print('saved section to _dump')
