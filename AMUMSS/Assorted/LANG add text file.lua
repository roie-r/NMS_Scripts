------------------------------------------------------------------------------
local desc = [[
  Add a new language file.
  The new file's name must be added to LocTableList in GCDEBUGOPTIONS.GLOBAL.
]]----------------------------------------------------------------------------

local MyLines = {
	file = 'NMS_Loc88',
	lang = 1,
	entries = {
		EXO_SCAN_DEPOT =		[[Sentinel Depots]],
		EXO_SCAN_DROPPOD =		[[Emergency Drop Pods]],
		EXO_SCAN_INFEST =		[[Infested Buildings]],
		EXO_SCAN_RUIN =			[[Ancient Ruins]],
		EXO_SCAN_MEMORIAL =  	[[Racial Monuments]],
		EXO_SCAN_TRADE =		[[Merchant Outposts]],
		EXO_SCAN_COMMS =		[[Communication Centers]],
		EXO_SCAN_FACT =			[[Industrial Facilities]],
		EXO_SCAN_DISTRESS =		[[Distress Beacons]],
		EXO_SCAN_ARCHIVE =		[[Planetary Archives]],
		EXO_SCAN_BASE =			[[Calimable Sites]],
		EXO_SCAN_PILLAR =		[[Sentinel Control Nodes]],
		EXO_SCAN_SUB_INFEST =	[[Sunken Buildings]],
		EXO_SCAN_SUB_DISTRESS =	[[Drowned Distress Beacons]],
		EXO_SCAN_SUB_RUIN =		[[Underwater Ancient Ruins]],
		
		MECH_SCAN_FACT =		[[Industrial Facilities]],
		VEHICLE_BUILDING_NPC =	[[Racial Monuments]],
		SIGNAL_PLAQUE =			[[Racial Plaque Detected]],
		SIGNAL_MONOLITH =		[[Racial Monolith Detected]],
	}
}

------------------------------------------------------------------------------

local Languages = {
	'English',				-- 1
	'French',				-- 2
	'Italian',				-- 3
	'German',				-- 4
	'Spanish',				-- 5
	'Russian',				-- 6
	'Polish',				-- 7
	'Dutch',				-- 8
	'Portuguese',			-- 9
	'LatinAmericanSpanish',	-- 10
	'BrazilianPortuguese',	-- 11
	'SimplifiedChinese',	-- 12
	'TraditionalChinese',	-- 13
	'TencentChinese',		-- 14
	'Korean',				-- 15
	'Japanese',				-- 16
	'USEnglish'				-- 17
}

local function Tag_1P_Closed(a, v, d, p)
	p = p or 'Property'
	return string.format('<%s %s="%s">%s</%s>', p, a, v, d, p)
end
local function Tag_2P_Closed(a, v, d)
	return string.format('<Property name="%s" value="%s">%s</Property>', a, v, d)
end
local function Tag_2P_Empty(a, v)
	return string.format('<Property name="%s" value="%s" />', a, v)
end

local function BuildLocalText(mylines)
	local exml = {}
	for id, val in pairs(mylines.entries) do
		ex = {Tag_2P_Empty('Id', id)}
		for i=1, #Languages do
			t = ''
			if mylines.lang == i then t = val end
			t = Tag_2P_Empty('Value', t)
			table.insert(ex, Tag_2P_Closed(Languages[i], 'VariableSizeString.xml', t))
		end
		table.insert(exml, Tag_1P_Closed('value', 'TkLocalisationEntry.xml', table.concat(ex)))
	end
	return table.concat(exml)
end

local function New_Mbin_Wrapper(content)
	return '<?xml version="1.0" encoding="utf-8"?>'
		..
		Tag_1P_Closed(
			'template',
			'TkLocalisationTable',
			Tag_1P_Closed('name', 'Table', content),
			'Data'
		)
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= string.format('_LANG %s_%s.pak', MyLines.file, Languages[MyLines.lang]),
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.84,
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS		= {
	-- {
		-- MBIN_CHANGE_TABLE	= {{
			-- MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
			-- EXML_CHANGE_TABLE	= {
				-- {
					-- PRECEDING_KEY_WORDS	= 'LocTableList',
					-- ADD =
						-- Tag_1P_Closed(
							-- 'value',
							-- 'NMSString0x20.xml',
							-- Tag_2P_Empty('Value', MyLines.file)
						-- )
				-- },
				-- {
					-- VALUE_CHANGE_TABLE 	= {
						-- {'DisableSaveSlotSorting', true}
					-- }
				-- }
			-- }
		-- }}
	-- }
	},
	ADD_FILES = {
		{
			FILE_CONTENT	 = New_Mbin_Wrapper(BuildLocalText(MyLines)),
			FILE_DESTINATION = string.format(
				'LANGUAGE/%s_%s.EXML',
				MyLines.file,
				Languages[MyLines.lang]
			)
		}
	}
}
