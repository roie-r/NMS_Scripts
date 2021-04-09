--[[┎────────────────────────────────────────
	┃ snippets to tun
────┸────────────────────────────────────--]]

T1 = {one='black', two='red', three='blue'}
T2 = {one='cat', two='dog', three='horse', four='mouse'}

-- for k, v in pairs(T1) do T2[k] = v end
-- for k, v in pairs(T2) do print(k, v) end

-- math.randomseed(81684 * os.time())
-- math.random()

function temp02()
	a =	AddNewScanEvent('Base')
		..
		AddNewScanEvent('Plaque')
		..
		AddNewScanEvent('Terminal')
		..
		AddNewScanEvent('LIBRARY')
	print(a)
	return	a
end

print(temp02())

-- print(2 ^ 4)