------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
------------------------------------------------------------------
local mod_desc = [[
  - Adds all possible building sites to the exocraft scanner.
  - Adds custom icons to found scan targets.
]]----------------------------------------------------------------

local events_data = {
	{-- monolith
		id		= 'MONOLITH',
		org		= true,	-- existing item in SCANEVENTTABLEVEHICLE
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUNE.DDS'
	},
	{-- radiotower
		id		= 'RADIOTOWER',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SIGNAL.DDS'
	},
	{-- factory
		id		= 'FACTORY',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.FACTORY.DDS'
	},
	{-- abandoned
		id		= 'ABANDONED',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ABANDONED.DDS'
	},
	{-- trading post
		id		= 'OUTPOST',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OUTPOST.DDS'
	},
	{-- shop
		id		= 'SHOP',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SMALLBUILDING.DDS'
	},
	{-- observatory
		id		= 'OBSERVATORY',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OBSERVATORY.DDS'
	},
	{-- crashed ship
		id		= 'DISTRESS',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	{-- crashed freighter
		id		= 'CRASHED_FREIGHTER',
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.FREIGHTER.MSHOP.DDS'
	},
	{-- NPC in distress
		id		= 'DISTRESS_NPC',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	{-- harvester
		id		= 'HARVESTER',
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SCIENCEMISSIONS.MSHOP.DDS'
	},
	{-- sentinel depot
		id		= 'DEPOT',
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.DEPOTRAID.MSHOP.DDS'
	},
	{-- ruin
		id		= 'RUIN',
		org		= true,
		osd		= 'UI_SIGNAL_TREASURERUIN',
		tip		= 'UI_SIGNAL_RUIN_TIP', -- UI_TIP_TREASURERUIN
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUINS.DDS'
	},
	{-- drop pod
		id		= 'DROPPOD',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.POD.DDS'
	},
	{-- scrapyard
		id		= 'SCRAPYARD',
		org		= true,
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SCRAPYARD.MSHOP.DDS' 
	},
	{-- cargo drop
		id		= 'CARGODROP',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.LANDFILL.DDS'
	},
	{-- underwater crashed ship
		id		= 'UW_SHIPCRASH',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.SHIP.DDS'
	},
	{-- underwater crashed freighter
		id		= 'UW_FREIGHTCRASH',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.FREIGHTER.DDS'
	},
	{-- underwater building
		id		= 'UW_ABANDONED',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.ABANDONED.DDS'
	},
	{-- underwater ruin
		id		= 'UW_RUIN',
		org		= true,
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.RUIN.DDS'
	},
	{-- trade terminal
		id		= 'TERMINAL',
		class	= 'Terminal',
		osd		= 'SIGNAL_TERMINAL',
		tip		= 'TIP_TERMINAL',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/TRADE3.DDS'
	},
	{-- locked chest ruin
		id		= 'T_RUIN',
		class	= 'TreasureRuins',
		osd		= 'UI_SIGNAL_TREASURERUIN',
		tip		= 'UI_TIP_TREASURERUIN',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.COLLECT.MSHOP.DDS'
	},
	{-- damaged machine
		id		= 'DEBRIS',
		class	= 'Debris',
		osd		= 'SIGNAL_DEBRIS',
		tip		= 'TIP_DEBRIS',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.COG.DDS'
	},
	{-- shop beacon
		id		= 'BEACON',
		class	= 'Beacon',
		osd		= 'SIGNAL_BEACON',
		tip		= 'TIP_BEACON',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.BEACON.DDS'
	},
	{-- NPC in distress
		id		= 'DEBRIS_NPC',
		class	= 'NPCDebris',
		osd		= 'SIGNAL_DEBRIS',
		tip		= 'TIP_DEBRIS',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS'
	},
	{-- plaque (mionor monolith)
		id		= 'PLAQUE',
		class	= 'Plaque',
		osd		= 'SIGNAL_PLAQUE',
		tip		= 'TIP_PLAQUE',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUNE.DDS'
	},
	{-- unclaimed base site
		id		= 'NEW_BASE',
		class	= 'Base',
		osd		= 'SIGNAL_BASE',
		tip		= 'TIP_BASE',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/BASE1.DDS'
	},
	{-- library building
		id		= 'LIBRARY',
		class	= 'LargeBuilding',
		osd		= 'SIGNAL_LIBRARY',
		tip		= 'TIP_LIBRARY',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.LIBRARY.DDS'
	},
	{-- unowned settlement
		id		= 'SETTLEMENT',
		search	= 'UnownedSettlement',
		blocal	= 'PlanetSearch',
		class	= 'Settlement_Hub',
		wider	= true,
		osd		= 'UI_SETTLEMENT_LOCATED_OSD',
		tip		= 'UI_SETTLEMENT_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS'
	},
	{-- unowned builder settlement
		id		= 'SETTLEMENT_BUILDERS',
		search	= 'UnownedSettlement_Builders',
		blocal	= 'PlanetSearch',
		class	= 'Settlement_Hub_Builders',
		wider	= true,
		osd		= 'UI_SETTLEMENT_BUI_LOCATED_OSD',
		mlabel	= 'UI_SETTLEMENT_BUI_LABEL',
		tip		= 'UI_SETTLEMENT_BUI_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS'
	},
	{-- glitched (Boundary Failure)
		id		= 'BOUND_GLITCH',
		class	= 'StoryGlitch',
		osd		= 'UI_EXPED13_GRAVE_OSD',
		tip		= 'UI_EXPED13_GRAVE_MSG6',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.GLITCH.DDS'
	},
		{-- traveler grave
		id		= 'GRAVE',
		class	= 'GraveInCave',
		osd		= 'UI_SIGNAL_GRAVE',		-- UI_BIOSHIP5_SURVEY_OSD
		tip		= 'UI_SIGNAL_GRAVE_TIP',	-- UI_MP_PLANTKILL_GRAVE_SURV_OSD2
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.ATLASPATH.MSHOP.DDS'
	},
	{-- holo terminus
		id		= 'HOLO_TOWER',
		class	= 'MissionTower',
		osd		= 'UI_CORE_A1S4_SURVEY_OSD',
		tip		= 'UI_EXPED_VISIT_TOWER_MSG6',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.HOLOHUB.DDS'
	},
	{-- drone hive pillar
		id		= 'DRONE_HIVE',
		class	= 'DroneHive',
		osd		= 'UI_DRONEHIVE_LOCATED_OSD',
		mlabel	= 'UI_SENTINEL_HIVE_NAME',
		tip		= 'UI_DRONEHIVE_LOCATED',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.DRONEHIVE.DDS'
	},
	{-- crashed sentinel ship
		id		= 'SENT_CRASH',
		revent	= true,
		class	= 'SentinelDistressSignal',
		osd		= 'UI_CRASH_REVEAL_OSD',
		mlabel	= 'UI_CRASH_REVEAL_MARKER',
		tip		= 'UI_CRASH_REVEAL_MSG',
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SENTINELCRASH.MSHOP.DDS'
	},
	{-- autophage camp
		id		= 'ROBOT_CAMP',
		revent	= true,
		class	= 'AbandonedRobotCamp',
		osd		= 'UI_CAMP_REVEAL_OSD',
		mlabel	= 'UI_CAMP_REVEAL_MARKER',
		tip		= 'UI_CAMP_REVEAL_MSG',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ROBOTHEAD.DDS'
	},
	{-- palaeontological digsite
		id		= 'DIGSITE',
		class	= 'DigSite',
		osd		= 'SIGNAL_DIGSITE',
		tip		= 'UI_SIGNAL_DIGSITE_TIP', -- UI_MP_DIGSITE_NPC_OSD
		icon	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.FOSSIL.MSHOP.DDS'
	},
	{-- ancient guardian (stone effigy)
		id		= 'OLDGUARD',
		class	= 'AncientGuardian',
		osd		= 'UI_SIGNAL_OLDGUARD',
		tip		= 'UI_SIGNAL_OLDGUARD_TIP',
		icon	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OLDGUARD.DDS'
	},
	{-- planetary portal
		id		= 'PORTAL',
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
	{--	scrapyard
		name  = 'UI_VEHICLE_BUILDING_SCRAPYARD',
		tech  = {'VEHICLE_SCAN'},
		vhcl  = 'Truck',
		scan  = { 'SCRAPYARD' }
	},
	{--	cargo drop
		name  = 'UI_VEHICLE_BUILDING_CARGODROP',
		tech  = {'VEHICLE_SCAN1'},
		vhcl  = 'Truck',
		scan  = { 'CARGODROP' }
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
		vhcl  = 'Submarine',
		scan  = { 'UW_ABANDONED' }
	},
	{--	submarine: underwater ruin
		name  = 'SUB_RADAR_SCAN_RUIN',
		tech  = {'SUB_BINOCS'},
		vhcl  = 'Submarine',
		scan  = { 'UW_RUIN' }
	},
	{--	submarine: underwater crashed ship
		name  = 'SUB_RADAR_SCAN_CRASH',
		tech  = {'SUB_BINOCS'},
		vhcl  = 'Submarine',
		scan  = { 'UW_SHIPCRASH' }
	},
	{--	submarine: underwater crashed freighter
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'SUB_BINOCS'},
		vhcl  = 'Submarine',
		scan  = { 'UW_FREIGHTCRASH' }
	}
}

local sve_ct = {{
	SPECIAL_KEY_WORDS	= {'Events', 'GcScanEventData'},
	SEC_SAVE_TO			= 'gc_scan_event'
}}
for _,evnt in ipairs(events_data) do
	if not evnt.org then
		sve_ct[#sve_ct+1] = {
			SEC_EDIT 			= 'gc_scan_event',
			VALUE_CHANGE_TABLE 	= {
				{'Name',						evnt.id},
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
			SPECIAL_KEY_WORDS	= {'Name', evnt.id},
			VALUE_CHANGE_TABLE	= {
				{'Filename',					evnt.icon	or 'IGNORE'},
				{'OSDMessage',					evnt.osd	or 'IGNORE'},
				{'TooltipMessage',				evnt.tip	or 'IGNORE'}
			}
		}
	end
	-- add events_data key access
	events_data[evnt.id] = evnt
end

local scan_menu = {meta = {name='VehicleScanTable'}}
for _,entry in ipairs(scan_menu_table) do
	for _,tech in ipairs(entry.tech) do
		scan_menu[#scan_menu+1] = {
			meta				= {name='VehicleScanTable', value='GcVehicleScanTableEntry'},
			Name				= entry.name,
			ScanList			= StringArray(entry.scan, 'ScanList'),
			RequiredTech		= tech,
			Icon				= {
				meta	= {name='Icon', value='TkTextureResource'},
				Filename	= events_data[entry.scan[1]].icon
			},
			UseRequiredVehicle	= entry.vhcl ~= nil,
			RequiredVehicle		= entry.vhcl and {
				meta	= {name='RequiredVehicle', value='GcVehicleType'},
				VehicleType	= entry.vhcl
			} or nil
		}	
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META vehicle scan targets',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
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
			FILE_CONTENT	 	= ToMxmlFile(scan_menu, 'cGcVehicleScanTable')
		}
	}
}

local __locale_text_import__ = {
---	New text ---
	UI_SIGNAL_OLDGUARD = {
		EN = [[Stone Guardian Detected]],
	},
	UI_SIGNAL_OLDGUARD_TIP = {
		EN = [[<SPECIAL>Ancient Effigy Signal Detected<>|NL|Reach the marked location and investigate the remains. Carefully!]],
	},
	UI_SIGNAL_DIGSITE_TIP = {
		EN = [[<SPECIAL>Active Digsite Detected<>|NL|Investigate the palaeontological fossil to find more about it and barter with the locals]],
	},
	UI_SIGNAL_GRAVE = {
		EN = [[Traveler Grave Signal Detected]],
	},
	UI_SIGNAL_GRAVE_TIP = {
		EN = [[<SPECIAL>Grave Signal Detected<>|NL|Reach the marked location and investigate the late owner's fate.]],
	},
	UI_SIGNAL_RUIN_TIP = {
		EN = [[<TITLE>Ancient ruined site detected<>|NL|Investigate the marked location to find knowledge of the past.]],
	},
---	Existing text overwritten ---
	MECH_SCAN_FACT = {
		EN = [[Industrial Facilities]],
	},
	VEHICLE_BUILDING_NPC = {
		EN = [[Racial Monuments]]
	},
	SIGNAL_PLAQUE = {
		EN = [[Racial Artifact Detected]]
	},
	TIP_PLAQUE = {
		EN = [[<TITLE>Racial Artifact signature detected<>|NL|Language of local alien species available]]
	},
	SIGNAL_MONOLITH = {
		EN = [[Racial Monolith Detected]]
	},
	TIP_MONOLITH = {
		EN = [[<TITLE>Racial Monolith marker detected<>|NL|Unidentified presence confirmed]]
	},	
}--- __locale_text_import__ (do not delete)

--[[>-<LocTable>-<
=UI_SIGNAL_OLDGUARD
EN =Stone Guardian Detected

=UI_SIGNAL_OLDGUARD_TIP
EN =<SPECIAL>Ancient Effigy Signal Detected<>|NL|Reach the marked location and investigate the remains. Carefully!

=UI_SIGNAL_DIGSITE_TIP
EN =<SPECIAL>Active Digsite Detected<>|NL|Investigate the palaeontological fossil to find more about it and barter with the locals

=UI_SIGNAL_GRAVE
EN =Traveler Grave Signal Detected

=UI_SIGNAL_GRAVE_TIP
EN =<SPECIAL>Grave Signal Detected<>|NL|Reach the marked location and investigate the late owner's fate.

=UI_SIGNAL_RUIN_TIP
EN =<TITLE>Ancient ruined site detected<>|NL|Investigate the marked location to find knowledge of the past.

>-<LocTable>-<]]
