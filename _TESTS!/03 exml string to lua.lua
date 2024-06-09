-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_exml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_exml_2_lua.lua')
-----------------------------------------------------------------------------------------

section_08 = [[
<Property name="Customisation" value="GcCharacterCustomisationData.xml">
	<Property name="DescriptorGroups">
		<Property value="NMSString0x10.xml">
			<Property name="Value" value="DROPS_COCKS13"/>
		</Property>
		<Property value="NMSString0x10.xml">
			<Property name="Value" value="DROPS_ENGIS13"/>
		</Property>
		<Property value="NMSString0x10.xml">
			<Property name="Value" value="DROPS_WINGS13"/>
		</Property>
	</Property>
	<Property name="PaletteID" value="SHIP_METALLIC"/>
	<Property name="Colours">
		<Property value="GcCharacterCustomisationColourData.xml">
			<Property name="Palette" value="TkPaletteTexture.xml">
				<Property name="Palette" value="Paint"/>
				<Property name="ColourAlt" value="Primary"/>
			</Property>
			<Property name="Colour" value="Colour.xml">
				<Property name="R" value="0.462745"/>
				<Property name="G" value="0.458824"/>
				<Property name="B" value="0.470588"/>
				<Property name="A" value="1"/>
			</Property>
		</Property>
		<Property value="GcCharacterCustomisationColourData.xml">
			<Property name="Palette" value="TkPaletteTexture.xml">
				<Property name="Palette" value="Undercoat"/>
				<Property name="ColourAlt" value="Primary"/>
			</Property>
			<Property name="Colour" value="Colour.xml">
				<Property name="R" value="0.843137"/>
				<Property name="G" value="0.596078"/>
				<Property name="B" value="0.462745"/>
				<Property name="A" value="1"/>
			</Property>
		</Property>
		<Property value="GcCharacterCustomisationColourData.xml">
			<Property name="Palette" value="TkPaletteTexture.xml">
				<Property name="Palette" value="Paint"/>
				<Property name="ColourAlt" value="Alternative3"/>
			</Property>
			<Property name="Colour" value="Colour.xml">
				<Property name="R" value="0.87451"/>
				<Property name="G" value="0.878431"/>
				<Property name="B" value="0.878431"/>
				<Property name="A" value="1"/>
			</Property>
		</Property>
	</Property>
	<Property name="TextureOptions">
		<Property value="GcCharacterCustomisationTextureOptionData.xml">
			<Property name="TextureOptionGroupName" value="SHIP_FIGHT"/>
			<Property name="TextureOptionName" value="METALBOLT"/>
		</Property>
	</Property>
	<Property name="BoneScales"/>
	<Property name="Scale" value="1"/>
</Property>]]

-- local a = ToLua(section_08)

local tbl_08 = 'exml_source'

local w_src = io.open('d:/_dump/'..tbl_08..'.lua', 'w')

w_src:write(PrintExmlAsLua({exml=section_08}))
w_src:close()
print('saved '..tbl_08..' LUA to _dump')
