----------------------------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
----------------------------------------------------------------------------------------
mod_desc = [[
  Add a new language file.
  - Generates a separate mbin for each language. If an additional language has missing
   texts, the assigned default is inserted instead.
  - color tag syntax: <RED>my red text<>
   Tags are defined in: METADATA/UI/SPECIALSTYLESDATA.MBIN

  ** The new file's locale name must be added to GCDEBUGOPTIONS.GLOBAL > LocTableList
]]--------------------------------------------------------------------------------------

local text_lines = {
	locale	= 'NMS_Loc88',
	default	= 'EN',
	entries	= {
	---	New text ---
		SUPERFOOD_NAME = {
			EN = [[GLOWING PELLETS]],
		},
		SUPERFOOD_NAME_L = {
			EN = [[Glowing Pellets]],
		},
		SUPERFOOD_DESC = {
			EN = [[This odd collection of pellets pulses with a faint, curiously organic phosphorescence. It seems to remember the whole from which it was parted...|NL|Consuming a sample seems to be a good for you.]],
		},
		PRODX40_NAME = {
			EN = [[FUSED STASIS ENABLER]],
			FR = [[ACTIVATEUR DE STASE FUSIBLE]],
		},
		PRODX40_NAME_L = {
			EN = [[Fused Stasis Enabler]],
			FR = [[Activateur De Stase Fusible]],
		},
		PRODX40_DESC = {
			EN = [[This plain-looking custom-made device is so vanishingly rare as to be practically extinct. It's value, for the right collector, is so outrageous the technology itself is considered worthless.]],
			FR = [[Cet appareil sur mesure d'apparence simple est si rare qu'il est pratiquement éteint. Sa valeur, pour le bon collectionneur, est si scandaleuse que la technologie elle-même est considérée comme sans valeur.]]
		},
		UI_TECH_EXPLORE_SUB = {
			EN = [[Craftable Exploratory Blueprints]],
		},
		UI_TECH_OFFENSE_SUB = {
			EN = [[Craftable Offensive Blueprints]],
		},
		UI_TECH_ALIEN_SUB = {
			EN = [[Craftable Sentient Vessel Blueprints]],
		},
		RECIPE_MEGASHIELD = {
			EN = [[Requested Operation: Illegal <FUEL>Improbable<> Shielding]],
		},
		BODYSHIELD_NAME = {
			EN = [[PERSONAL SHIELD]],
			FR = [[BOUCLIER PERSONNEL]]
		},
		BODYSHIELD_NAME_L =	{
			EN = [[Personal Shield]],
			FR = [[Bouclier personnel]]
		},
		BODYSHIELD_SUBTITLE = {
			EN = [[Cheating anti-cheat protection]],
			FR = [[Protection anti-triche anti-triche]]
		},
		BODYSHIELD_DESCRIPTION = {
			EN = [[Protects your person from <RED>Malevolent<> travelers, Atlas <STELLAR>glitches<> and various annoyances]],
		},
		UI_GEODE_NAME_CAVE = {
			EN = [[CAVE GEODE]],
		},
		UI_GEODE_NAME_CAVE_L = {
			EN = [[Cave Geode]],
		},
		UI_GREEN_CRYSTAL_NAME = {
			EN = [[Ionised Cobalt Crystals]],
			FR = [[Cristaux de cobalt ionisés]],
		},
		UI_CD_EX_SYM	= { EN = [[Cd+]] },
		UI_EM_EX_SYM	= { EN = [[Em+]] },
		UI_IN_EX_SYM	= { EN = [[In+]] },
		UI_CU_EX_SYM	= { EN = [[Cu+]] },
		UI_SGUNK1_SYM	= { EN = [[Ю]] },
		UI_SGUNK2_SYM	= { EN = [[Ɣ]] },
		UI_SGUNK3_SYM	= { EN = [[FeO]] },
		UI_SGUNK4_SYM	= { EN = [[ȸ]] },
		UI_SGUNK5_SYM	= { EN = [[œ]] },
		UI_TIMEDUST_SYM	= { EN = [[Љ]] },
		UI_TIMEMILK_SYM	= { EN = [[Ҩ]] },
		UI_ROBOT2_SYM	= { EN = [[¤]] },

	---	Existing text overwritten ---

		UI_SENT_LASER_NAME = {
			EN = [[MULTIPLEX LASER]],
		},
		UI_SENT_LASER_NAME_L = {
			EN = [[Multiplex Laser]],
		},
		UI_SHIPGUN_ROBO_NAME = {
			EN = [[PREVALENCE GUN]],
		},
		UI_SHIPGUN_ROBO_NAME_L = {
			EN = [[Prevalence Gun]],
		},
		UI_SHIPJUMP_ROBO_NAME = {
			EN = [[OSCILLATION GENERATOR]],
		},
		UI_SHIPJUMP_ROBO_NAME_L = {
			EN = [[Oscillation Generator]],
		},
		UI_HYPERDRIVE_ROBO_NAME = {
			EN = [[SANGUINE CORE]],
		},
		UI_HYPERDRIVE_ROBO_NAME_L = {
			EN = [[Sanguine Core]],
		},
		UI_LIFESUP_ROBO_NAME = {
			EN = [[GLASS/BOUNDARY TERMINAL]],
		},
		UI_LIFESUP_ROBO_NAME_L = {
			EN = [[Glass/Boundary Terminal]],
		},
		UI_LIFESUP_ROBO_SUB = {
			EN = [[Pilot Interface]],
		},
		MECH_SCAN_FACT = {
			EN = [[Industrial Facilities]],
		},
		VEHICLE_BUILDING_NPC = {
			EN = [[Racial Monuments]],
		},
		SIGNAL_PLAQUE = {
			EN = [[Racial Plaque Detected]],
		},
		SIGNAL_MONOLITH = {
			EN = [[Racial Monolith Detected]],
		},
		UI_SALVAGE_TECH_10_NAME = {
			EN = [[STARSHIP AI KERNEL]],
		},
		UI_SALVAGE_TECH_10_NAME_L = {
			EN = [[starship AI Kernel]],
		},
		UI_GEODE_NAME = {
			EN = [[ROCK GEODE]],
		},
		UI_GEODE_NAME_L = {
			EN = [[Rock Geode]],
		},
		QUICK_MENU_TIP_THIRDPERSONSHIP = {
			EN = [[Toggle Camera View]],
		},
		UT_SHOT_NAME = {
			EN = [[SHELL IGNITER]],
		},
		UT_SHOT_NAME_L = {
			EN = [[Shell Igniter]],
		},
		UT_SHOT_DESC = {
			EN = [[A combat upgrade for the <TECHNOLOGY>Scatter Blaster<>. This module installs series of delicately calibrated fuel-injection nozzles within the firing chamber, which are used to initiate a controlled burn within its shells, while still offering improved <STELLAR>reload times<>.|NL||NL|Causes targets to <RED>burn<> for a short while, causing additional damage]],
		},
		UI_LAUNCHSUB2_SYM	= { EN = [[H2]] },
		UI_HEXITE_SYM		= { EN = [[Ӂ]] },
		UI_SUNGOLD_SYM		= { EN = [[Ƣ]] },
		UI_SOULFRAG_SYM		= { EN = [[§]] },
		UI_WORMDUST_SYM		= { EN = [[∂]] },

		NOTIFY_BINOCULARS				= { EN = ' ' },
		NOTIFY_BOOST					= { EN = ' ' },
		NOTIFY_SHIPBOOST				= { EN = ' ' },
		NOTIFY_SHIPJUMP					= { EN = ' ' },
		NOTIFY_SCANNER					= { EN = ' ' },
		NOTIFY_JETPACK					= { EN = ' ' },
		NOTIFY_NOJETPACK				= { EN = ' ' },
		NOTIFY_SHIPJUMP_PC				= { EN = ' ' },
		NOTIFY_TORCH					= { EN = ' ' },
		NOTIFY_TAKEOFF					= { EN = ' ' },
		UI_CREATURE_MOUNT_TITLE			= { EN = ' ' },
		UI_CREATURE_MOUNT_MSG			= { EN = ' ' },
		UI_NEXUS_SALVAGE_TITLE			= { EN = ' ' },
		UI_NEXUS_TECHFRAG_TITLE			= { EN = ' ' },
		UI_NOTIFY_EXOCRAFT_TIP_TITLE	= { EN = ' ' },
		UI_NOTIFY_SHIP_TIP_TITLE		= { EN = ' ' },
		UI_NOTIFY_SHIP_SUMMON			= { EN = ' ' },
		UI_NOTIFY_TAKEOFF				= { EN = ' ' },
		UI_NOTIFY_TIP_TITLE				= { EN = ' ' },
	}
}

------------------------------------------------------------------------------

local languages = {
	EN = 'English',
	FR = 'French',
	IT = 'Italian',
	DE = 'German',
	ES = 'Spanish',
	RU = 'Russian',
	PL = 'Polish',
	NL = 'Dutch',
	PT = 'Portuguese',
	LA = 'LatinAmericanSpanish',
	BR = 'BrazilianPortuguese',
	Z1 = 'SimplifiedChinese',
	ZH = 'TraditionalChinese',
	Z2 = 'TencentChinese',
	KO = 'Korean',
	JA = 'Japanese',
	US = 'USEnglish'
}

local function InsertCharEntities(s)
	local entity = {
		{'&',	'&amp;'}, -- must be first
		{'<',	'&lt;'},
		{'>',	'&gt;'},
		{'"',	'&quot;'},
		{'|NL|','&#10;'}
	}
	for _,e in ipairs(entity) do
		s = s:gsub(e[1], e[2])
	end
	return s
end

-- return a complete TkLocalisationTable exml
-- if a locale text is missing, insert default locale
local function BuildLocaleText(lang_code)
	local T = {META = {'name', 'Table'}}
	for id, text in pairs(text_lines.entries) do
		local code = text[lang_code] and lang_code or text_lines.default
		T[#T+1] = {
			META	= {'value', 'TkLocalisationEntry.xml'},
			Id		= id,
			{
				META	= {languages[lang_code], 'VariableSizeString.xml'},
				Value	= InsertCharEntities(text[code])
			}
		}
	end
	return FileWrapping(T, 'TkLocalisationTable')
end

local function AddLanguageFiles()
	local lang_codes = {}
	-- collect all language codes from entries
	for _,e in pairs(text_lines.entries) do
		for k,_ in pairs(e) do
			lang_codes[k] = 0
		end
	end
	local T = {}
	for code,_ in pairs(lang_codes) do
		T[#T+1] = {
			FILE_CONTENT	 = BuildLocaleText(code),
			FILE_DESTINATION = string.format(
				'LANGUAGE/%s_%s.EXML',
				text_lines.locale,
				languages[code]
			):upper()
		}
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= string.format('_LANG %s_Personal.pak', text_lines.locale),
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= AddLanguageFiles(),
	-- MODIFICATIONS		= {{
		-- MBIN_CHANGE_TABLE	= {
		-- {
			-- MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
			-- EXML_CHANGE_TABLE	= {
				-- {
					-- PRECEDING_KEY_WORDS	= 'LocTableList',
					-- ADD					= ToExml({
						-- META	= {'value', 'NMSString0x20.xml'},
						-- Value	= text_lines.locale
					-- })
				-- },
				-- {
					-- VALUE_CHANGE_TABLE 	= {
						-- {'DisableSaveSlotSorting', true}
					-- }
				-- }
			-- }
		-- }
	-- }}}
}
