------------------------------------------------------------------------------------------
mod_desc = [[
  Add planetary archive, base computer, minor settlement, trading post,
  ancient plaque, remote terminal, secure facility, distress signals
  and underwater targets to the exocraft scanner.
]]----------------------------------------------------------------------------------------

local icon = {
	glitch		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.GLITCH.DDS',
	outpost		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.OUTPOST.DDS',
	shop		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.SMALLBUILDING.DDS',
	droppod		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.POD.DDS',
	debris		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.COG.DDS',
	abandoned	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.ABANDONED.DDS',
	ruins		= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.RUINS.DDS',
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
	dronehive	= 'TEXTURES/UI/HUD/ICONS/BUILDINGS/BUILDING.DRONEHIVE.DDS',
	grave		= 'TEXTURES/UI/FRONTEND/ICONS/MISSIONS/MISSION.ATLASPATH.MSHOP.DDS',
	settlement	= 'TEXTURES/UI/HUD/ICONS/WIKI/WIKI.SETTLEMENT.DDS',
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
			{'BOUND_GLITCH',	icon.glitch},
			{'OUTPOST',			icon.outpost},
			{'SHOP',			icon.shop},
			{'DROPPOD', 		icon.droppod},
			{'DEPOT',			icon.depot},
			{'TERMINAL',		icon.terminal},
			{'ABANDONED',		icon.abandoned},
			{'UW_ABANDONED',	icon.w_abandoned},
			{'RUIN',			icon.ruins},
			{'T_RUIN',			icon.chestruin},
			{'UW_RUIN',			icon.w_ruin},
			{'MONOLITH',		icon.rune},
			{'PLAQUE',			icon.rune},
			{'RADIOTOWER',		icon.signal},
			{'OBSERVATORY',		icon.observatory},
			{'HARVESTER',		icon.tech},
			{'FACTORY',			icon.factory},
			{'DISTRESS',		icon.ship},
			{'DISTRESS_NPC',	icon.ship},
			{'DEBRIS_NPC',		icon.debris},
			{'UW_SHIPCRASH',	icon.w_ship},
			{'TRAVEL_GRAVE',	icon.grave},
			{'HOLO_TOWER',		icon.holohub},
			{'CRASHED_FREIGHTER',icon.freighter},
			{'UW_FREIGHTCRASH',	icon.w_frighter},
			{'NEW_BASE',		icon.base},
			{'LIBRARY',			icon.library},
			{'DRONE_HIVE',		icon.dronehive},
			{'SETTLEMENT',		icon.settlement}
		}
	},{
		name  = 'VEHICLE_BUILDING_OUTPOST',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'OUTPOST',		icon.outpost},
			{'SHOP',		icon.shop},
		}
	},{
		name  = 'VEHICLE_BUILDING_DEPOT',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'DEPOT',		icon.depot},
			{'TERMINAL',	icon.terminal}
		}
	},{
		name  = 'VEHICLE_BUILDING_DAMAGEDMACHINE',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {{'DROPPOD', icon.droppod}}
	},{
		name  = 'VEHICLE_BUILDING_ABANDONED',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'ABANDONED',	icon.abandoned},
			{'UW_ABANDONED',icon.w_abandoned}
		}
	},{
		name  = 'VEHICLE_BUILDING_RUIN',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			{'RUIN',		icon.ruins},
			{'T_RUIN',		icon.chestruin},
			{'UW_RUIN',		icon.w_ruin}
		}
	},{
		name  = 'VEHICLE_BUILDING_NPC',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {
			{'MONOLITH',	icon.rune},
			{'PLAQUE',		icon.rune}
		}
	},{
		name  = 'BUILDING_RADIOTOWER_L',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'RADIOTOWER',	icon.signal},
			{'OBSERVATORY',	icon.observatory}
		}
	},{
		name  = 'MECH_SCAN_FACT',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'FACTORY',		icon.factory},
			{'HARVESTER',	icon.tech}
		}
	},{
		name  = 'MECH_SCAN_CRASH',
		tech  = {'VEHICLE_SCAN', 'MECH_SCAN'},
		scan  = {
			{'DISTRESS',	icon.ship},
			{'DISTRESS_NPC',icon.ship},
			{'DEBRIS_NPC',	icon.debris},
			{'UW_SHIPCRASH',icon.w_ship}
		}
	},{
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'CRASHED_FREIGHTER',icon.freighter},
			{'UW_FREIGHTCRASH',	icon.w_frighter}
		}
	},{
		name  = 'UI_RECOVER_BASE_MARKER',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {{'NEW_BASE', icon.base}}
	},{
		name  = 'UI_LIBRARY_ENTRANCE_DESC',
		tech  = {'VEHICLE_SCAN1'},
		scan  = {
			{'LIBRARY',		icon.library},
			{'BOUND_GLITCH',icon.glitch}
		}
	},{
		name  = 'UI_SENTINEL_HIVE_NAME',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {{'DRONE_HIVE', icon.dronehive}}
	},{
		name  = 'UI_SETTLEMENT_LABEL',
		tech  = {'VEHICLE_SCAN2'},
		scan  = {{'SETTLEMENT', icon.settlement}}
	},{
	---	submarine targets
		name  = 'SUB_RADAR_SCAN_ABANDON',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_ABANDONED', icon.w_abandoned}}
	},{
		name  = 'SUB_RADAR_SCAN_RUIN',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_RUIN', icon.w_ruin}}
	},{
		name  = 'SUB_RADAR_SCAN_CRASH',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_SHIPCRASH', icon.w_ship}}
	},{
		name  = 'SUB_RADAR_SCAN_FREIGHTER',
		tech  = {'SUB_BINOCS'},
		scan  = {{'UW_FREIGHTCRASH', icon.w_frighter}}
	}
}
function scan_table:GetEntry(entry)
	local function GetScanList(scans)
		local exml = ''
		for _,scn in ipairs(scans) do
			exml = exml..[[
				<Property value="NMSString0x20.xml">
					<Property name="Value" value="]]..scn[1]..[["/>
				</Property>]]
		end
		return '<Property name="ScanList">'..exml..'</Property>'
	end
	local T = {}
	for _,tech in ipairs(entry.tech) do
		table.insert(T, [[
			<Property value="GcVehicleScanTableEntry.xml">
				]]..GetScanList(entry.scan)..[[
				<Property name="Name" value="]]..entry.name..[["/>
				<Property name="RequiredTech" value="]]..tech..[["/>
				<Property name="Icon" value="TkTextureResource.xml">
					<Property name="Filename" value="]]..entry.scan[1][2]..[["/>
				</Property>
			</Property>]]
		)
	end
	return table.concat(T)
end

local function BuildVehicleScanTable()
	local T = {}
	for _,entry in ipairs(scan_table) do
		table.insert(T, scan_table:GetEntry(entry))
	end
	return [[<?xml version="1.0" encoding="utf-8"?>
		<Data template="GcVehicleScanTable"><Property name="VehicleScanTable">]]
		..table.concat(T)..
		[[</Property></Data>]]
end

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
		event	= 'SETTLEMENT',
		evprior	= 'High',
		blocal	= 'AllNearest',
		btype	= 'UnownedSettlement',
		class	= 'Settlement_Hub',
		osd		= 'UI_SETTLEMENT_LOCATED_OSD',
		tip		= 'UI_SETTLEMENT_LOCATED'
	}
}

local function InsertNewScanEvents(gc_scan_event_data)
	local T = {}
	for _,ev in ipairs(scan_events) do
		table.insert(T, {
			SECTION_EDIT 		= gc_scan_event_data,
			VALUE_CHANGE_TABLE 	= {
				{'Name',				ev.event},
				{'EventPriority',		(ev.evprior or 'Regular')},
				{'BuildingLocation',	(ev.blocal or 'Nearest')},
				{'BuildingType',		(ev.btype or 'BuildingClass')},
				{'MarkerLabel',			(ev.mlbl or '')},
				{'OSDMessage',			ev.osd},
				{'TooltipMessage',		ev.tip},
			}
		})
		table.insert(T, {
			SECTION_EDIT 		= gc_scan_event_data,
			PRECEDING_KEY_WORDS	= 'BuildingClass',
			VALUE_MATCH			='GcBuildingClassification.xml',
			VALUE_MATCH_OPTIONS = '~=',
			VALUE_CHANGE_TABLE 	= {
				{'BuildingClass',	ev.class}
			}
		})
		table.insert(T, {
			PRECEDING_KEY_WORDS = 'Events',
			SECTION_ADD_NAMED 	= gc_scan_event_data
		})
	end
	return T
end

-- add/replace marker icon for found targets
local function UpdateScanEventIcons()
	local T = {}
	for _,s in ipairs(scan_table[1].scan) do
		table.insert(T, {
			SPECIAL_KEY_WORDS	= {'Name', s[1]},
			PRECEDING_KEY_WORDS	= 'MarkerIcon',
			VALUE_CHANGE_TABLE	= { {'Filename', s[2]} }
		})
	end
	return T
end

local vehicle_scans_events = 'METADATA/SIMULATION/SCANNING/SCANEVENTTABLEVEHICLE.MBIN'

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST v4 vehicle scan targets.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
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
		MBIN_FILE_SOURCE	= vehicle_scans_events,
		EXML_CHANGE_TABLE	= {
			{
				-- old bug fix
				SPECIAL_KEY_WORDS	= {'Name', 'RUIN'},
				VALUE_CHANGE_TABLE 	= {
					{'OSDMessage', 'UI_SIGNAL_TREASURERUIN'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'MONOLITH'},
				SECTION_SAVE_TO		= 'gc_scan_event_data',
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= vehicle_scans_events,
		EXML_CHANGE_TABLE	= InsertNewScanEvents('gc_scan_event_data')
	},
	{
		MBIN_FILE_SOURCE	= vehicle_scans_events,
		EXML_CHANGE_TABLE	= UpdateScanEventIcons()
	}
}}}}
