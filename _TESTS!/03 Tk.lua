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

--	Remove the EXML header and data template if found
--	The template is re-added as a property
local function UnWrap(data)
	if data:sub(1, 5) == '<?xml' then
		local template = data:match('<Data template="([%w_]+)">')
		return '<Property name="template" value="'..template..'">\n'..
				data:sub(data:find('<Property'), -8)..'</Property>'
	else
		return data
	end
end

function PrintExmlAsLua2(exml, indent, com)
	local function eval(val)
		-- return a value as its real type
		if val == 'True' then
			return true
		elseif val == 'False' then
			return false
		else
			return '[['..val..']]'
		end
	end
	local tag1	= [[<Property ([%w_]+)="(.+)"[ ]?([/]?)>]]
	local tag2	= [[<Property name="([%w_]+)" value="(.*)"[ ]?([/]?)>]]
	indent		= indent or '\t'
	com			= com or [[']]
	local tlua	= {'exml_source = '}
	local lvl	= 0
	--	array=true when processing an ordered (name) section
	local array	= false
	local st_array	= {false}
	for line in UnWrap(exml):gmatch('([^\n]+)') do -- parse lines
		if line:match('Property') then -- properties only
			_,eql = line:gsub('=', '')
			if eql > 0 then
				-- choose tag by the count of [=] in a line
				local att, val, close = line:match(eql > 1 and tag2 or tag1)
				if close == '' then
					-- opening a new table
					array = att == 'name'
					-- lookup if parent is an array
					if st_array[#st_array] or att == 'value' then
						tlua[#tlua+1] = string.format('%s{\n', indent:rep(lvl))
					else
						tlua[#tlua+1] = string.format('%s%s = {\n',
							indent:rep(lvl),
							att == 'name' and val or att
						)
					end
					table.insert(st_array, att == 'name')
					lvl = lvl + 1
					tlua[#tlua+1] = string.format('%sMETA = {%s%s%s, %s%s%s},\n',
						indent:rep(lvl), com, att, com, com, val, com
					)
				else
					if att == 'value' or array then
						-- value property or properties in an array
						tlua[#tlua+1] = string.format('%s{%s = %s%s%s},\n',
							indent:rep(lvl), att, com, val, com
						)
					elseif att ~= 'name' then
						-- regular property (skips stubs)
						tlua[#tlua+1] = string.format('%s%s = %s,\n', indent:rep(lvl), att, eval(val))
					end
				end
			else
				-- closing the table
				lvl = lvl - 1
				tlua[#tlua+1] = indent:rep(lvl)..'},\n'
				table.remove(st_array)
			end
		end
	end
	-- trim start & end
	if tlua[2]:len() > 3 then tlua[2] = '{\n' end
	tlua[#tlua] = '}'
	return table.concat(tlua)
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

function Hex2Percent(h)
	-- translates a 2^16 hex string to 0-1.0 percentage
	-- math.floor(X / 255 * 1000) / 1000 == X * 0.00392
	return tonumber(h, 16) * 0.00392
end

function ColorFromHex(hex)
	local rgb = {{'R', 1}, {'G', 1}, {'B', 1}, {'A', 1}}
	for i=1, (hex:len()/2) do
		rgb[i][2] = Hex2Percent(hex:sub(i*2-1, i*2))
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
		light.r = Hex2Percent(light.c:sub(1, 2))
		light.g = Hex2Percent(light.c:sub(3, 4))
		light.b = Hex2Percent(light.c:sub(5, 6))
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

--	Pretty-print a lua table as a ready-to-work script
--	(Doesn't maintain the original exml class order)
function TableToString(tbl, name, l)
	local lvl		= l or 1
	local indent	= '\t'
	name			= name or 'source_09'
	local slua		= {}
	function slua:add(t)
		for _,v in ipairs(t) do self[#self+1] = v end
	end
	local function key(s)
		return tonumber(s) and '' or s..' = '
	end
	local function eval(v)
		if v == true then
			return 'true'
		elseif v == false then
			return 'false'
		else
			return '[['..v..']]'
		end
	end
	slua:add({key(name), '{\n'})
	for k, val in pairs(tbl) do
		if type(val) ~= 'table' then
			slua:add({indent:rep(lvl), key(k), eval(val), ',\n'})
		else
			slua:add({indent:rep(lvl), TableToString(val, k, lvl + 1), ',\n'})
		end
	end
	lvl = lvl - 1
	slua:add({indent:rep(lvl), '}'})
	return table.concat(slua)
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

exml_source = {
	META = {'template', 'TkAnimMetadata'},
	FrameCount = 10,
	NodeCount  = 1,
	NodeData   = {
		META = {'name', 'NodeData'},
		{
			META = {'value', 'TkAnimNodeData.xml'},
			Node = 'SpeedCool',
			CanCompress = true
		}
	}
}

local spin_entity = {
	META = {'template', 'TkAttachmentData'},
	Components = {
		META = {'name', 'Components'},
		{
			META  = {'value', 'TkRotationComponentData.xml'},
			Speed = 0.001,
			Axis  = {
				META = {'Axis', 'Vector3f.xml'},
				x = 1,
				y = 1,
				z = 1
			},
			AlwaysUpdate = true,
			SyncGroup    = -1
		}
	}
}
