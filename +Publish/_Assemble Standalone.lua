--[[---------------------------------------------------------------------------
  --- Assemble a non-depended amumss script ---
  Remove LIB dependencies by coping over all needed assets to the script
]]-----------------------------------------------------------------------------

local mod_script = 'Scientific Restoration.lua'

local l2m_header = [[
---	MXML 2 LUA ... by lMonk ... version: 1.0.01
---	A tool for converting between mxml file format and lua table.
--- The complete tool can be found at: https://github.com/roie-r/mxml_2_lua
]]

local lib_path = {
	'../LIB/_lua_2_mxml.lua',
	'../LIB/_mxml_2_lua.lua',
	'../LIB/reward_entry.lua',
	'../LIB/table_entry.lua',
	'../LIB/scene_tools.lua',
}

local mx2l_lib = {}
local mx2l_enum = {}
for _,f in ipairs(lib_path) do
	local r_src = io.open(f, 'r')
	local chunk = r_src:read('a')
	-- collate functions from library with their comments
    for func in chunk:gmatch('(\n%-%-\t%=>.-\n%l*[ ]?function .-\nend)') do
		local name = func:match('\n%l*[ ]?function (.-)%(.-%).+')
		mx2l_lib[name] = {
			func = func:gsub('\nfunction ', '\nlocal function '), -- insert local
			depend = {}
		}
	end
	-- collate enums from library scripts
    for enum in chunk:gmatch('\n([A-Z][A-Z]_[ ]?=[ ]?{.-Enum.-})-- Enum') do
		local name = enum:match('^(.-)[ ]?=')
		mx2l_enum[name] = enum
	end
	r_src:close()
end

-- find dependencies for each function
for f0, data in pairs(mx2l_lib) do
	for f1,_ in pairs(mx2l_lib) do
		if data.func:match(f1..'%(.-%)') and f0 ~= f1 then
			data.depend[#data.depend+1] = f1
		end
	end
end

local function GetFileName(f)
	return f:match('([^\\/]+)%.')
end

local function PrepareFuncChunk(funcs, enums)
	local block = {}

	-- ToMxml is always first
	local fnlist = {ToMxml=true}
	block[#block+1] = mx2l_lib['ToMxml'].func..'\n'

	for e1,_ in pairs(enums) do
		block[#block+1] = '\nlocal '..mx2l_enum[e1]..'\n'
	end
	for f1,_ in pairs(funcs) do
		for _,s in ipairs(mx2l_lib[f1].depend) do
			if not fnlist[s] then
				block[#block+1] = mx2l_lib[s].func..'\n'
				fnlist[s] = true
			end
		end
		if not fnlist[f1] then
			block[#block+1] = mx2l_lib[f1].func..'\n'
			fnlist[f1] = true
		end
	end
	-- concat found resources in a text block and escape escapes
	return table.concat(block):gsub('%%', '%%%%')
end

-- find lib sources used in the script
local function FindLibsUsedInTarget(trg)
	local funcs = {}
	for name,_ in pairs(mx2l_lib) do
		if trg:match('[= \t]?'..name..'%(?') then
			funcs[name] = true
		end
	end
	local enums = {}
	for name,_ in pairs(mx2l_enum) do
		if trg:match('[^%w]'..name..'%.') then
			enums[name] = true
		end
	end
	return funcs, enums
end

-- processing target script
if #arg < 3 then mod_script = arg[1] end -- use arg if appropriate
local r_scpt = io.open(mod_script, 'r')
local target = r_scpt:read('a')

-- remove dofiles
target = target:gsub('dofile%(.-%)\n', '')

local funcs, enums = FindLibsUsedInTarget(target)
if next(funcs) or next(enums) then
	local output = {
		l2m_header,
		('-'):rep(80),
		PrepareFuncChunk(funcs, enums),
		('-'):rep(80),
	}
	target = target:gsub('--<<M2L marker>>--', table.concat(output))
	local w_scpt  = io.open(GetFileName(mod_script)..' (M2L).lua', 'w')
	w_scpt:write(target)
	w_scpt:close()

	print(GetFileName(mod_script)..' non-depended version assembled.')
else

	print('No external dependencies found in script!')
end
