--------------------------------------------------------------------------------
---	helper functions and others to come
--------------------------------------------------------------------------------

---	property attribute names
AT={ NM='name', VL='value' }

---	InventoryType Enum
I_={	PRD='Product',		SBT='Substance',	TCH='Technology' }

-- replace a boolean with its text (ignore otherwise)
function bool(b)
	return (type(b) == 'boolean') and ((b == true) and 'True' or 'False') or b
end

-- get the count of ALL objects in a table
function len2(t)
	i = 0; for _ in pairs(t) do i = i + 1 end ; return i
end

-- build EXML-tagged text from a lua table representation of exml class data
function Exml_r(tbl)
	local tag1C = '<Property %s="%s">%s</Property>'
	local tag1O = '<Property %s="%s"/>'
	local tag2C = '<Property name="%s" value="%s">%s</Property>'
	local tag2O = '<Property name="%s" value="%s"/>'
	local exml = ''
	for key, cls in pairs(tbl) do
		if key ~= 'META' then
			if type(cls) == 'table' then
				local att, val = cls['META'][1], cls['META'][2]
				-- envelope tag for the table - analyze meta: choose 1 or 2 attributes
				local tag2 = (att == 'name' or att == 'value') and tag1C or tag2C
				-- add and recurs for an inner table
				exml =  exml..string.format(tag2, att, val, Exml_r(cls))
			else
				-- add normal property
				local tag1 = (key == 'name' or key == 'value') and tag1O or tag2O
				exml =  exml..string.format(tag1, key, bool(cls))
			end
		end
	end
	return exml
end

-- check for table structure and meta placement
-- add the needed layer for the recursion and handle multiple tables
function ToExml(cls)
	local klen = len2(cls)
	if klen == 1 and cls[1].META then
		return Exml_r(cls)
	elseif cls.META and klen > 1 then
		return Exml_r( {cls} )
	-- concatenate unrelated exml sections, instead of nested inside each other
	elseif type(cls[1]) == 'table' and klen > 1 then
		local T = {}
		for _, tb in pairs(cls) do
			table.insert(T, Exml_r((tb.META and klen > 1) and {tb} or tb))
		end
		return table.concat(T)
	end
end

-- receives a table containing:
-- 1 string. if ends with [.xml] then attribute is value, otherwise is name
-- 2 table of data strings
function Tag1P(t)
	return string.format('<Property %s="%s">%s</Property>',
		(t[1]:find('.xml') and 'value' or 'name'),
		t[1],
		table.concat(t[2])
	)
end

-- receives a table containing:
-- 1 name attribute string
-- 2 value attribute string
-- 3 data string [optional]	(table of strings if more than one)
function Tag2P(t)
	return string.format('<Property name="%s" value="%s"%s',
		t[1],
		(type(t[2])=='boolean' and bool(t[2]) or t[2]),
		(#t > 2 and '>'..(type(t[3])=='table' and table.concat(t[3]) or t[3])..'</Property>' or '/>')
	)
end

function Node(t)
	return ((type(t[2])=='table') and Tag1P or Tag2P)(t)
end

Sc = {}
-- T (optional) is a table containing other scene properties in Exml table format
function TkScene1(n, tp, T)
	T = T or {}
	T.META	= {'value', 'TkSceneNodeData.xml'}
	T.Name	= n
	T.Type	= tp
	return T
end

function TkTransform1(t)
	t = t or {}
	return {
		META	= {'Transform', 'TkTransformData.xml'},
		TransX	= ((t.tx or t[1]) or 0),
		TransY	= ((t.ty or t[2]) or 0),
		TransZ	= ((t.tz or t[3]) or 0),
		RotX	= ((t.rx or t[4]) or 0),
		RotY	= ((t.ry or t[5]) or 0),
		RotZ	= ((t.rz or t[6]) or 0),
		ScaleX	= ((t.sx or t[7]) or 1),
		ScaleY	= ((t.sy or t[8]) or 1),
		ScaleZ	= ((t.sz or t[9]) or 1)
	}
end

function TkAttributes1(t)
	local T = {META = {'name', 'Attributes'}}
	for _,at in ipairs(t) do
		table.insert(T, {
			META	= {'value', 'TkSceneNodeAttributeData.xml'},
			Name	= at[1],
			Value	= at[2]
		})
	end
	return T
end

function TkChildren1(t)
	t.META = {'name', 'Children'}
	return t
end

function ColorData(t)
	return {
		-- if a name (n) is present then use 2-property tag
		META	= {(t.n or 'value'), 'Colour.xml'},
		R		= (t[1] or 1),
		G		= (t[2] or 1),
		B		= (t[3] or 1),
		A		= (t[4] or 1)
	}
end

function Hex2Prc(h)
	-- translates a 2^16 hex string to 0-1.0 percentage
	-- math.floor(X / 255 * 1000) / 1000 == X * 0.00392
	return tonumber(h, 16) * 0.00392
end

function ColorFromHex(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (hex:len()/2) do
		rgb[i][2] = Hex2Prc(hex:sub(i*2-1, i*2))
	end
	return rgb
end

function ScLight(newlight)
	local light = {
		name= 'n9',	fov= 360,
		i=	30000,	f=	'q',	fr=	2,
		r=	1,		g=	1,		b=	1,
		tx=	0,		ty=	0,		tz=	0,
		rx=	0,		ry=	0,		rz=	0,
		sx=	1,		sy=	1,		sz=	1
	}
	for k, v in pairs(newlight or {}) do light[k] = v end
	-- c = color as hex string. overwrites rgb if present.
	if light.c then
		light.r = Hex2Prc(light.c:sub(1, 2))
		light.g = Hex2Prc(light.c:sub(3, 4))
		light.b = Hex2Prc(light.c:sub(5, 6))
	end
	return ScNode(
		light.name, 'LIGHT', {
			ScTransform(light),
			ScAttributes({
				{'FOV',		 	light.fov},
				{'FALLOFF',	 	(light.f:sub(1,1) == 'q' and 'quadratic' or 'linear')},
				{'FALLOFF_RATE',light.fr},
				{'INTENSITY',	light.i},
				{'COL_R',		light.r},
				{'COL_G',		light.g},
				{'COL_B',		light.b},
				{'VOLUMETRIC',	0},
				{'COOKIE_IDX',	-1},
				{'MATERIAL',	'MATERIALS/LIGHT.MATERIAL.MBIN'}
			})
		}
	)
end
-- wrapper: return the exml text of LightScene
function AddNewLight(l)  return ToExml(ScLight(l)) end

function FileWrapping(template, data)
	return '<?xml version="1.0" encoding="utf-8"?><Data template="'..template..'">'..data..'</Data>'
end


entity_components = {
	{
		META = {'value', 'GcSimpleInteractionComponentData.xml'},
		SimpleInteractionType	= 'Save',
		TriggerAction			= 'INACTIVE',
		HideContents			= true
	},
	{
		META = {'value', 'GcTriggerActionComponentData.xml'},
		{
			META = {'name', 'States'},
			{
				META	= {'value', 'GcActionTriggerState.xml'},
				StateID	= 'BOOT',
				{
					META	= {'name', 'Triggers'},
					{
						META	= {'value', 'GcActionTrigger.xml'},
						{
							META	= {'Event', 'GcAnimFrameEvent.xml'},
							Anim	= 'SAVEGAME'
						},
						{
							META	= {'name', 'Action'},
							{
								META	= {'value', 'GcGoToStateAction.xml'},
								State	= 'SAVE'
							}
						}
					}
				}
			},
			{
				META	= {'value', 'GcActionTriggerState.xml'},
				StateID	= 'SAVE',
				{
					META	= {'name', 'Triggers'},
					{
						META	= {'value', 'GcActionTrigger.xml'},
						{
							META	= {'Event', 'GcStateTimeEvent.xml'},
							Seconds	= 0
						},
						{
							META	= {'name', 'Action'},
							value	= 'GcFireSimpleInteractionAction.xml',
							{
								META			= {'value', 'GcPlayAudioAction.xml'},
								Sound			= 'SignalScanner',
								OcclusionRadius	= 2
							},
							{
								META	= {'value', 'GcGoToStateAction.xml'},
								State	= 'BOOT'
							}
						}
					}
				}
			}
		}
	}
}

uit_meta = {'value', 'GcUnlockableItemTreeNode.xml'}
children = {'name', 'Children'}

unlockables = {
	{
		META = {'Root', 'GcUnlockableItemTreeNode.xml'},
		Unlockable = 'SHIPJUMP_ALIEN',
		{
			META = children,
			{
				META = uit_meta,
				Unlockable = 'WARP_ALIEN'
			},
			{
				META = uit_meta,
				Unlockable	= 'SHIPGUN_ALIEN',
				{
					META = children,
					{
						META = uit_meta,
						Unlockable = 'SHIPLAS_ALIEN'
					},
					{
						META = uit_meta,
						Unlockable = 'SHIELD_ALIEN'
					},
				}
			},
			{
				META = uit_meta,
				Unlockable = 'LAUNCHER_ALIEN',
				{
					META = children,
					{
						META = uit_meta,
						Unlockable = 'CHARGER_ALIEN'
					}
				}
			},
			{
				META = uit_meta,
				Unlockable = 'SHIPSCAN_ALIEN',
				{
					META = children,
					{
						META = uit_meta,
						Unlockable = 'CARGO_S_ALIEN'
					}
				}
			}
		}
	}
}

-- print(ToExml(unlockables))

scene_02 = {
	{
		META = {'value', 'TkSceneNodeData.xml'},
		Name = 'Interaction',
		Type = 'LOCATOR',
		{
			META	= {'Transform', 'TkTransformData.xml'},
			TransX	= 7,
			RotY	= 210,
			ScaleZ	= 3
		},
		{
			META = {'name', 'Attributes'},
			{
				META	= {'value', 'TkSceneNodeAttributeData.xml'},
				Name	= 'ATTACHMENT',
				Value	= 'TECH/CUBEROOM_PLANTERMEGA/INTERACTION.ENTITY.MBIN'
			}
		},
		{
			META = {'name', 'Children'},
			{
				META = {'value', 'TkSceneNodeData.xml'},
				Name = 'collision99',
				Type = 'COLLISION',
				{
					META	= {'Transform', 'TkTransformData.xml'},
					TransX	= 3,
					RotY	= 135,
					ScaleZ	= 1
				},
				{
					META = {'name', 'Attributes'},
					{
						META	= {'value', 'TkSceneNodeAttributeData.xml'},
						Name	= 'TYPE',
						Value	= 'Sphere'
					},
					{
						META	= {'value', 'TkSceneNodeAttributeData.xml'},
						Name	= 'RADIUS',
						Value	= 1
					}
				}
			},
			{
				META = {'value', 'TkSceneNodeData.xml'},
				Name = 'interaction2',
				Type = 'LOCATOR',
				{
					META	= {'Transform', 'TkTransformData.xml'},
					TransX	= 1,
					RotY	= 40,
					ScaleZ	= 2
				}
			}
		}
	},
	{
		META = {'value', 'GcGenericRewardTableEntry.xml'},
		Id	 = 'R_ABAND_CAPS',
		{
			META = {'List', 'GcRewardTableItemList.xml'},
			RewardChoice	 = 'SelectAlways',
			OverrideZeroSeed = false,
			UseInventoryChoiceOverride = false,
			{
				META = {'name', 'List'},
				{
					META = {'value', 'GcRewardTableItem.xml'},
					PercentageChance = 20,
					{
						META = {'Reward', 'GcRewardSpecificSubstance.xml'},
						{
							META = {'Default', 'GcDefaultMissionSubstanceEnum.xml'},
							DefaultSubstanceType = 'None'
						},
						ID					= 'OXYGEN',
						AmountMin			= 10,
						AmountMax			= 25,
						DisableMultiplier	= false,
						RewardAsBlobs		= true,
						UseFuelMultiplier	= false,
						Silent				= false
					}
				},
				{
					META = {'value', 'GcRewardTableItem.xml'},
					PercentageChance = 20,
					{
						META = {'Reward', 'GcRewardSpecificProduct.xml'},
						{
							META = {'Default', 'GcDefaultMissionProductEnum.xml'},
							DefaultProductType = 'None'
						},
						ID					= 'GRENFUEL1',
						AmountMin			= 1,
						AmountMax			= 2,
						HideAmountInMessage	= false,
						ForceSpecialMessage	= false,
						HideInSeasonRewards	= false,
						Silent				= false,
						RequiresTech		= '',
						SeasonRewardListFormat	= ''
					}
				}
			}
		}
	}
}

-- print(ToExml(scene_02))


-- local function AddSceneInteractionNode2(path)
-- 	return [[
-- 	<Property value="TkSceneNodeData.xml">
-- 		<Property name="Name" value="Interaction"/>
-- 		<Property name="Type" value="LOCATOR"/>
-- 		<Property name="Transform" value="TkTransformData.xml">
-- 			<Property name="TransX" value="0"/>
-- 			<Property name="TransY" value="1"/>
-- 			<Property name="TransZ" value="0"/>
-- 			<Property name="RotX" value="0"/>
-- 			<Property name="RotX" value="0"/>
-- 			<Property name="RotX" value="0"/>
-- 			<Property name="ScaleX" value="1"/>
-- 			<Property name="ScaleY" value="1"/>
-- 			<Property name="ScaleZ" value="1"/>
-- 		</Property>
-- 		<Property name="Attributes">
-- 			<Property value="TkSceneNodeAttributeData.xml">
-- 				<Property name="Name" value="ATTACHMENT"/>
-- 				<Property name="Value" value="]]..build_parts..path..[["/>
-- 			</Property>
-- 		</Property>
-- 		<Property name="Children">
-- 			<Property value="TkSceneNodeData.xml">
-- 				<Property name="Name" value="collision99"/>
-- 				<Property name="Type" value="COLLISION"/>
-- 				<Property name="Transform" value="TkTransformData.xml">
-- 					<Property name="TransX" value="0"/>
-- 					<Property name="TransY" value="0"/>
-- 					<Property name="TransZ" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="ScaleX" value="1"/>
-- 					<Property name="ScaleY" value="1"/>
-- 					<Property name="ScaleZ" value="1"/>
-- 				</Property>
-- 				<Property name="Attributes">
-- 					<Property value="TkSceneNodeAttributeData.xml">
-- 						<Property name="Name" value="TYPE"/>
-- 						<Property name="Value" value="Sphere"/>
-- 					</Property>
-- 					<Property value="TkSceneNodeAttributeData.xml">
-- 						<Property name="Name" value="RADIUS"/>
-- 						<Property name="Value" value="1"/>
-- 					</Property>
-- 				</Property>
-- 				<Property name="Children"/>
-- 			</Property>
-- 			<Property value="TkSceneNodeData.xml">
-- 				<Property name="Name" value="interaction2"/>
-- 				<Property name="Type" value="LOCATOR"/>
-- 				<Property name="Transform" value="TkTransformData.xml">
-- 					<Property name="TransX" value="0"/>
-- 					<Property name="TransY" value="0"/>
-- 					<Property name="TransZ" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="RotX" value="0"/>
-- 					<Property name="ScaleX" value="1"/>
-- 					<Property name="ScaleY" value="1"/>
-- 					<Property name="ScaleZ" value="1"/>
-- 				</Property>
-- 			</Property>
-- 		</Property>
-- 	</Property>]]
-- end
