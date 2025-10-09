-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_mxml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_mxml_2_lua.lua')
-----------------------------------------------------------------------------------------

section_08 = [[<Property name="Events" value="GcScanEventData">
			<Property name="Name" value="MONOLITH" />
			<Property name="RequireInteractionRace" value="GcAlienRace">
				<Property name="AlienRace" value="None" />
			</Property>
			<Property name="OverrideInteractionRace" value="GcAlienRace">
				<Property name="AlienRace" value="None" />
			</Property>
			<Property name="ForceOverridesAll" value="true" />
			<Property name="SurveyDiscoveryOSDMessage" value="UI_MISSIONMARKER_DISC_OSD" />
			<Property name="SurveyHUDName" value="UI_MISSIONSURVEY_HUD_SUB" />
			<Property name="EventStartType" value="ObjectScan" />
			<Property name="EventEndType" value="Proximity" />
			<Property name="DisableMultiplayerSync" value="true" />
			<Property name="BuildingType" value="BuildingClass" />
			<Property name="BuildingClass" value="GcBuildingClassification">
				<Property name="BuildingClass" value="Monolith" />
			</Property>
			<Property name="AllowOverriddenBuildings" value="true" />
			<Property name="ForceRestartInteraction" value="true" />
			<Property name="TriggerActions" value="GcScanEventTriggers">
				<Property name="Range" value="100" />
			</Property>
			<Property name="OSDMessage" value="SIGNAL_MONOLITH" />
			<Property name="InterstellarOSDMessage" value="SCANEVENT_ANOTHER_SYSTEM" />
			<Property name="MarkerIcon" value="TkTextureResource">
				<Property name="Filename" value="" />
			</Property>
			<Property name="MessageDisplayTime" value="4" />
			<Property name="IconTime" value="4" />
			<Property name="TooltipTime" value="10" />
			<Property name="ShowEndTooltip" value="true" />
			<Property name="TooltipMessage" value="TIP_MONOLITH" />
		</Property>]]

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
