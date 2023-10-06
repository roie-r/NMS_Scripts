-------------------------------------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/exml_2_lua.lua')
-------------------------------------------------------------------------------------------------------------------
function ReadExml(path)
	local rf = io.open(path, 'r')
	local t = ToLua(rf:read('*a'))
	rf:close()
	return t
end

function PrintAsLua(path)
	local wf = io.open('d:/_dump/exml_source.lua', 'w')
	wf:write(PrintExmlAsLua(io.open(path, 'r'):read('*a')))
	wf:close()
end

exml = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/CATALOGUECRAFTING.EXML'
-- exml = 'D:/MODZ_stuff/NoMansSky/UNPACKED/METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.EXML'

source = ReadExml(exml)
-- PrintAsLua(exml)

for _, dat in ipairs(source.template.Categories[1].Items) do
	print(dat.Value)
end

-- for _, dat in ipairs(source.template.Table) do
	-- print(dat.ID..' >> ' ..dat.ChargeAmount)
-- end
