------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
dofile('LIB/scene_tools.lua')
------------------------------------------------------------------
mod_desc = [[
  - sailship changes:
   re-align trails & decals
   add missing trails
   replace triangle with logo decals
   replace yellow lights with procedural lights to match the sail
   remove wing edge blinkers (requires texture replacements)
]]----------------------------------------------------------------

local function SailshipTweaks(T)
	local tweaks = {
		-- Name					rX		rY		rZ		tX		tZ		sX		sY
		{k='decals_Decal17',	180,	21,		180,	0.09},							-- Wings_A R
		{k='decals_Decal18',	0,		2,		-2.777,	0.1},							-- Wings_A L
		{k='decals_Decal16',	225,	180,	35.26},									-- Wings_B R
		{k='decals_Decal14',	270,	180,	9.13},									-- Wings_C R
		{k='decals_Decal7',		180,	180},											-- Wings_D R
		{k='decals_Decal9',		180,	180},											-- Wings_E R
		{k='decals_Decal11',	190,	0,		0,		0.45,	0,		-0.1,	-0.1},	-- Wings_F R
		{k='decals_Decal12',	0,		0,		0,		-0.4,	0,		-0.1,	-0.1},	-- Wings_F L
		{k='decals_Decal5'},															-- body_D
		{k='decals_Decal8'},
		{k='SpinningpartBack1',	0,		0,		0,		0,		-0.16},					-- body_A engine
		{k='largeflame',		0,		0,		0,		0,		0.5},					-- body_A flame1
		{k='smallflame',		0,		0,		0,		0,		0.52},					-- body_A flame2
		{k='SpinningpartSpike',	0,		0,		0,		0,		0.37},					-- body_F spike
		{k='Trail105L3',		0,		2.276},											-- body_A
		{k='Trail105L1',		0,		1.16},											-- wings_E R
		{k='Trail105L2',		0,		3.478},											-- wings_E L
		{k='Trail105L4',		0,		3.478},											-- wings_D R
		{k='Trail105L5',		0,		1.16},											-- wings_D L
	}
	for _,x in ipairs(tweaks) do
		i = #T + 1
		T[i] = { SPECIAL_KEY_WORDS = {'Name', x.k} }
		if x[1] then
			T[i].MATH_OPERATION	 = '+'
			T[i].VALUE_CHANGE_TABLE = {
				{'RotX',	x[1]},
				{'RotY',	x[2]},
				{'RotZ',	x[3] or 0},
				{'TransX',	x[4] or 0},
				{'TransZ',	x[5] or 0},
				{'ScaleX',	x[6] or 0},
				{'ScaleY',	x[7] or 0},
			}
		else
			T[i].REMOVE = 'Section'
		end
	end
end

local function SailshipTrails(T)
	local trails = {
		{k='AWingsL_JNT',	n='TrailAL',	3.558,		1.71777,	-5.0282,	0,	180},
		{k='AWingsR_JNT',	n='TrailAR',	-1.874,		1.71777,	-9.7578,	0,	180},
		{k='BWingsL_JNT',	n='TrailBL',	3.7583,		1.71777,	-5.0278,	0,	180},
		{k='BWingsR_JNT',	n='TrailBR',	-3.5392,	1.71777,	-5.0278,	0,	180},
		{k='CWingsL_JNT',	n='TrailCL',	3.5532,		1.71777,	-5.0281,	0,	180},
		{k='CWingsR_JNT',	n='TrailCR',	-3.5392,	1.71777,	-5.0278,	0,	180},
		{k='FWingsL_JNT',	n='TrailFL',	3.71809,	1.71777,	-5.0278,	0,	180},
		{k='FWingsR_JNT',	n='TrailFR',	-3.5392,	1.71777,	-5.0278,	0,	180}
	}
	for _,node in ipairs(trails) do
		T[#T+1] = {
			SPECIAL_KEY_WORDS	= {'Name', node.k},
			PRECEDING_KEY_WORDS	= 'Children',
			ADD					= ToExml( ScNode(node.n, 'LOCATOR', {ScTransform(node)}) )
		}
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__SHIP sailship.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.45',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|sailship re-alignments|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				local T = {}
				SailshipTweaks(T)
				SailshipTrails(T)
				
				-- body_E remove 2 trail
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {
						{'Name', 'Trail1013'},
						{'Name', 'Trail21013'},
					},
					REMOVE			 	= 'Section'
				}		
				-- body_F fix spike texture
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {'Name', 'SpinningpartSpike', 'Name', 'MATERIAL'},
					VALUE_CHANGE_TABLE 	= {
						{'Value', 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/METALMATERIAL_TRIMS.MATERIAL.MBIN'}
					}
				}		
				return T
			end
		)()
	},
	{--	|sailship logo decals|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/DECALS_NUMBERDECAL1.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/DECALS/LOGO/LOGO.DDS'}
				}
			}
		}
	},
	{--	sailship |sail proc lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/HQLIGHT_MAT11.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SAILS/RECTLIGHTPROC.BASE.DDS'}
				}
			}
		}
	},
	{--	|blinkers removal|
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/BLUELIGHTFLARE.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/SAILSHIP_BLUELIGHT.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/BODIES_LIGHTFLASH_MAT.MATERIAL.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Samplers',
				REMOVE				= 'Section'
			}
		}
	},
	{--	|sailship restore blue| lights
		MBIN_FILE_SOURCE	= {
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPAIRVENT/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPANIMS/SAILSHIP_SHARED/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPBODY_B/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPBODY_C/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPBODY_D/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN',
			'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIPPARTS/SAILSHIPBODY_E/KITBASH_SHIP_LIGHTS1.MATERIAL.MBIN'
		},
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'CastShadow', false},
					{'Shader', 'SHADERS/UBERSHADER.SHADER.BIN'},
					{'ShaderMillDataHash', 0}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'MaterialFlag', '_F38_NO_DEFORM'},
				VALUE_CHANGE_TABLE 	= {
					{'MaterialFlag', '_F10_NORECEIVESHADOW'}
				}
			}
		}
	}
}}}}
