-------------------------------------------------------------------------------
---	Adds all planetary buildings (except the portal) to the exocraft scanner.
---	Re-arrange scanner icons grouping for improved target selection.
---	Make exocraft scanner tech available to the mech.
-------------------------------------------------------------------------------

local mod_path	= 'D:/MODZ_stuff/NoMansSky/Published/Exocraft Scanner Upgrade/_MOD.lMonk.exocraft scan upgrade'

dofile('../LIB/_lua_2_mxml.lua')

local function WriteExmlFile(path, data, template)
	local function PathSplit(p)
		return {p:gsub('/', '\\'):match('^(.-)([^\\/]-)(%.[^.]-)$')}
	end
	os.execute(('if not exist "<>" md "<>"'):gsub('<>', PathSplit(path)[1]))
	local w_src = io.open(path, 'w')
	w_src:write(ToMxmlFile(data, template))
	w_src:close()

	print(('File %s.exml created.'):format(PathSplit(path)[2]))
end

--- write ScanEventTable ------------------------------------------------------
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

local scan_events = {meta = {name='Events'}}
for _,evnt in ipairs(events_data) do
	local T = {}
	if not evnt.org then
		T = {
			ForceOverridesAll			= true,
			SurveyDiscoveryOSDMessage	= 'UI_MISSIONMARKER_DISC_OSD',
			SurveyHUDName				= 'UI_MISSIONSURVEY_HUD_SUB',
			EventStartType				= 'ObjectScan',
			EventEndType				= 'Proximity',
			ReplaceEventIfAlreadyActive	= evnt.revent,
			DisableMultiplayerSync		= true,
			BuildingLocation			= evnt.blocal or 'Nearest',
			SearchType					= evnt.search or 'FindBuildingClass',
			SpecificBuildingClass = {
				meta = {name='SpecificBuildingClass', value='GcBuildingClassification'},
				BuildingClass			= evnt.class
			},
			TriggerActions = {
				meta = {name='TriggerActions', value='GcScanEventTriggers'},
				Range					= 100
			},
			MarkerLabel					= evnt.mlabel,
			ForceWideRandom				= evnt.wider or false,
			AllowOverriddenBuildings	= true,
			ForceRestartInteraction		= true,
			InterstellarOSDMessage		= 'SCANEVENT_ANOTHER_SYSTEM',
			MessageDisplayTime			= 4,
			IconTime					= 4,
			TooltipTime					= 10,
			ShowEndTooltip				= true
		}
	end
	T.meta			= {name='Events', value='GcScanEventData', _index=#scan_events}
	T.Name			= evnt.id
	T.OSDMessage	= evnt.osd
	T.TooltipMessage= evnt.tip
	T.MarkerIcon	= {
		meta = {name='MarkerIcon', value='TkTextureResource'},
		Filename	= evnt.icon
	}
	scan_events[#scan_events+1] = T
	-- add events_data key access
	events_data[evnt.id] = evnt
end

WriteExmlFile(
	mod_path..'/METADATA/SIMULATION/SCANNING/SCANEVENTTABLEVEHICLE.EXML',
	scan_events,
	'cGcScanEventTable'
)
--- write VehicleScanTable ----------------------------------------------------
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
			'SETTLEMENT_BLD',
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
			'RUIN',
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
			'SETTLEMENT',
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

local scan_menu = { meta = {name='VehicleScanTable'} }
for _,entry in ipairs(scan_menu_table) do
	for _,tech in ipairs(entry.tech) do
		scan_menu[#scan_menu+1] = {
			meta			= {name='VehicleScanTable', value='GcVehicleScanTableEntry', _index=#scan_menu},
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

WriteExmlFile(
	mod_path..'/METADATA/SIMULATION/SCANNING/VEHICLESCANTABLE.EXML',
	scan_menu,
	'cGcVehicleScanTable'
)
--- write TechnologyTable -----------------------------------------------------
local tech_table = {meta = {name='Table'}}
for i=1, 2 do
	tech_table[#tech_table+1] = {
		meta		= {name='Table', value='GcTechnology', _id='VEHICLE_SCAN'..i},
		ID			= 'VEHICLE_SCAN'..i,
		Category	= {
			meta	= {name='Category', value='GcTechnologyCategory'},
			TechnologyCategory	= 'AllVehicles'
		}
	}
end

WriteExmlFile(
	mod_path..'/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.EXML',
	tech_table,
	'cGcTechnologyTable'
)
--- copy icons ----------------------------------------------------------------
local function lsh(p) return p:gsub('/', '\\') end
os.execute(
	('robocopy "%s" "%s\\%s" /S /XF %s'):format(
		lsh('D:/MODZ_stuff/NoMansSky/Sources/_Textures_mod_source/textures/ui/hud/icons/buildings'),
		lsh(mod_path),
		lsh('textures/ui/hud/icons/buildings'),
		'NEXUS* *ATLAS* *SPACE*' -- exclude files
	)
)
--- write Locale file ---------------------------------------------------------
dofile('../LIB/table_entry.lua')

local __locale_text_import__ = {
	UI_SIGNAL_OLDGUARD = {
		EN = [[Stone Guardian Detected]],
		FR = [[Gardien de pierre détecté]],
		IT = [[Guardiano di pietra rilevato]],
		DE = [[Steingolem entdeckt]],
		ES = [[Guardián de piedra detectado]],
		RU = [[Каменный страж обнаружен]],
		PL = [[Kamienny strażnik wykryty]],
		NL = [[Stenen wachter gedetecteerd]],
		PT = [[Guardião de pedra detectado]],
		LA = [[Guardián de piedra detectado]],
		BR = [[Guardião de pedra detectado]],
		Z1 = [[石头守卫已侦测到]],
		ZH = [[石頭守衛已偵測到]],
		Z2 = [[石头守卫已被检测到]],
		KO = [[돌 수호병 감지됨]],
		JA = [[石の守護者が検知されました]],
		US = [[Stone Guardian Detected]],
	},
	UI_SIGNAL_OLDGUARD_TIP = {
		EN = [[<SPECIAL>Ancient Effigy Signal Detected<>|N|Reach the marked location and investigate the remains. Carefully!]],
		FR = [[<SPECIAL>Signal d'effigie ancienne détecté<>|N|Rejoignez l'endroit marqué et examinez les restes. Prudemment !]],
		IT = [[<SPECIAL>Segnale di effigie antica rilevato<>|N|Raggiungi la posizione indicata e investiga i resti. Con cautela!]],
		DE = [[<SPECIAL>Signal einer antiken Statue entdeckt<>|N|Erreiche den markierten Ort und untersuche die Überreste. Vorsichtig!]],
		ES = [[<SPECIAL>¡¡Señal de efigie antigua detectada<>|N|Alcanza la ubicación marcada e investiga los restos. ¡Con cuidado!]],
		RU = [[<SPECIAL>Обнаружен сигнал древнего изваяния<>|N|Доберётесь до отмеченной локации и исследуйте останки. Осторожно!]],
		PL = [[<SPECIAL>Wykryto sygnał starożytnego posągu<>|N|Dotrzyj do oznaczonego miejsca i zbadaj szczątki. Ostrożnie!]],
		NL = [[<SPECIAL>Signaal van een oud afgodsbeeld gedetecteerd<>|N|Bereik de gemarkeerde locatie en onderzoek de overblijfselen. Voorzichtig!]],
		PT = [[<SPECIAL>Sinal de efígie antiga detectado<>|N|Alcance o local marcado e investigue os restos. Cuidadosamente!]],
		LA = [[<SPECIAL>¡¡Señal de efigie antigua detectada<>|N|Alcanza la ubicación marcada e investiga los restos. ¡Cuidadosamente!]],
		BR = [[<SPECIAL>Sinal de efígie antiga detectado<>|N|Alcance o local marcado e investigue os restos. Cuidadosamente!]],
		Z1 = [[<SPECIAL>古老雕像信号已侦测到<>|N|抵达标记地点并调查遗骸。小心！]],
		ZH = [[<SPECIAL>古老雕像信號已偵測到<>|N|抵達標記地點並調查遺骸。小心！]],
		Z2 = [[<SPECIAL>古老雕像信号已被检测到<>|N|抵达标记位置并调查遗骸。小心！]],
		KO = [[<SPECIAL>고대 형상 신호 감지됨<>|N|표시된 위치에 도달하여 유해를 조사하십시오. 조심스럽게!]],
		JA = [[<SPECIAL>古代の彫像の信号を検知<>|N|印のついた場所に到達し、遺物を調査せよ。慎重に！]],
		US = [[<SPECIAL>Ancient Effigy Signal Detected<>|N|Reach the marked location and investigate the remains. Carefully!]],
	},
	UI_SIGNAL_DIGSITE_TIP = {
		EN = [[<SPECIAL>Active Digsite Detected<>|N|Investigate the palaeontological fossil to find more about it and barter with the locals]],
		FR = [[<SPECIAL>Site de fouilles actif détecté<>|N|Enquêtez sur le fossile paléontologique pour en savoir plus et marchandez avec les habitants.]],
		IT = [[<SPECIAL>Sito di scavo attivo rilevato<>|N|Indaga sul fossile paleontologico per saperne di più e mercanteggia con la gente del posto.]],
		DE = [[<SPECIAL>Aktive Ausgrabungsstätte entdeckt<>|N|Untersuche das paläontologische Fossil, um mehr darüber zu erfahren,|N|und handle mit den Einheimischen.]],
		ES = [[<SPECIAL>¡¡Yacimiento arqueológico activo detectado<>|N|Investiga el fósil paleontológico para saber más sobre él y trueca con los lugareños.]],
		RU = [[<SPECIAL>Обнаружено активное место раскопок<>|N|Исследуйте палеонтологическую окаменелость, чтобы узнать больше,|N|и торгуйтесь с местными, жителями.]],
		PL = [[<SPECIAL>Wykryto aktywne stanowisko wykopaliskowe<>|N|Zbadaj skamieniałość paleontologiczną, aby dowiedzieć się więcej, i handluj z miejscowymi.]],
		NL = [[<SPECIAL>Actieve opgravingssite gedetecteerd<>|N|Onderzoek het paleontologische fossiel om er meer over te|N|weten te komen en ruilhandel met de lokale bevolking.]],
		PT = [[<SPECIAL>Sítio de escavação ativo detectado<>|N|Investigue o fóssil paleontológico para saber mais sobre ele e negocie com os locais.]],
		LA = [[<SPECIAL>¡¡Sitio de excavación activo detectado<>|N|Investiga el fósil paleontológico para saber más sobre él y trueca con los lugareños.]],
		BR = [[<SPECIAL>Sítio de escavação ativo detectado<>|N|Investigue o fóssil paleontológico para saber mais sobre ele e negocie com os locais.]],
		Z1 = [[<SPECIAL>活跃挖掘点已侦测到<>|N|调查古生物化石以了解更多信息，并与当地人进行交易。]],
		ZH = [[<SPECIAL>活躍挖掘點已偵測到<>|N|調查古生物化石以了解更多資訊，並與當地人進行交易。]],
		Z2 = [[<SPECIAL>活跃挖掘点已被检测到<>|N|调查古生物化石以了解更多信息，并与当地人进行交易。]],
		KO = [[<SPECIAL>활성 발굴지 감지됨<>|N|고생물학 화석을 조사하여 자세히 알아보고 현지인들과 거래하십시오.]],
		JA = [[<SPECIAL>活動的な発掘現場を検知<>|N|古生物学的な化石を調査して詳細を調べ、地元住民と物々交換せよ。]],
		US = [[<SPECIAL>Active Digsite Detected<>|N|Investigate the palaeontological fossil to find more about it and barter with the locals]],
	},
	UI_SIGNAL_GRAVE = {
		EN = [[Traveler Grave Signal Detected]],
		FR = [[Signal de tombe de voyageur détecté]],
		IT = [[Segnale di tomba di viaggiatore rilevato]],
		DE = [[Signal eines Reisendengrabs entdeckt]],
		ES = [[Señal de tumba de viajero detectada]],
		RU = [[Обнаружен сигнал могилы путешественника]],
		PL = [[Wykryto sygnał grobu podróżnika]],
		NL = [[Signaal van reizigersgraf gedetecteerd]],
		PT = [[Sinal de túmulo de viajante detectado]],
		LA = [[Señal de tumba de viajero detectada]],
		BR = [[Sinal de túmulo de viajante detectado]],
		Z1 = [[旅者墓穴信号已侦测到]],
		ZH = [[旅者墓穴信號已偵測到]],
		Z2 = [[旅者墓穴信号已被检测到]],
		KO = [[여행자 무덤 신호 감지됨]],
		JA = [[旅人の墓の信号を検知]],
		US = [[Traveler Grave Signal Detected]],
	},
	UI_SIGNAL_GRAVE_TIP = {
		EN = [[<SPECIAL>Grave Signal Detected<>|N|Reach the marked location and investigate the late owner's fate.]],
		FR = [[<SPECIAL>Signal de tombe détecté<>|N|Rejoignez l'endroit marqué et enquêtez sur le destin du défunt propriétaire.]],
		IT = [[<SPECIAL>Segnale di tomba rilevato<>|N|Raggiungi la posizione indicata e indaga sul destino del defunto proprietario.]],
		DE = [[<SPECIAL>Grabsignal entdeckt<>|N|Erreiche den markierten Ort und untersuche das Schicksal des verstorbenen Besitzers.]],
		ES = [[<SPECIAL>¡¡Señal de tumba detectada<>|N|Alcanza la ubicación marcada e investiga el destino del difunto dueño.]],
		RU = [[<SPECIAL>Обнаружен сигнал могилы<>|N|Доберётесь до отмеченной локации и выясните судьбу покойного владельца.]],
		PL = [[<SPECIAL>Wykryto sygnał grobu<>|N|Dotrzyj do oznaczonego miejsca i zbadaj los zmarłego właściciela.]],
		NL = [[<SPECIAL>Grafsignaal gedetecteerd<>|N|Bereik de gemarkeerde locatie en onderzoek het lot van de overleden eigenaar.]],
		PT = [[<SPECIAL>Sinal de túmulo detectado<>|N|Alcance o local marcado e investigue o destino do falecido proprietário.]],
		LA = [[<SPECIAL>¡¡Señal de tumba detectada<>|N|Alcanza la ubicación marcada e investiga el destino del difunto dueño.]],
		BR = [[<SPECIAL>Sinal de túmulo detectado<>|N|Alcance o local marcado e investigue o destino do falecido proprietário.]],
		Z1 = [[<SPECIAL>墓穴信号已侦测到<>|N|抵达标记地点并调查逝去主人的命运。]],
		ZH = [[<SPECIAL>墓穴信號已偵測到<>|N|抵達標記地點並調查逝去主人的命運。]],
		Z2 = [[<SPECIAL>墓穴信号已被检测到<>|N|抵达标记位置并调查逝去主人的命运。]],
		KO = [[<SPECIAL>무덤 신호 감지됨<>|N|표시된 위치에 도달하여 고인의 운명을 조사하십시오.]],
		JA = [[<SPECIAL>墓の信号を検知<>|N|印のついた場所に到達し、故人の運命を調査せよ。]],
		US = [[<SPECIAL>Grave Signal Detected<>|N|Reach the marked location and investigate the late owner's fate.]],
	},
	UI_SIGNAL_RUIN_TIP = {
		EN = [[<TITLE>Ancient ruined site detected<>|N|Investigate the marked location to find knowledge of the past.]],
		FR = [[<TITLE>Site antique en ruines détecté<>|N|Enquêtez sur l'endroit marqué pour découvrir la connaissance du passé.]],
		IT = [[<TITLE>Antico sito in rovina rilevato<>|N|Indaga sulla posizione indicata per trovare la conoscenza del passato.]],
		DE = [[<TITLE>Antike Ruinenstätte entdeckt<>|N|Untersuche den markierten Ort, um Wissen über die Vergangenheit zu finden.]],
		ES = [[<TITLE>¡¡Sitio antiguo en ruinas detectado<>|N|Investiga la ubicación marcada para encontrar conocimiento del pasado.]],
		RU = [[<TITLE>Обнаружено древнее разрушенное место<>|N|Исследуйте отмеченную локацию, чтобы найти знания о прошлом.]],
		PL = [[<TITLE>Wykryto starożytne zrujnowane stanowisko<>|N|Zbadaj oznaczone miejsce, aby znaleźć wiedzę o przeszłości.]],
		NL = [[<TITLE>Oude verwoeste locatie gedetecteerd<>|N|Onderzoek de gemarkeerde locatie om kennis van het verleden te vinden.]],
		PT = [[<TITLE>Sítio antigo em ruínas detectado<>|N|Investigue o local marcado para encontrar conhecimento do passado.]],
		LA = [[<TITLE>¡¡Sitio antiguo en ruinas detectado<>|N|Investiga la ubicación marcada para encontrar conocimiento del pasado.]],
		BR = [[<TITLE>Sítio antigo em ruínas detectado<>|N|Investigue o local marcado para encontrar conhecimento do passado.]],
		Z1 = [[<TITLE>古老废墟遗址已侦测到<>|N|调查标记地点以寻找过去的知识。]],
		ZH = [[<TITLE>古老廢墟遺址已偵測到<>|N|調查標記地點以尋找過去的知識。]],
		Z2 = [[<TITLE>古老废墟遗址已被检测到<>|N|调查标记位置以寻找过去的知识。]],
		KO = [[<TITLE>고대 폐허 유적지 감지됨<>|N|표시된 위치를 조사하여 과거의 지식을 찾으십시오.]],
		JA = [[<TITLE>古代の廃墟を検知<>|N|印のついた場所を調査し、過去の知識を探せ。]],
		US = [[<TITLE>Ancient ruined site detected<>|N|Investigate the marked location to find knowledge of the past.]],
	},
}

WriteExmlFile(
	mod_path..'/LocTable.mxml',
	LocalisationTable(__locale_text_import__),
	'cTkLocalisationTable'
)

print('Exocraft scan upgrade Mod Created.')
