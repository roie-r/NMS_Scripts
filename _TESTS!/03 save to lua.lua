-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/lua_2_exml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/exml_2_lua.lua')
-----------------------------------------------------------------------------------------

exml_section_08 = [[
		<Property value="GcAlienPuzzleEntry.xml">
			<Property name="ProgressionIndex" value="-1"/>
			<Property name="MinProgressionForSelection" value="0"/>
			<Property name="Id" value="?HYPERDRIVE"/>
			<Property name="Race" value="GcAlienRace.xml">
				<Property name="AlienRace" value="Traders"/>
			</Property>
			<Property name="Type" value="GcInteractionType.xml">
				<Property name="InteractionType" value="NPC"/>
			</Property>
			<Property name="Category" value="GcAlienPuzzleCategory.xml">
				<Property name="AlienPuzzleCategory" value="Default"/>
			</Property>
			<Property name="AdditionalOptions" value="None"/>
			<Property name="Title" value=""/>
			<Property name="Text" value="TRA_HYPER_DESC_1"/>
			<Property name="TextAlien" value="DNT_TRA_HYPER_LANG_1"/>
			<Property name="TranslateAlienText" value="False"/>
			<Property name="TranslationBrackets" value="False"/>
			<Property name="ProgressiveDialogue" value="False"/>
			<Property name="RequiresScanEvent" value=""/>
			<Property name="Options">
				<Property value="GcAlienPuzzleOption.xml">
					<Property name="Name" value="TRA_HYPER_OPT_A_1"/>
					<Property name="Text" value="TRA_HYPER_RES_A_1"/>
					<Property name="IsAlien" value="False"/>
					<Property name="Cost" value=""/>
					<Property name="Rewards">
						<Property value="NMSString0x10.xml">
							<Property name="Value" value="GIVE_HYPERDRIVE"/>
						</Property>
					</Property>
					<Property name="Mood" value="GcAlienMood.xml">
						<Property name="Mood" value="Positive"/>
					</Property>
					<Property name="Prop" value="GcNPCPropType.xml">
						<Property name="NPCProp" value="DontCare"/>
					</Property>
					<Property name="OverrideWithAlienWord" value="False"/>
					<Property name="ReseedInteractionOnUse" value="False"/>
					<Property name="KeepOpen" value="False"/>
					<Property name="DisplayCost" value="True"/>
					<Property name="TruncateCost" value="False"/>
					<Property name="MarkInteractionComplete" value="True"/>
					<Property name="NextInteraction" value=""/>
					<Property name="SelectedOnBackOut" value="True"/>
					<Property name="AudioEvent" value="GcAudioWwiseEvents.xml">
						<Property name="AkEvent" value="INVALID_EVENT"/>
					</Property>
					<Property name="TitleOverride" value=""/>
					<Property name="EnablingConditionTest" value="GcMissionConditionTest.xml">
						<Property name="ConditionTest" value="AnyFalse"/>
					</Property>
					<Property name="EnablingConditions"/>
					<Property name="EnablingConditionId" value=""/>
					<Property name="WordCategory" value="GcWordCategoryTableEnum.xml">
						<Property name="wordcategorytableEnum" value="MISC"/>
					</Property>
				</Property>
			</Property>
			<Property name="AdditionalText"/>
			<Property name="AdditionalTextAlien"/>
			<Property name="Mood" value="GcAlienMood.xml">
				<Property name="Mood" value="Neutral"/>
			</Property>
			<Property name="Prop" value="GcNPCPropType.xml">
				<Property name="NPCProp" value="DontCare"/>
			</Property>
			<Property name="AdvancedInteractionFlow"/>
			<Property name="PersistancyBufferOverride" value="None"/>
			<Property name="CustomFreighterTextIndex" value="-1"/>
			<Property name="RadialInteraction" value="False"/>
			<Property name="UseTitleOverrideInLabel" value="True"/>
			<Property name="NextStageAudioEventOverride" value="GcAudioWwiseEvents.xml">
				<Property name="AkEvent" value="INVALID_EVENT"/>
			</Property>
		</Property>
]]

-- a = ToLua(exml_section_08)

-- tbl_08 = 'exml_source'

-- w_src = io.open('d:/_dump/'..tbl_08..'.lua', 'w')

-- w_src:write(PrintExmlAsLua(exml_section_08))
-- w_src:close()
-- print('saved '..tbl_08..' LUA to _dump')
-----------------------------------------------------------------------------------------
src0 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/GCCAMERAGLOBALS.GLOBAL.EXML'
src1 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/MISSIONS/SEASONALMISSIONTABLE.EXML'
src2 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/COMMON/SPACECRAFT/DROPSHIPS/SUBWINGS/SUBWINGSF/SUBWINGSF_LEFT.SCENE.EXML'
src3 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/REWARDTABLE.EXML'
src4 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/BASEBUILDINGOBJECTSTABLE.EXML'
src5 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.EXML'
src6 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.EXML'
src7 = 'D:/MODZ_stuff/NoMansSky/UNPACKED/MODELS/PLANETS/CREATURES/STRIDERRIG/STRIDER.DESCRIPTOR.EXML'
src8 = 'D:/MODZ_stuff/NoMansSky/_game_mod_Folder/utopia constructor/MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/TECH/BLUEPRINTANALYSER_WEAP/ENTITIES/DATA.ENTITY.EXML'

-----------------------------------------------------------------------------------------
tbl_08 = 'exml_source'

r_src = io.open(src8, 'r')
w_src = io.open('d:/_dump/'..tbl_08..'.lua', 'w')
w_src:write( PrintExmlAsLua( r_src:read('*a') ) )
r_src:close()
w_src:close()

print('saved '..tbl_08..' LUA to _dump')
-----------------------------------------------------------------------------------------
dofile('d:/_dump/'..tbl_08..'.lua')
io.open('d:/_dump/'..tbl_08..'.EXML', 'w'):write(FileWrapping(exml_source))

print('saved '..tbl_08..' EXML to _dump')
