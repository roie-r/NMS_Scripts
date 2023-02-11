-----------------------------------------------------------------
mod_desc = [[
  Sailship re-alignments:
   Engine trails for body_A, _wings_D & wings_E
   Decal tweaks (noticeable mainly when using my logo decals mod)
   Restore procedural sail lights who match the sail's color
   body_F (grouper) engine spike texture and placement fixed
   body_A (Raven) engine spike and flame placement fixed
]]---------------------------------------------------------------

local sailship_edits = {
	-- Name					rX		rY		rZ		tX		tZ		sX		sY
	{'decals_Decal17',		180,	21,		180,	0.09},							-- Wings_A R
	{'decals_Decal18',		0,		2,		-2.777,	0.1},							-- Wings_A L
	{'decals_Decal16',		225,	180,	35.26},									-- Wings_B R
	{'decals_Decal14',		270,	180,	9.13},									-- Wings_C R
	{'decals_Decal7',		180,	180},											-- Wings_D R
	{'decals_Decal9',		180,	180},											-- Wings_E R
	{'decals_Decal11',		190,	0,		0,		0.45,	0,		-0.1,	-0.1},	-- Wings_F R
	{'decals_Decal12',		0,		0,		0,		-0.4,	0,		-0.1,	-0.1},	-- Wings_F L
	{'decals_Decal5'},																-- body_D
	{'decals_Decal8'},
	{'SpinningpartBack1',	0,		0,		0,		0,		-0.16},					-- body_A engine
	{'largeflame',			0,		0,		0,		0,		0.5},					-- body_A flame1
	{'smallflame',			0,		0,		0,		0,		0.52},					-- body_A flame2
	{'SpinningpartSpike',	0,		0,		0,		0,		0.37},					-- body_F spike
	{'Trail105L3',			0,		2.276},											-- body_A
	{'Trail105L1',			0,		1.16},											-- wings_E R
	{'Trail105L2',			0,		3.478},											-- wings_E L
	{'Trail105L4',			0,		3.478},											-- wings_D R
	{'Trail105L5',			0,		1.16},											-- wings_D L
}
function sailship_edits:Get(x)
	local T = {}
	T.SPECIAL_KEY_WORDS = {'Name', x[1]}
	if x[2] then
		T.MATH_OPERATION	 = '+'
		T.VALUE_CHANGE_TABLE = {
			{'RotX',	x[2]},
			{'RotY',	x[3]},
			{'RotZ',	x[4] or 0},
			{'TransX',	x[5] or 0},
			{'TransZ',	x[6] or 0},
			{'ScaleX',	x[7] or 0},
			{'ScaleY',	x[8] or 0},
		}
	else
		T.REMOVE = 'Section'
	end
	return T
end

local function BuildExmlChangeTable(tbl)
	local T = {}
	for _,v in ipairs(tbl) do
		table.insert(T, tbl:Get(v))
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.sailship re-alignments.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.08',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		EXML_CHANGE_TABLE	= BuildExmlChangeTable(sailship_edits)
	},
	{
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'Name', 'SpinningpartSpike', 'Name', 'MATERIAL'},
				VALUE_CHANGE_TABLE 	= {
					{'Value', 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/METALMATERIAL_TRIMS.MATERIAL.MBIN'}
				}
			},
		}
	},
	{
		-- sailship |sail proc lights|
		MBIN_FILE_SOURCE	= 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC/HQLIGHT_MAT11.MATERIAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Map', 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SAILS/RECTLIGHTPROC.BASE.DDS'}
				}
			}
		}
	}
}}}}
