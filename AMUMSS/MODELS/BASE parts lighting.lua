--------------------------------------------------------------
local desc = [[
  Increase light intensity to various building parts
  Freighter hangar & landing pad lights changed to near-white
]]------------------------------------------------------------

local function InsertLight(newlight)
	local light = {
		name = 'Light9',
		tx = 0,
		ty = 10,
		tz = 0,
		rx = -22,
		ry = 0,
		rz = 0,
		sx = 1,
		sy = 1,
		sz = 1,
		fov = 100,
		i = 30000,
		f = 'quadratic',
		fr = 2.0,
		r = 0.95,
		g = 0.95,
		b = 0.85,
	}
	for k, v in pairs(newlight) do light[k] = v end
	if newlight.f ~= nil and newlight.fr ~= nil then
		if light.f == 'linear' then light.fr = 1.0 end
	end
	return [[
		<Property value="TkSceneNodeData.xml">
		<Property name="Name" value="]]..light.name..[["/>
		<Property name="NameHash" value="0"/>
		<Property name="Type" value="LIGHT"/>
		<Property name="Transform" value="TkTransformData.xml">
			<Property name="TransX" value="]]..light.tx..[["/>
			<Property name="TransY" value="]]..light.ty..[["/>
			<Property name="TransZ" value="]]..light.tz..[["/>
			<Property name="RotX" value="]]..light.rx..[["/>
			<Property name="RotY" value="]]..light.ry..[["/>
			<Property name="RotZ" value="]]..light.rz..[["/>
			<Property name="ScaleX" value="]]..light.sx..[["/>
			<Property name="ScaleY" value="]]..light.sy..[["/>
			<Property name="ScaleZ" value="]]..light.sz..[["/>
		</Property>
		<Property name="Attributes">
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="FOV"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.fov..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="FALLOFF"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.f..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="FALLOFF_RATE"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.fr..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="INTENSITY"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.i..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="COL_R"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.r..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="COL_G"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.g..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="COL_B"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="]]..light.b..[["/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="COOKIE_IDX"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="-1"/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="VOLUMETRIC"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="0.0"/>
			</Property>
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="MATERIAL"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="MATERIALS/LIGHT.MATERIAL.MBIN"/>
			</Property>
		</Property>
		<Property name="Children"/>
	</Property>]]
end

local File_Path = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/DECORATION/'
local Wall_Light_Mult  = 2
local Stand_Light_Mult = 6

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL base lights tweaks.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= 3.84,
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MOD_DESCRIPTION		= desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		-- |freighter landing pad lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/ACCESSORIES/LANDINGPAD_HANGAR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				REMOVE				= 'SECTION'
			},
			{
				SPECIAL_KEY_WORDS	= {'Name', 'OrangeLights'},
				ADD_OPTION			= 'ADDAfterSection',
				ADD 				=
					InsertLight({name='left', tx=16, ry=90, f='linear'})
					..
					InsertLight({name='right', tx=-16, ry=-90, f='linear'})
					..
					InsertLight({name='ne', i=44000, fov=120, tx=4.8, ty=0.25, tz=4.8, rx=30, ry=45})
					..
					InsertLight({name='nw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=4.8, rx=30, ry=-45})
					..
					InsertLight({name='se', i=44000, fov=120, tx=4.8, ty=0.25, tz=-4.8, rx=30, ry=135})
					..
					InsertLight({name='sw', i=44000, fov=120, tx=-4.8, ty=0.25, tz=-4.8, rx=30, ry=-135})
			}
		}
	},
	{
		-- |freighter hangar lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/COMMONPARTS/HANGARINTERIORPARTS/HANGARINTERIOR.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		36000}
				}
			},
			{
				REPLACE_TYPE		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_R'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.4}
				}
			},
			{
				REPLACE_TYPE		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_G'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.75}
				}
			},
			{
				REPLACE_TYPE		= 'ALL',
				SPECIAL_KEY_WORDS	= {'Name', 'COL_B'},
				VALUE_CHANGE_TABLE	= {
					{'Value',		0.75}
				}
			}
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			File_Path..'STANDINGLIGHT1.SCENE.MBIN',
			File_Path..'STANDINGLIGHT2.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				VALUE_CHANGE_TABLE 	= {
					{'RotX',		-20}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'FOV'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		130}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'FALLOFF'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'linear'}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		Stand_Light_Mult}
				}
			},
		}
	},
	{
		MBIN_FILE_SOURCE	= File_Path..'STANDINGLIGHT3.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'FALLOFF'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		'linear'}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		Stand_Light_Mult}
				}
			},
		}
	},
	{
		MBIN_FILE_SOURCE	= File_Path..'CEILINGLIGHT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		Stand_Light_Mult}
				}
			},
		}
	},
	{
		MBIN_FILE_SOURCE	= {
			File_Path..'WALLLIGHT_BLUE.SCENE.MBIN',
			File_Path..'WALLLIGHT_GREEN.SCENE.MBIN',
			File_Path..'WALLLIGHT_PINK.SCENE.MBIN',
			File_Path..'WALLLIGHT_RED.SCENE.MBIN',
			File_Path..'WALLLIGHT_WHITE.SCENE.MBIN',
			File_Path..'WALLLIGHT_YELLOW.SCENE.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0},
					{'TransY',		0},
					{'TransZ',		0},
					{'RotX',		90}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'FOV'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		190}
				}
			},
			{
				MATH_OPERATION 		= '*',
				SPECIAL_KEY_WORDS	= {'Type', 'LIGHT', 'Name', 'INTENSITY'},
				VALUE_CHANGE_TABLE 	= {
					{'Value',		Wall_Light_Mult}
				}
			}
		}
	},
}}}}
