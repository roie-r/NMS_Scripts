-------------------------------------------------------------------------
mod_desc = [[
  - slower wings folding anim
  - move the bobble in the sentinel cockpit to a less intrusive location
  - remove red glow in cockpit from selected sections
  - wingB blue glow
  - remove shiny head and 3cross head pieces (replaced with others)
  - remove non-used engine exaust (3, 4, 6)
]]-----------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 			= '__SHIP sentinel.pak',
	MOD_AUTHOR				= 'lMonk',
	NMS_VERSION				= '4.23',
	MOD_DESCRIPTION			= mod_desc,
	GLOBAL_INTEGER_TO_FLOAT = 'Force',
	MODIFICATIONS 			= {{
	MBIN_CHANGE_TABLE		= {
	{
		--	|sentinel slow wing anim|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/ENTITIES/ROOTJNT.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENGINEFLAMEBODY1/ENTITIES/DATA.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/ENGINEFLAMEL/ENTITIES/DATA.ENTITY.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB/ENTITIES/ROOTJNT.ENTITY.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_FIRST		= true,
				PRECEDING_KEY_WORDS = 'TkAnimationComponentData.xml',
				SPECIAL_KEY_WORDS	= {
					{'Anim', 'LANDING'},
					{'Anim', 'TAKEOFF'}
				},
				VALUE_CHANGE_TABLE 	= {
					{'Speed',		0.624}
				}
			}
		}
	},
	{
		--	|sentinel cockpit|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELCOCKPIT.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
			--	move the bobble in the sentinel cockpit to a less intrusive location
				SPECIAL_KEY_WORDS	= {'Name', 'BobbleHeadLocator'},
				VALUE_CHANGE_TABLE 	= {
					{'TransX',		0.36},		-- -0.174405
					{'TransY',		-0.338},	-- -0.330305
					{'TransZ',		1.1419},	-- 1.159586
					{'RotY',		32.3536},	-- -32.353622
					{'ScaleX',		0.8},		-- 1
					{'ScaleY',		0.8},		-- 1
					{'ScaleZ',		0.8},		-- 1
				}
			},
			{
				SPECIAL_KEY_WORDS 	= {
					{'Name', 'lightrim'},			-- high sidewall scroll glow
					{'Name', 'WireLightsL'},		-- sidewires scrolling glow
					{'Name', 'WireLightsR'},
					{'Name', 'polySurface8398'},	-- canopy lights
					{'Name', 'Lightbase'},		 	-- map base center
					{'Name', 'MonitorL1'},			-- monitors glow
					{'Name', 'MonitorL2'},
					{'Name', 'SentinelCableL'},		-- thick cables
					{'Name', 'SentinelCableR'},
					{'Name', 'CableSpinnerL'},		-- thick cable spinner
					{'Name', 'CableSpinnerR'}
				},
				REMOVE = 'Section'
			},
		}
	},
	{
	--	|sentinel wingB blue glow|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC/REDGLOW_MAT2.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/PARTS/WINGSB/REDGLOW_MAT2.MATERIAL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'gMaterialColourVec4'},
				VALUE_CHANGE_TABLE 	= {
					{'x',			0.4},
					{'y',			0.66},
					{'z',			0.8}
				}
			}
		}
	},
	{
	--	|sentinel cockpit eject handle glow|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/EJECTHANDLEL/EJECTVFX3MAT.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{
	--	|sentinel descriptor| remove shiny head and 3cross and non-used engines
	--	Each 2nd suffix replaces its preceding one
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.DESCRIPTOR.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				T = {}
				for id, sfx in pairs({
					_Lights_		= { 'C', 'E', 'J', 'D', 'C1', 'D1'},
					_EngineFlame_	= {'3', '1', '3b', '1b', '4', '2', '4b', '2b', '6', '5', '6b', '5b'}
				}) do
					for i=1, #sfx, 2 do
						T[#T+1] = {
							SPECIAL_KEY_WORDS	= {'Id', (id..sfx[i]):upper()},
							VALUE_CHANGE_TABLE 	= {
								{'Id',			(id..sfx[i+1]):upper()},
								{'Name',		id..sfx[i+1]}
							}
						}
					end
				end
				return T
			end
		)()
	}
}}}}
