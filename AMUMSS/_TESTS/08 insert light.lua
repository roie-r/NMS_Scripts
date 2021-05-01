--[[┎──────────────────────────────────────────────────────
	┃ Insert new light object to MBIN
────┸──────────────────────────────────────────────────--]]

local function InsertNewLight(T_New)
	-- the local function accepts new values (examples below) and takes the rest from the local table
	-- values from T_New will overwrite the defaults in T
	local T = {
		name = 'Light9',
		hash = 0,
		tx = 0,
		ty = 0,
		tz = 0,
		rx = 0,
		ry = 0,
		rz = 0,
		sx = 0,
		sy = 0,
		sz = 0,
		fov = 360,
		fall = 'quadratic',
		ints = 30000,
		r = 1,
		g = 1,
		b = 1,
		vol = 0
	}
	for k, v in pairs(T_New) do T[k] = v end

	return [[
		<Property value="TkSceneNodeData.xml">
			<Property name="Name" value="]] .. T.name .. [[" />
			<Property name="NameHash" value="]] .. T.hash .. [[" />
			<Property name="Type" value="LIGHT" />
			<Property name="Transform" value="TkTransformData.xml">
				<Property name="TransX" value="]] .. T.tx .. [[" />
				<Property name="TransY" value="]] .. T.ty .. [[" />
				<Property name="TransZ" value="]] .. T.tz .. [[" />
				<Property name="RotX" value="]] .. T.rx .. [[" />
				<Property name="RotY" value="]] .. T.ry .. [[" />
				<Property name="RotZ" value="]] .. T.rz .. [[" />
				<Property name="ScaleX" value="]] .. T.sx .. [[" />
				<Property name="ScaleY" value="]] .. T.sy .. [[" />
				<Property name="ScaleZ" value="]] .. T.sz .. [[" />
			</Property>
			<Property name="Attributes">
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="FOV" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.fov .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="FALLOFF" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.fall .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="INTENSITY" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.ints .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="COL_R" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.r .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="COL_G" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.g .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="COL_B" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.b .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="COOKIE_IDX" />
					<Property name="AltID" value="" />
					<Property name="Value" value="-1" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="VOLUMETRIC" />
					<Property name="AltID" value="" />
					<Property name="Value" value="]] .. T.vol .. [[" />
				</Property>
				<Property value="TkSceneNodeAttributeData.xml">
					<Property name="Name" value="MATERIAL" />
					<Property name="AltID" value="" />
					<Property name="Value" value="MATERIALS/LIGHT.MATERIAL.MBIN" />
				</Property>
			</Property>
			<Property name="Children" />
		</Property>
	]]
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 08 insert new light.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS\SPACE\SPACESTATION\MODULARPARTS\DOCK\BACK_SECTION.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'pointLight5'},
				REPLACE_TYPE		= 'ADDAFTERSECTION',
				ADD 				=
					InsertNewLight({name='pointLight7h', hash=2789731183, tx=17.42, ty=115.92, ints=38000, r=0.9})
					..
					InsertNewLight({b=0.75, ry=15.4, fov=130})
					..
					InsertNewLight({name='oneMoreLight', fov=110, sy=1.2, fall='linear'})
			}
		}
	}
}}}}
