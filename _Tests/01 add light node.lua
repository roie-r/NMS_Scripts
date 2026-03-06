
--[[
Hi, 
I had a look at your Relight script, and I think the new RADIUS attribute shouldn't be ignored. While it isn't essential, the light does work without it, HG added it for optimization - to reduce overlapping light sources.

The new function works as before, with a default for RADIUS that looks fine to me in-game.

]]

local function InsertNewLight(lt)
	if not lt.rd and lt.i and lt.i >= 2 then
		lt.rd = lt.i / 2
	end
	return (
	[[<Property name="Children" value="TkSceneNodeData">
		<Property name="Name" value="%s"/>
		<Property name="Type" value="LIGHT"/>
		<Property name="Transform" value="TkTransformData">
			<Property name="TransX" value="%s"/>
			<Property name="TransY" value="%s"/>
			<Property name="TransZ" value="%s"/>
			<Property name="RotX" value="%s"/>
			<Property name="RotY" value="%s"/>
			<Property name="RotZ" value="%s"/>
			<Property name="ScaleX" value="%s"/>
			<Property name="ScaleY" value="%s"/>
			<Property name="ScaleZ" value="%s"/>
		</Property>
		<Property name="Attributes">
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="FOV"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="FALLOFF"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="INTENSITY"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="RADIUS"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_R"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_G"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_B"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="COOKIE_IDX"/>
				<Property name="Value" value="-1"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="VOLUMETRIC"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="LIGHTLAYERS"/>
				<Property name="Value" value="%s"/>
			</Property>
			<Property name="Attributes" value="TkSceneNodeAttributeData">
				<Property name="Name" value="MATERIAL"/>
				<Property name="Value" value="%s"/>
			</Property>
		</Property>
	</Property>]]
	):format(
		lt.name or "NewLight",
		lt.tx	or 0,
		lt.ty	or 0,
		lt.tz	or 0,
		lt.rx	or 0,
		lt.ry	or 0,
		lt.rz	or 0,
		lt.sx	or 1,
		lt.sy	or 1,
		lt.sz	or 1,
		lt.fov	or 360,
		lt.f	or 2,
		lt.i	or 9,
		lt.rd	or 5,
		lt.r	or 1,
		lt.g	or 1,
		lt.b	or 1,
		lt.v	or 0,
		lt.l	or 3,
		lt.m	or "MATERIALS/LIGHT.MATERIAL.MBIN"
	)
end

local function InsertNewLight2(T_New)
	-- values from T_New will overwrite the defaults in T
	local T = {
		name = "NewLight",
		tx = 0,
		ty = 0,
		tz = 0,
		rx = 0,
		ry = 0,
		rz = 0,
		sx = 1,
		sy = 1,
		sz = 1,
		fov = 360,
		f = 2,
		i = 9,
		rd = 5,
		r = 1,
		g = 1,
		b = 1,
		v = 0
	}
	for k, v in pairs(T_New) do
		T[k] = v
	end
	return [[
	<Property value="TkSceneNodeData">
		<Property name="Name" value="]]..T.name..[[" />
		<Property name="Type" value="LIGHT" />
		<Property name="Transform" value="TkTransformData">
			<Property name="TransX" value="]]..T.tx..[[" />
			<Property name="TransY" value="]]..T.ty..[[" />
			<Property name="TransZ" value="]]..T.tz..[[" />
			<Property name="RotX" value="]]..T.rx..[[" />
			<Property name="RotY" value="]]..T.ry..[[" />
			<Property name="RotZ" value="]]..T.rz..[[" />
			<Property name="ScaleX" value="]]..T.sx..[[" />
			<Property name="ScaleY" value="]]..T.sy..[[" />
			<Property name="ScaleZ" value="]]..T.sz..[[" />
		</Property>
		<Property name="Attributes">
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="FOV" />
				<Property name="Value" value="]]..T.fov..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="FALLOFF" />
				<Property name="Value" value="]]..T.f..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="INTENSITY" />
				<Property name="Value" value="]]..T.i..[[" />
			</Property>
		<Property value="TkSceneNodeAttributeData">
					<Property name="Name" value="RADIUS" />
					<Property name="Value" value="]]..T.rd..[[" />
				</Property>
		<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_R" />
				<Property name="Value" value="]]..T.r..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_G" />
				<Property name="Value" value="]]..T.g..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="COL_B" />
				<Property name="Value" value="]]..T.b..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="COOKIE_IDX" />
				<Property name="Value" value="-1" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="VOLUMETRIC" />
				<Property name="Value" value="]]..T.v..[[" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="LIGHTLAYERS" />
				<Property name="Value" value="3" />
			</Property>
			<Property value="TkSceneNodeAttributeData">
				<Property name="Name" value="MATERIAL" />
				<Property name="Value" value="MATERIALS/LIGHT.MATERIAL.MBIN" />
			</Property>
		</Property>
	</Property>]]
end

print(InsertNewLight({f=2, fov=30, r=0.4}))