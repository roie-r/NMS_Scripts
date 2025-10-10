--[[---------------------------------------------------------------------------
  - Add a new language texts mod -
  Collect text lines from scripts and generates LocTable.mxml
  Imports the __locale_text_import__ table from script files.
  color tag syntax: <RED>my red text<>
  Tags are defined in: METADATA/UI/SPECIALSTYLESDATA.MBIN

  NMS languages:
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
]]-----------------------------------------------------------------------------

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
	}
}--- __locale_text_import__ (do not delete)

-------------------------------------------------------------------------------
-- add text from external files
local externals = {
	'META/CUSTOM add options.lua',
	'META/VEHICLE scan targets.lua',
	'REALITY/PRODUCT.lua',
	'REALITY/TECHNOLOGY.lua',
	'REALITY/UNLOCKABLES.lua',
	'REALITY/~REALITY various.lua',
	'UI/~UI various.lua',
}
local script_lib = 'D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/'

-- collate texts from external files list
for _,src in ipairs(externals) do
	local r_src = io.open(script_lib..src, 'r')
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
			if not __locale_text_import__[id] then
				__locale_text_import__[id] = {}
			end
			for loc, txt in pairs(entries) do
				__locale_text_import__[id][loc] = txt
			end
		end
		texts = nil
	end
end

--- write LocTable ------------------------------------------------------------
dofile(script_lib..'LIB/_lua_2_mxml.lua')
dofile(script_lib..'LIB/table_entry.lua')

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

WriteExmlFile(
	'D:/SteamLibrary/steamapps/common/No Man\'s Sky/GAMEDATA/MODS/text ~@~locales/LocTable.mxml',
	LocalisationTable(__locale_text_import__),
	'cTkLocalisationTable'
)
