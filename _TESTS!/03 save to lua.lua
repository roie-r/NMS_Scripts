-----------------------------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/~LIB/lua_2_exml.lua')
-----------------------------------------------------------------------------------------

exml_section_08 = [[<?xml version="1.0" encoding="utf-8"?>
<!--File created using MBINCompiler version (4.8.0)-->
<Data template="TkModelDescriptorList">
	<Property name="List">
		<Property value="TkResourceDescriptorList.xml">
			<Property name="TypeId" value="_ACC_"/>
			<Property name="Descriptors">
				<Property value="TkResourceDescriptorData.xml">
					<Property name="Id" value="_ACC_A"/>
					<Property name="Name" value="_Acc_A"/>
					<Property name="ReferencePaths"/>
					<Property name="Chance" value="0"/>
					<Property name="Children"/>
				</Property>
				<Property value="TkResourceDescriptorData.xml">
					<Property name="Id" value="_ACC_E"/>
					<Property name="Name" value="_Acc_E"/>
					<Property name="ReferencePaths"/>
					<Property name="Chance" value="0"/>
					<Property name="Children"/>
				</Property>
			</Property>
		</Property>
		<Property value="TkResourceDescriptorList.xml">
			<Property name="TypeId" value="_FRONT_"/>
			<Property name="Descriptors">
				<Property value="TkResourceDescriptorData.xml">
					<Property name="Id" value="_FRONT_E"/>
					<Property name="Name" value="_Front_E"/>
					<Property name="ReferencePaths"/>
					<Property name="Chance" value="0"/>
					<Property name="Children"/>
				</Property>
				<Property value="TkResourceDescriptorData.xml">
					<Property name="Id" value="_FRONT_F"/>
					<Property name="Name" value="_Front_F"/>
					<Property name="ReferencePaths"/>
					<Property name="Chance" value="0"/>
					<Property name="Children"/>
				</Property>
			</Property>
		</Property>
	</Property>
</Data>]]

a = ToLua(exml_section_08)

table_name = 'exml_source'

w_src = io.open('e:/_dump/'..table_name..'.lua', 'w')

-- w_src:write(TableToString(ToLua(exml_section_08)))
w_src:write(PrintExmlAsLua(exml_section_08))
w_src:close()
print('saved '..table_name..' LUA to _dump')
-----------------------------------------------------------------------------------------
src0 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/GCCAMERAGLOBALS.GLOBAL.EXML'
src1 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/MISSIONS/SEASONALMISSIONTABLE.EXML'
src2 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.EXML'
src3 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/REWARDTABLE.EXML'
src4 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.EXML'
src5 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.EXML'
-----------------------------------------------------------------------------------------
-- table_name = 'exml_source'

-- r_src = io.open(src2, 'r')
-- w_src = io.open('e:/_dump/'..table_name..'.lua', 'w')
-- w_src:write( PrintExmlAsLua( r_src:read('*a') ) )
-- -- w_src:write(TableToString( ToLua( r_src:read('*a') ), table_name ))
-- r_src:close()
-- w_src:close()

-- print('saved '..table_name..' LUA to _dump')
-----------------------------------------------------------------------------------------
-- dofile('e:/_dump/'..table_name..'.lua')
-- ---@diagnostic disable-next-line: undefined-global
-- io.open('e:/_dump/'..table_name..'.EXML', 'w'):write(FileWrapping(exml_source))

-- print('saved '..table_name..' EXML to _dump')
