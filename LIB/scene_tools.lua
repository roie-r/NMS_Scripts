-------------------------------------------------------------------------------
---	MXML 2 LUA ... by lMonk
---	A tool for converting between mxml file format and lua table.
--- The complete tool can be found at: https://github.com/roie-r/mxml_2_lua
-------------------------------------------------------------------------------
---	Model scene tools ... version: 1.1.05
---	Build nested TkSceneNodeData nodes
-------------------------------------------------------------------------------

--	=> Build a TkSceneNodeAttributeData section
--	@param name: scene attribute name
--	@param value: scene attribute value
function ScAttribute(name, value)
	return {
		meta	= {name='Attributes', value='TkSceneNodeAttributeData'},
		Name	= name,
		Value	= type(value) == 'boolean' and (value and 'TRUE' or 'FALSE') or value
	}
end

--	=> Build a single -or list of TkSceneNodeData classes
--	@param props: a keyed table for scene class properties
--	{
--	  name	= scene node name (NameHash is calculated automatically)
--	  ntype	= scene node type
--	  form	= [optional] Transform data. a list of 9 ordered values or keyed values,
--			  but NOT a combination of the two!
--	  pxlud = [optional] PlatformExclusion
--	  attr	= [optional] Attributes table of {name, value} pairs
--	  child	= [optional] Children table for ScNode tables
--	}
function ScNode(nodes)
	--	returns a jenkins hash from a string (by lyravega)
	local function jenkinsHash(input)
		local hash = 0
		local t_chars = {string.byte(input:upper(), 1, #input)}

		for i = 1, #input do
			hash = (hash + t_chars[i]) & 0xffffffff
			hash = (hash + (hash << 10)) & 0xffffffff
			hash = (hash ~ (hash >> 6)) & 0xffffffff
		end
		hash = (hash + (hash << 3)) & 0xffffffff
		hash = (hash ~ (hash >> 11)) & 0xffffffff
		hash = (hash + (hash << 15)) & 0xffffffff
		return tostring(hash)
	end
	--	Build a TkSceneNodeData class
	local function sceneNode(props)
		local T	= {
			meta	= {name='Children', value='TkSceneNodeData'},
			Name 				= props.name,
			NameHash			= jenkinsHash(props.name),
			Type				= props.ntype,
			PlatformExclusion	= props.pxlud or nil
		}
		--	add TkTransformData class
		props.form = props.form or {}
		T.Form = {
			meta	= {name='Transform', value='TkTransformData'},
			TransX	= (props.form.tx or props.form[1]) or nil,
			TransY	= (props.form.ty or props.form[2]) or nil,
			TransZ	= (props.form.tz or props.form[3]) or nil,
			RotX	= (props.form.rx or props.form[4]) or nil,
			RotY	= (props.form.ry or props.form[5]) or nil,
			RotZ	= (props.form.rz or props.form[6]) or nil,
			ScaleX	= (props.form.s_ or props.form.sx or props.form[7]) or 1,
			ScaleY	= (props.form.s_ or props.form.sy or props.form[8] or props.form[7]) or 1,
			ScaleZ	= (props.form.s_ or props.form.sz or props.form[9] or props.form[7]) or 1
		}
		--	if present, add attributes list
		if props.attr then
			-- add accompanying attributes
			if props.attr.SCENEGRAPH then
				props.attr.EMBEDGEOMETRY = true
			elseif props.attr.TYPE then
				props.attr.NAVIGATION = false
			end
			T.Attr = { meta = {name='Attributes'} }
			for nm, val in pairs(props.attr) do
				T.Attr[#T.Attr+1] = ScAttribute(nm, val)
			end
		end
		if props.child then
		--	add children list if found
			local k,_ = next(props.child)
			local cnd = ScNode(props.child)
			T.Child	= k == 1 and cnd or {cnd}
			T.Child.meta = {name='Children'}
		end
		return T
	end
	return ProcessOnenAll(nodes, sceneNode)
end

--	=> Wrapper function. Accepts lua scene nodes and Returns an mxml string.
function AddSceneNodes(nodes)
	return ToMxml(ScNode(nodes))
end

--	=> Builds light TkSceneNodeData sections.
--	receives a table, or a table of tables, with the following (optional) parameters
--	Light node attributes:
--	  name= 'n9'	fov= 360	v=	0
--	  i=	9,		f=	2		rd=	5
--	  r=	1		g=	1		b=	1
--	  c=	'7E450A' (color as hex - overwrites rgb)
--	  mt=	MATERIALS/LIGHT.MATERIAL.MBIN
--	Transform node properties:
--	  tx=	0		ty=	0		tz=	0
--	  rx=	0		ry=	0		rz=	0
--	  sx=	1		sy=	1		sz=	1
function ScLight(lights)
	local function lightNode(lt)
		if lt.c then
			lt.c = lt.c:sub(#lt.c > 6 and 3 or 1, #lt.c) -- remove alpha if present
			for i, col in ipairs({'r', 'g', 'b'}) do
				lt[col] = Hex2Percent(lt.c, i)
			end
		end
		if not lt.rd and lt.i and lt.i >= 2 then
			lt.rd = lt.i / 2
		end
		return {
			name	= lt.name or 'n9',
			ntype	= 'LIGHT',
			form	= lt,
			attr	= {
				FOV			= lt.fov or 360,
				FALLOFF		= lt.f  or 2,
				INTENSITY	= lt.i  or 9,
				RADIUS		= lt.rd or 5,
				COL_R		= lt.r  or 1,
				COL_G		= lt.g  or 1,
				COL_B		= lt.b  or 1,
				COOKIE_IDX	= -1,
				VOLUMETRIC	= lt.v  or 0,
				LIGHTLAYERS	= lt.l  or 3,
				MATERIAL	= lt.mt or 'MATERIALS/LIGHT.MATERIAL.MBIN'
			}
		}
	end
	-----------------------------------------------------------------
	if lights then
		-- key==1 exists means multiple entries
		if lights[1] then
			local T = {}
			for _,l in pairs(lights) do
				T[#T+1] = lightNode(l)
			end
			return ScNode(T)
		end
	end
	return ScNode(lightNode(lights))
end

--	=> Wrapper function. Accepts lua light nodes and Returns an mxml string.
function AddLightNodes(lights)
	return ToMxml(ScLight(lights))
end

--	=> A direct access index for a SCENE file.
--	Transforms the node Attributes table to use attribute name as key
--	@param node: a cTkSceneNodeData scene table generated by ToLua
--	Returns a table referencing to TkSceneNodeData sections with nodes Name property as keys
function ScNodeNameIndex(node, keys)
	keys = keys or {}
	keys[node.Name] = node
	local att = node.Attributes
	if att and #att > 0 then
		for i=#att, 1, -1 do
			att[att[i].Name] = att[i]
			att[i] = nil
		end
	end
	for _, scn in ipairs(node.Children or {}) do
		ScNodeNameIndex(scn, keys)
	end
	return keys
end

--	=> A direct access tree for a SCENE file.
--	Transforms the nodes tree to named instead of sequential keys.
--	* ATTENTION: Scrambles the nodes order in the Children lists when converted back to mxml!
--	  The tree hierarchy is preserved and the scene remains functional.
--	Transforms the node Attributes table to use attribute name as key.
--	@param node: a cTkSceneNodeData scene table generated by ToLua
--	Returns a table referencing to TkSceneNodeData sections with nodes Name property as keys
function ScNodeNameTree(node, keys)
	keys = keys or {}
	keys[node.Name] = node
	local att = node.Attributes
	if att and #att > 0 then
		for i=#att, 1, -1 do
			att[att[i].Name] = att[i]
			att[i] = nil
		end
	end
	if node.Children then
		for i=#node.Children, 1, -1 do
			local n = node.Children[i]
			node.Children[n.Name] = n
			table.remove(node.Children, i)
			ScNodeNameTree(n, keys)
		end
	end
	return keys
end

--	=> Delete nodes from a scene file by node name
--	@param node: a cTkSceneNodeData scene table generated by ToLua
--	@param pattern: a scene's full name or pattern
function ScNodeDelete(node, pattern)
	for i, n in ipairs(node.Children or {}) do
		if n.Name:match(pattern) then
			table.remove(node.Children, i)
		else
			ScNodeDelete(n, pattern)
		end
	end
end
