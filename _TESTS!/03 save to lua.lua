-----------------------------------------------------------------------------------------
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/lua_2_exml.lua')
dofile('E:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/exml_2_lua.lua')
-----------------------------------------------------------------------------------------

exml_section_08 = [[
<?xml version="1.0" encoding="utf-8"?>
<!--File created using MBINCompiler version (4.22.0)-->
<Data template="TkAttachmentData">
	<Property name="Components">
		<Property value="GcSimpleInteractionComponentData.xml">
			<Property name="SimpleInteractionType" value="SuperDoopaScanner"/>
			<Property name="Size" value="GcSizeIndicator.xml">
				<Property name="SizeIndicator" value="Medium"/>
			</Property>
			<Property name="TriggerAction" value="INACTIVE"/>
			<Property name="HideContents" value="True"/>
			<Property name="Name" value="UI_SCAN_ROOM_LABEL"/>
			<Property name="ScanType" value="BINOC_INTERACTABLE"/>
		</Property>
		<Property value="TkPhysicsComponentData.xml">
			<Property name="Data" value="TkPhysicsData.xml">
				<Property name="Friction" value="0.5"/>
				<Property name="RollingFriction" value="0.2"/>
				<Property name="AngularDamping" value="0.2"/>
				<Property name="LinearDamping" value="0.1"/>
				<Property name="Gravity" value="20"/>
			</Property>
		</Property>
	</Property>
</Data>
]]

a = ToLua(exml_section_08)

tbl_08 = 'exml_source'

w_src = io.open('e:/_dump/'..tbl_08..'.lua', 'w')

w_src:write(PrintExmlAsLua(exml_section_08))
w_src:close()
print('saved '..tbl_08..' LUA to _dump')
-----------------------------------------------------------------------------------------
src0 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/GCCAMERAGLOBALS.GLOBAL.EXML'
src1 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/MISSIONS/SEASONALMISSIONTABLE.EXML'
src2 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.EXML'
src3 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/REWARDTABLE.EXML'
src4 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.EXML'
src5 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.EXML'
src6 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.EXML'
src7 = 'E:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/PLANETS/CREATURES/STRIDERRIG/STRIDER.DESCRIPTOR.EXML'

-----------------------------------------------------------------------------------------
-- tbl_08 = 'exml_source'

-- r_src = io.open(src4, 'r')
-- w_src = io.open('e:/_dump/'..tbl_08..'.lua', 'w')
-- w_src:write( PrintExmlAsLua( r_src:read('*a') ) )
-- r_src:close()
-- w_src:close()

-- print('saved '..tbl_08..' LUA to _dump')
-----------------------------------------------------------------------------------------
-- dofile('e:/_dump/'..tbl_08..'.lua')
-- ---@diagnostic disable-next-line: undefined-global
-- io.open('e:/_dump/'..tbl_08..'.EXML', 'w'):write(FileWrapping(exml_source))

-- print('saved '..tbl_08..' EXML to _dump')
