------------------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
------------------------------------------------------------------------------------------
mod_desc = [[
  - Adds planetary settlement, archive, ship debris, sentinel pillar, claimable base site,
   minor settlement, secure facility, ancient plaque, remote terminal, treasure ruin,
   traveler grave, distress signals and underwater locations to exocraft scanner.
  - Adds custom icons to found scan targets.
]]---------------------------------------------------------------------------------------

local icon = {
	glitch		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.GLITCH.DDS',
	outpost		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OUTPOST.DDS',
	shop		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SMALLBUILDING.DDS',
	droppod		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.POD.DDS',
	debris		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.COG.DDS',
	abandoned	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ABANDONED.DDS',
	ruin		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUINS.DDS',
	rune		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUNE.DDS',
	ship		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SHIP.DDS',
	depot		= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.DEPOTRAID.MSHOP.DDS',
	terminal	= 'TEXTURES/UI/HUD/ICONS/WIKI/TRADE3.DDS',
	freighter	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.FREIGHTER.MSHOP.DDS',
	signal		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SIGNAL.DDS',
	observatory	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OBSERVATORY.DDS',
	factory		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.FACTORY.DDS',
	tech		= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SCIENCEMISSIONS.MSHOP.DDS',
	chestruin	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.COLLECT.MSHOP.DDS',
	base		= 'TEXTURES/UI/HUD/ICONS/WIKI/BASE1.DDS',
	holohub		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.HOLOHUB.DDS',
	library		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.LIBRARY.DDS',
	grave		= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.ATLASPATH.MSHOP.DDS',
	settlement	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS',
	dronehive	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.DRONEHIVE.DDS',
	robocamp	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ROBOTHEAD.DDS',
	sentcrash	= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.SENTINELCRASH.MSHOP.DDS',
	w_abandoned	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.ABANDONED.DDS',
	w_frighter	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.FREIGHTER.DDS',
	w_ruin		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.RUIN.DDS',
	w_ship		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.W.SHIP.DDS'
}

local scan_table = {
	{
		name  = 'SHIP_CLOSESTTARGET',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'BOUND_GLITCH',		icon.glitch},
			{'OUTPOST',				icon.outpost},
			{'SHOP',				icon.shop},
			{'DROPPOD', 			icon.droppod},
			{'DEPOT',				icon.depot},
			{'TERMINAL',			icon.terminal},
			{'ABANDONED',			icon.abandoned},
			{'UW_ABANDONED',		icon.w_abandoned},
			{'RUIN',				icon.ruin},
			{'T_RUIN',				icon.chestruin},
			{'UW_RUIN',				icon.w_ruin},
			{'MONOLITH',			icon.rune},
			{'PLAQUE',				icon.rune},
			{'RADIOTOWER',			icon.signal},
			{'OBSERVATORY',			icon.observatory},
			{'HARVESTER',			icon.tech},
			{'FACTORY',				icon.factory},
			{'DISTRESS',			icon.ship},
			{'DISTRESS_NPC',		icon.ship},
			{'DEBRIS_NPC',			icon.debris},
			{'UW_SHIPCRASH',		icon.w_ship},
			{'TRAVEL_GRAVE',		icon.grave},
			{'HOLO_TOWER',			icon.holohub},
			{'CRASHED_FREIGHTER',	icon.freighter},
			{'UW_FREIGHTCRASH',		icon.w_frighter},
			{'NEW_BASE',			icon.base},
			{'LIBRARY',				icon.library},
			{'DRONE_HIVE',			icon.dronehive},
			{'ROBOT_CAMP',			icon.robocamp},
			{'SENT_CRASH_CORRUPT',	icon.sentcrash},			
			{'SETTLEMENT',			icon.settlement}
		}
	},
	{
		name  = 'VEHICLE_BUILDING_OUTPOST',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'OUTPOST',				icon.outpost},
			{'SHOP',				icon.shop},
		}
	},
	{
		name  = 'VEHICLE_BUILDING_DEPOT',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'DEPOT',				icon.depot},
			{'TERMINAL',			icon.terminal}
		}
	},
	{
		name  = 'VEHICLE_BUILDING_DAMAGEDMACHINE',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {{'DROPPOD',		icon.droppod}}
	},
	{
		name  = 'VEHICLE_BUILDING_ABANDONED',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'ABANDONED',			icon.abandoned},
			{'UW_ABANDONED',		icon.w_abandoned}
		}
	},
	{
		name  = 'VEHICLE_BUILDING_RUIN',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			{'RUIN',				icon.ruin},
			{'T_RUIN',				icon.chestruin},
			{'UW_RUIN',				icon.w_ruin}
		}
	},
	{
		name  = 'VEHICLE_BUILDING_NPC',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			{'MONOLITH',			icon.rune},
			{'PLAQUE',				icon.rune}
		}
	},
	{
		name  = 'BUILDING_RADIOTOWER_L',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'RADIOTOWER',			icon.signal},
			{'OBSERVATORY',			icon.observatory}
		}
	},
	{
		name  = 'MECH_SCAN_FACT',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'FACTORY',				icon.factory},
			{'HARVESTER',			icon.tech}
		}
	},
	{
		name  = 'MECH_SCAN_CRASH',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'DISTRESS',			icon.ship},
			{'DISTRESS_NPC',		icon.ship},
			{'DEBRIS_NPC',			icon.debris},
			{'SENT_CRASH_CORRUPT',	icon.sentcrash},
			{'UW_SHIPCRASH',		icon.w_ship}
		}
	},
	{
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'CRASHED_FREIGHTER',	icon.freighter},
			{'UW_FREIGHTCRASH',		icon.w_frighter}
		}
	},
	{
		name  = 'UI_RECOVER_BASE_MARKER',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {{'NEW_BASE',		icon.base}}
	},
	{
		name  = 'UI_LIBRARY_ENTRANCE_DESC',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'LIBRARY',				icon.library},
			{'BOUND_GLITCH',		icon.glitch}
		}
	},
	{
		name  = 'UI_SENTINEL_HIVE_NAME',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			{'DRONE_HIVE',			icon.dronehive},
			{'ROBOT_CAMP',			icon.robocamp}
		}
	},
	{
		name  = 'UI_SETTLEMENT_LABEL',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {{'SETTLEMENT',		icon.settlement}}
	},
	---	submarine targets
	{
		name  = 'SUB_RADAR_SCAN_ABANDON',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_ABANDONED',	icon.w_abandoned}}
	},
	{
		name  = 'SUB_RADAR_SCAN_RUIN',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_RUIN',		icon.w_ruin}}
	},
	{
		name  = 'SUB_RADAR_SCAN_CRASH',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_SHIPCRASH',	icon.w_ship}}
	},
	{
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_FREIGHTCRASH',icon.w_frighter}}
	}
}

local scan_events = {
	{
		event	= 'TERMINAL',
		class	= 'Terminal',
		osd		= 'SIGNAL_TERMINAL',
		tip		= 'TIP_TERMINAL'
	},{
		event	= 'T_RUIN',
		class	= 'TreasureRuins',
		osd		= 'UI_SIGNAL_TREASURERUIN',
		tip		= 'UI_TIP_TREASURERUIN'
	},{
		event	= 'DEBRIS_NPC',
		class	= 'NPCDebris',
		osd		= 'SIGNAL_DEBRIS',
		tip		= 'TIP_DEBRIS'
	},{
		event	= 'PLAQUE',
		class	= 'Plaque',
		osd		= 'SIGNAL_PLAQUE',
		tip		= 'TIP_PLAQUE'
	},{
		event	= 'NEW_BASE',
		class	= 'Base',
		osd		= 'SIGNAL_BASE',
		tip		= 'TIP_BASE'
	},{
		event	= 'LIBRARY',
		class	= 'LargeBuilding',
		osd		= 'SIGNAL_LIBRARY',
		tip		= 'TIP_LIBRARY'
	},{
		event	= 'SETTLEMENT',
		evprior	= 'High',
		blocal	= 'AllNearest',
		btype	= 'UnownedSettlement',
		class	= 'Settlement_Hub',
		osd		= 'UI_SETTLEMENT_LOCATED_OSD',
		tip		= 'UI_SETTLEMENT_LOCATED'
	},{
		name	= 'BUILDING_GLITCHYSTORYBOX_L',
		event	= 'BOUND_GLITCH',
		class	= 'StoryGlitch',
		osd		= 'UI_MP_PORTALQUEST_RIFT_OSD',
		tip		= 'TUT_BASEBUILD_SURVEY_OSD'
	},{
		name	= 'SCAN_GRAVE',
		event	= 'TRAVEL_GRAVE',
		class	= 'GraveInCave',
		osd		= 'UI_BIOSHIP5_SURVEY_OSD',
		tip		= 'UI_MP_PLANTKILL_GRAVE_SURV_OSD2'
	},{
		name	= 'UI_CORE_HOLOHUB_MARKER',
		event	= 'HOLO_TOWER',
		class	= 'MissionTower',
		osd		= 'UI_CORE_A1S4_SURVEY_OSD',
		tip		= 'UI_CORE_HOLOHUB_OSD1'
	},{
		event	= 'DRONE_HIVE',
		class	= 'DroneHive',
		osd		= 'UI_DRONEHIVE_LOCATED_OSD',
		mlabel	= 'UI_SENTINEL_HIVE_NAME',
		tip		= 'UI_DRONEHIVE_LOCATED'
	},{
		event	= 'SENT_CRASH_CORRUPT',
		replace	= true,
		class	= 'SentinelDistressSignal',
		osd		= 'UI_CRASH_REVEAL_OSD',
		mlabel	= 'UI_CRASH_REVEAL_MARKER',
		tip		= 'UI_CRASH_REVEAL_MSG'
	},{
		event	= 'ROBOT_CAMP',
		replace	= true,
		class	= 'AbandonedRobotCamp',
		osd		= 'UI_CAMP_REVEAL_OSD',
		mlabel	= 'UI_CAMP_REVEAL_MARKER',
		tip		= 'UI_CAMP_REVEAL_MSG'
	}
}

local function BuildVehicleScanTable()
	local function getScanList(scans)
		-- Assign the exml table with its designated meta
		local Ts = {META = {'name', 'ScanList'}}
		for _,scn in ipairs(scans) do
			Ts[#Ts+1] = {
				META	= {'value', 'NMSString0x20.xml'},
				Value	= scn[1]
			}
		end
		return Ts
	end
	local T = {META = {'name', 'VehicleScanTable'}}
	for _,entry in ipairs(scan_table) do
		for _,tech in ipairs(entry.tech) do
			T[#T+1] = {
				META			= {'value', 'GcVehicleScanTableEntry.xml'},
				Name			= entry.name,
				RequiredTech	= tech,
				ScanList		= getScanList(entry.scan),
				Icon			= {
					META	= {'Icon', 'TkTextureResource.xml'},
					Filename	= entry.scan[1][2]
				}
			}
		end
	end
	return FileWrapping(T, 'GcVehicleScanTable')
end

local function AddNewScanEventsAndIcons()
	local T = {
		{
			PRECEDING_KEY_WORDS = 'GcScanEventData.xml',
			SECTION_SAVE_TO		= 'gc_scan_event'
		}
	}
	for _,ev in ipairs(scan_events) do
		T[#T+1] = {
			SECTION_EDIT 		= 'gc_scan_event',
			VALUE_CHANGE_TABLE 	= {
				{'Name',						ev.event},
				{'EventPriority',				ev.evprior	or 'Regular'},
				{'BuildingLocation',			ev.blocal	or 'Nearest'},
				{'ReplaceEventIfAlreadyActive',	ev.replace	or false},
				{'BuildingType',				ev.btype	or 'BuildingClass'},
				{'MarkerLabel',					ev.mlabel	or ''},
				{'OSDMessage',					ev.osd},
				{'TooltipMessage',				ev.tip}
			}
		}
		T[#T+1] = {
			SECTION_EDIT 			= 'gc_scan_event',
			PRECEDING_KEY_WORDS		= 'BuildingClass',
			VALUE_MATCH				= 'GcBuildingClassification.xml',
			VALUE_MATCH_OPTIONS 	= '~=',
			VALUE_CHANGE_TABLE 		= {
				{'BuildingClass', ev.class}
			}
		}
		T[#T+1] = {
			PRECEDING_KEY_WORDS 	= 'Events',
			SECTION_ADD_NAMED 		= 'gc_scan_event'
		}
	end
	-- add/replace marker icon for found targets
	for _,s in ipairs(scan_table[1].scan) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'Name', s[1]},
			PRECEDING_KEY_WORDS	= 'MarkerIcon',
			VALUE_CHANGE_TABLE	= { {'Filename', s[2]} }
		}
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META vehicle scan targets.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES = {
		{
			FILE_DESTINATION = 'METADATA/SIMULATION/SCANNING/VEHICLESCANTABLE.EXML',
			FILE_CONTENT	 = BuildVehicleScanTable()
		}
	},
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCANNING/SCANEVENTTABLEVEHICLE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				-- old bug fix
				SPECIAL_KEY_WORDS	= {'Name', 'RUIN'},
				VALUE_CHANGE_TABLE 	= {
					{'OSDMessage', 'UI_SIGNAL_TREASURERUIN'}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= 'METADATA/SIMULATION/SCANNING/SCANEVENTTABLEVEHICLE.MBIN',
		EXML_CHANGE_TABLE	= AddNewScanEventsAndIcons()
	}
}}}}
