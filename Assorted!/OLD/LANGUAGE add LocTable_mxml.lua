--[[------------------------------------------------------------------------------------------------------
  --- A standalone lua script to create a locale texts mod ... by lMonk ---

  The purpose of this approach is having the locale texts placed in their respective mod scripts,
  while having a single place that builds a single LocTable.

  The texts are placed in the specifically-formatted table __locale_text_import__, copied from below,
  and placed at the end of any text file. The file's path is added to external_files table below.

  * This is NOT an amumss script - you just run it with lua.exe "LANGUAGE add LocTable_mxml.lua"
]]--------------------------------------------------------------------------------------------------------

local mod_name   = 'x Locale Texts'
local nms_mods   = 'D:/SteamLibrary/steamapps/common/No Man\'s Sky/GAMEDATA/MODS/'

local __locale_text_import__ = {
---	New text ---
	UI_TECH_EXPLORE_SUB = {
		EN = [[Craftable Exploratory Blueprints]],
	},

---	Existing text overwritten ---
	PC_MENU_QUIT_TO_DESKTOP = {
		EN = [[Just Go Away]],
		FR = [[Pars tout simplement]],
		KO = [[그냥 가버려]],
	},
}--- __locale_text_import__ (essential placeholder - do not delete!)

-- add text from external files
local external_files = {
	'D:/NMS_mod_files/nms products.lua',
	'D:/NMS_mod_files/nms ship technology.lua',
	'D:/NMS_mod_files/nms miscellaneous fixes.lua',
}

-------------------------------------------------------------------------------
-- nms languages list
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

-- collate texts from external files list
for _,src in ipairs(external_files) do
	local r_src = io.open(src, 'r')
	local chunk = nil
    for sec in r_src:read('a'):gmatch('(.-)__locale_text_import__') do
		-- get the last-found chunk (should be only two)
        chunk = sec
    end
	r_src:close()
	if #chunk > 0 then
		-- load chunk containing locale texts
		local texts = load('return '..chunk:sub(chunk:find('{'), -1))()
		for id, entries in pairs(texts) do
			__locale_text_import__[id] = {}
			for loc, txt in pairs(entries) do
				__locale_text_import__[id][loc] = txt
			end
		end
		texts = nil
	end
end

-- replace problematic characters with char entities
local function insertCharEntities(s)
	local entity = {
		{'&',	'&amp;'}, -- must be first
		{'<',	'&lt;'},
		{'>',	'&gt;'},
		{'"',	'&quot;'},
		{'|N|',	'&#xA;'}
	}
	for _,e in ipairs(entity) do
		s = s:gsub(e[1], e[2])
	end
	return s
end

-- build a complete localisation table file
local lcl_tbl = {}
for id, texts in pairs(__locale_text_import__) do
	local tmp = {}
	for code, txt in pairs(texts) do
		tmp[#tmp+1] = ('<Property name="%s" value="%s"/>'):format(languages[code], insertCharEntities(txt))
	end
	lcl_tbl[#lcl_tbl+1] = (
		[[<Property name="Table" value="TkLocalisationEntry">
			<Property name="Id" value="%s"/>
			%s
		</Property>]]
	):format(id, table.concat(tmp))
end

-- write mod file
os.execute(('if not exist "<>" md "<>"'):gsub('<>', nms_mods..mod_name))

local w_src = io.open(nms_mods..mod_name..'/LocTable.mxml', 'w')

w_src:write([[<?xml version="1.0" encoding="utf-8"?>
<Data template="cTkLocalisationTable">
  <Property name="Table">]]..table.concat(lcl_tbl)..[[</Property>
</Data>]])
w_src:close()

print(mod_name..' mod created.')