----------------------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
----------------------------------------------------------------------------------
local mod_desc = [[
  - Adds all possible building sites (except the portal) to the exocraft scanner.
  - Adds custom icons to found scan targets.
]]--------------------------------------------------------------------------------

local events_data = {
	MONOLITH =	{--	monolith
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUNE.DDS'
	},
	RADIOTOWER = {-- radiotower
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SIGNAL.DDS'
	},
	FACTORY =	{--	factory
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.FACTORY.DDS'
	},
	ABANDONED =	{--	abandoned
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ABANDONED.DDS'
	},
	OUTPOST =	{--	trading post
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OUTPOST.DDS'
	},
	SHOP =		{--	shop
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SMALLBUILDING.DDS'
	},
	OBSERVATORY = {-- observatory
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OBSERVATORY.DDS'
	},
	DISTRESS =	{--	crashed ship
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	CRASHED_FREIGHTER =	{--	crashed freighter
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.FREIGHTER.MSHOP.DDS'
	},
	DISTRESS_NPC = {--	NPC in distress
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	HARVESTER =	{--	harvester
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SCIENCEMISSIONS.MSHOP.DDS'
	},
	DEPOT =		{--	sentinel depot
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.DEPOTRAID.MSHOP.DDS'
	},
	RUIN =		{-- ruin
		org		= true,
		osd		= 'UI_SIGNAL_TREASURERUIN',
		tip		= 'UI_SIGNAL_RUIN_TIP', -- UI_TIP_TREASURERUIN
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUINS.DDS'
	},
	DROPPOD =	{-- drop pod
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.POD.DDS'
	},
	UW_SHIPCRASH = {-- underwater crashed ship
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.SHIP.DDS'
	},
	UW_FREIGHTCRASH = {-- underwater crashed freighter
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.FREIGHTER.DDS'
	},
	UW_ABANDONED = {-- underwater building
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.ABANDONED.DDS'
	},
	UW_RUIN =	{--	underwater ruin
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.RUIN.DDS'
	},
	TERMINAL =	{-- trade terminal
		class	= 'Terminal',
		osd		= 'SIGNAL_TERMINAL',
		tip		= 'TIP_TERMINAL',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/TRADE3.DDS'
	},
	T_RUIN =	{-- locked chest ruin
		class	= 'TreasureRuins',
		osd		= 'UI_SIGNAL_TREASURERUIN',
		tip		= 'UI_TIP_TREASURERUIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.COLLECT.MSHOP.DDS'
	},
	DEBRIS =	{-- damaged machine
		class	= 'Debris',
		osd		= 'SIGNAL_DEBRIS',
		tip		= 'TIP_DEBRIS',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.COG.DDS'
	},
	BEACON =	{-- shop beacon
		class	= 'Beacon',
		osd		= 'SIGNAL_BEACON',
		tip		= 'TIP_BEACON',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.BEACON.DDS'
	},
	DEBRIS_NPC = {-- NPC in distress
		class	= 'NPCDebris',
		osd		= 'SIGNAL_DEBRIS',
		tip		= 'TIP_DEBRIS',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	PLAQUE =	{-- plaque (mionor monolith)
		class	= 'Plaque',
		osd		= 'SIGNAL_PLAQUE',
		tip		= 'TIP_PLAQUE',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUNE.DDS'
	},
	NEW_BASE =	{-- unclaimed base site
		class	= 'Base',
		osd		= 'SIGNAL_BASE',
		tip		= 'TIP_BASE',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/BASE1.DDS'
	},
	LIBRARY =	{-- library building
		class	= 'LargeBuilding',
		osd		= 'SIGNAL_LIBRARY',
		tip		= 'TIP_LIBRARY',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.LIBRARY.DDS'
	},
	SETTLEMENT = {-- unowned settlement
		search	= 'UnownedSettlement',
		blocal	= 'PlanetSearch',
		class	= 'Settlement_Hub',
		wider	= true,
		osd		= 'UI_SETTLEMENT_LOCATED_OSD',
		tip		= 'UI_SETTLEMENT_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS'
	},
	SETTLEMENT_BUILDERS = {-- unowned builder settlement
		search	= 'UnownedSettlement_Builders',
		blocal	= 'PlanetSearch',
		class	= 'Settlement_Hub_Builders',
		wider	= true,
		osd		= 'UI_SETTLEMENT_BUI_LOCATED_OSD',
		mlabel	= 'UI_SETTLEMENT_BUI_LABEL',
		tip		= 'UI_SETTLEMENT_BUI_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS'
	},
	BOUND_GLITCH = {-- glitched (Boundary Failure)
		class	= 'StoryGlitch',
		osd		= 'UI_EXPED13_GRAVE_OSD',
		tip		= 'UI_EXPED13_GRAVE_MSG6',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.GLITCH.DDS'
	},
	GRAVE =		{-- traveler grave
		class	= 'GraveInCave',
		osd		= 'UI_SIGNAL_GRAVE',		-- UI_BIOSHIP5_SURVEY_OSD
		tip		= 'UI_SIGNAL_GRAVE_TIP',	-- UI_MP_PLANTKILL_GRAVE_SURV_OSD2
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.ATLASPATH.MSHOP.DDS'
	},
	HOLO_TOWER = {-- holo terminus
		class	= 'MissionTower',
		osd		= 'UI_CORE_A1S4_SURVEY_OSD',
		tip		= 'UI_EXPED_VISIT_TOWER_MSG6',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.HOLOHUB.DDS'
	},
	DRONE_HIVE = {-- drone hive pillar
		class	= 'DroneHive',
		osd		= 'UI_DRONEHIVE_LOCATED_OSD',
		mlabel	= 'UI_SENTINEL_HIVE_NAME',
		tip		= 'UI_DRONEHIVE_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.DRONEHIVE.DDS'
	},
	SENT_CRASH = {-- crashed sentinel ship
		revent	= true,
		class	= 'SentinelDistressSignal',
		osd		= 'UI_CRASH_REVEAL_OSD',
		mlabel	= 'UI_CRASH_REVEAL_MARKER',
		tip		= 'UI_CRASH_REVEAL_MSG',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SENTINELCRASH.MSHOP.DDS'
	},
	ROBOT_CAMP = {-- autophage camp
		revent	= true,
		class	= 'AbandonedRobotCamp',
		osd		= 'UI_CAMP_REVEAL_OSD',
		mlabel	= 'UI_CAMP_REVEAL_MARKER',
		tip		= 'UI_CAMP_REVEAL_MSG',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ROBOTHEAD.DDS'
	},
	DIGSITE = {-- palaeontological digsite
		class	= 'DigSite',
		osd		= 'SIGNAL_DIGSITE',
		tip		= 'UI_SIGNAL_DIGSITE_TIP', -- UI_MP_DIGSITE_NPC_OSD
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.FOSSIL.MSHOP.DDS'
	},
	OLDGUARD = {-- ancient guardian (stone effigy)
		class	= 'AncientGuardian',
		osd		= 'UI_SIGNAL_OLDGUARD',
		tip		= 'UI_SIGNAL_OLDGUARD_TIP',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OLDGUARD.DDS'
	},
	PORTAL = {-- planetary portal
		blocal	= 'PlanetSearch',
		class	= 'Portal',
		wider	= true,
		osd		= 'SIGNAL_PORTAL',
		tip		= 'TIP_PORTAL',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.PORTAL.DDS'
	}
}

local scan_menu_table = {
	{--	all possible targets
		name  = 'SHIP_CLOSESTTARGET',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			'BOUND_GLITCH',
			'OUTPOST',
			'SHOP',
			'DROPPOD',
			'DEPOT',
			'TERMINAL',
			'ABANDONED',
			'UW_ABANDONED',
			'RUIN',
			'T_RUIN',
			'UW_RUIN',
			'MONOLITH',
			'PLAQUE',
			'RADIOTOWER',
			'OBSERVATORY',
			'HARVESTER',
			'FACTORY',
			'DISTRESS',
			'DISTRESS_NPC',
			'DEBRIS_NPC',
			'UW_SHIPCRASH',
			'TRAVEL_GRAVE',
			'HOLO_TOWER',
			'CRASHED_FREIGHTER',
			'UW_FREIGHTCRASH',
			'NEW_BASE',
			'LIBRARY',
			'DRONE_HIVE',
			'ROBOT_CAMP',
			'SENT_CRASH',
			'SETTLEMENT',
			'SETTLEMENT_BUILDERS',
			'DIGSITE',
			'OLDGUARD',
			'DEBRIS',
			'BEACON'
		}
	},
	{--	shop / trading post
		name  = 'VEHICLE_BUILDING_OUTPOST',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			'OUTPOST',
			'SHOP'
		}
	},
	{--	sentinel depot / store terminal
		name  = 'VEHICLE_BUILDING_DEPOT',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			'DEPOT',
			'TERMINAL'
		}
	},
	{--	drop pod
		name  = 'VEHICLE_BUILDING_DAMAGEDMACHINE',
		tech  = {'VEHICLE_SCAN1'},
		scan  = { 'DROPPOD' }
	},
	{--	abandoned building
		name  = 'VEHICLE_BUILDING_ABANDONED',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			'ABANDONED',
			'UW_ABANDONED'
		}
	},
	{--	regular ruin / treasure / underwater
		name  = 'VEHICLE_BUILDING_RUIN',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			'RUIN',
			'RUIN', -- not a bug
			'T_RUIN',
			'UW_RUIN'
		}
	},
	{--	monolith / plaque
		name  = 'VEHICLE_BUILDING_NPC',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			'MONOLITH',
			'PLAQUE'
		}
	},
	{--	radio / observatory
		name  = 'BUILDING_RADIOTOWER_L',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			'RADIOTOWER',
			'OBSERVATORY'
		}
	},
	{--	factory / harvester
		name  = 'MECH_SCAN_FACT',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			'FACTORY',
			'HARVESTER'
		}
	},
	{--	crashed ship / sentinel / NPC / underwater ship
		name  = 'MECH_SCAN_CRASH',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			'DISTRESS',
			'DISTRESS_NPC',
			'DEBRIS_NPC',
			'SENT_CRASH',
			'UW_SHIPCRASH'
		}
	},
	{--	crashed freighter / underwater freighter
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			'CRASHED_FREIGHTER',
			'UW_FREIGHTCRASH'
		}
	},
	{--	sentinel hive pillar
		name  = 'UI_SENTINEL_HIVE_NAME',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			'DRONE_HIVE',
			'ROBOT_CAMP'
		}
	},
	{--	palaeontological dig
		name  = 'UI_DIGSITE_NAME',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			'DIGSITE',
			'DIGSITE', -- not a bug
			'OLDGUARD'
		}
	},
	{--	unclaimed base site
		name  = 'UI_RECOVER_BASE_MARKER',
		tech  = {'VEHICLE_SCAN2'},
		scan  = { 'NEW_BASE' }
	},
	{--	library / glitched building
		name  = 'UI_LIBRARY_ENTRANCE_DESC',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			'LIBRARY',
			'BOUND_GLITCH'
		}
	},
	{--	unowned settlement
		name  = 'UI_SETTLEMENT_LABEL',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			'SETTLEMENT',
			'SETTLEMENT', -- not a bug
			'SETTLEMENT_BUILDERS'
		}
	},
	{--	planetary portal
		name  = 'BUILDING_PORTAL_L',
		tech  = {'VEHICLE_SCAN1'},
		scan  = { 'PORTAL' }
	},
	{--	submarine: underwater building
		name  = 'SUB_RADAR_SCAN_ABANDON',
		tech  = {'SUB_BINOCS'},
		scan  = { 'UW_ABANDONED' }
	},
	{--	submarine: underwater ruin
		name  = 'SUB_RADAR_SCAN_RUIN',
		tech  = {'SUB_BINOCS'},
		scan  = { 'UW_RUIN' }
	},
	{--	submarine: underwater crashed ship
		name  = 'SUB_RADAR_SCAN_CRASH',
		tech  = {'SUB_BINOCS'},
		scan  = { 'UW_SHIPCRASH' }
	},
	{--	submarine: underwater crashed freighter
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'SUB_BINOCS'},
		scan  = { 'UW_FREIGHTCRASH' }
	}
}

local sve_ct = {{
	SPECIAL_KEY_WORDS	= {'Events', 'GcScanEventData'},
	SEC_SAVE_TO			= 'gc_scan_event'
}}
for id, evnt in pairs(events_data) do
	if not evnt.org then
		sve_ct[#sve_ct+1] = {
			SEC_EDIT 			= 'gc_scan_event',
			VALUE_CHANGE_TABLE 	= {
				{'Name',						id},
				{'ReplaceEventIfAlreadyActive',	evnt.revent	or false},
				{'BuildingLocation',			evnt.blocal	or 'Nearest'},
				{'SearchType',					evnt.search	or 'FindBuildingClass'},
				{'BuildingClass',				evnt.class	or 'None'},
				{'ForceWideRandom',				evnt.wider	or false},
				{'Filename',					evnt.icon},
				{'OSDMessage',					evnt.osd},
				{'MarkerLabel',					evnt.mlabel	or ''},
				{'TooltipMessage',				evnt.tip}
			}
		}
		sve_ct[#sve_ct+1] = {
			PRECEDING_KEY_WORDS	= 'Events',
			ADD_OPTION			= 'AddEndSection',
			SEC_ADD_NAMED		= 'gc_scan_event'
		}
	else
	--	changes/fixes to original events
		sve_ct[#sve_ct+1] = {
			SPECIAL_KEY_WORDS	= {'Name', id},
			VALUE_CHANGE_TABLE	= {
				{'Filename',					evnt.icon	or 'IGNORE'},
				{'OSDMessage',					evnt.osd	or 'IGNORE'},
				{'TooltipMessage',				evnt.tip	or 'IGNORE'}
			}
		}
	end
end

local sqm_ct = {meta = {name='VehicleScanTable'}}
for _,entry in ipairs(scan_menu_table) do
	for _,tech in ipairs(entry.tech) do
		sqm_ct[#sqm_ct+1] = {
			meta			= {name='VehicleScanTable', value='GcVehicleScanTableEntry'},
			Name			= entry.name,
			RequiredTech	= tech,
			ScanList		= StringArray(entry.scan, 'ScanList'),
			Icon			= {
				meta	= {name='Icon', value='TkTextureResource'},
				Filename	= events_data[entry.scan[1]].icon
			}
		}
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META vehicle scan targets',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
		MBIN_CHANGE_TABLE	= {
			{
				MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCANNING/SCANEVENTTABLEVEHICLE.MBIN',
				EXML_CREATE			= false,
				MXML_CHANGE_TABLE	= sve_ct
			}
		}
	}},
	ADD_FILES			= {
		{
			FILE_DESTINATION 	= 'METADATA/SIMULATION/SCANNING/VEHICLESCANTABLE.MXML',
			FILE_CONTENT	 	= ToMxmlFile(sqm_ct, 'cGcVehicleScanTable')
		}
	}
}

local __locale_text_import__ = {
	UI_SIGNAL_OLDGUARD = {
		EN = [[Stone Guardian Detected]],
	},
	UI_SIGNAL_OLDGUARD_TIP = {
		EN = [[<SPECIAL>Ancient Effigy Signal Detected<>|N|Reach the marked location and investigate the remains. Carefully!]],
	},
	UI_SIGNAL_DIGSITE_TIP = {
		EN = [[<SPECIAL>Active Digsite Detected<>|N|Investigate the palaeontological fossil to find more about it and barter with the locals]],
	},
	UI_SIGNAL_GRAVE = {
		EN = [[Traveler Grave Signal Detected]],
	},
	UI_SIGNAL_GRAVE_TIP = {
		EN = [[<SPECIAL>Grave Signal Detected<>|N|Reach the marked location and investigate the late owner's fate.]],
	},
	UI_SIGNAL_RUIN_TIP = {
		EN = [[<TITLE>Ancient ruined site detected<>|N|Investigate the marked location to find knowledge of the past.]],
	},
}--- __locale_text_import__ (do not delete)
