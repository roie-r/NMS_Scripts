----------------------------------------------------
local mod_desc = [[
  remove non-grouped small asteroids
  larger clean space around planets & stations
  small chance of living ships in the wild
]]--------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ GC solar',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCSOLARGENERATIONGLOBALS.GLOBAL.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'Planet Invalid Asteroid Zone',			12000},	-- 10000
					{'Sparse Asteroid Spread',					-800},	-- -7
					{'Asteroid Space Station Avoid Radius',		6600},	-- 5000
					{'AsteroidCreatureRichSystemProbability',	0.008}	-- 0.005
				}
			},
			{
				PRECEDING_KEY_WORDS = 'PirateSystemProbability',
				VALUE_CHANGE_TABLE 	= {
					{'Yellow',		0.1},		-- 0.25
					{'Green',		0.08},		-- 0.15
					{'Blue',		0.08},		-- 0.15
					{'Red',			0.6},		-- 0.5
					{'Purple',		0.06},		-- 0.05
				}
			},
			{
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'Common Asteroid Data',
				VALUE_CHANGE_TABLE	= {
					{'Health',		2000},		-- 1000
					{'Spacing',		'@*1.4'},	-- 645
				}
			},
			{
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'Large Asteroid Data',
				VALUE_CHANGE_TABLE	= {
					{'Health',		1200},		-- 400
					{'Spacing',		'@*2'},		-- 9000
					{'Fade Range',	8100}		-- 9000
				}
			},
			{
				INTEGER_TO_FLOAT	= 'Preserve',
				PRECEDING_KEY_WORDS = 'Rare Asteroid Data',
				VALUE_CHANGE_TABLE	= {
					{'Health',		1800},		-- 1400
					{'Spacing',		'@*4'},		-- 850
					{'Fade Range',	8100},		-- 9000
					{'Noise Scale',	'@*2.1'},	-- 50000
				}
			},
			{
				REPLACE_TYPE 		= 'All',
				PRECEDING_KEY_WORDS = 'CivilianClassWeightings',
				VALUE_CHANGE_TABLE	= {
					{'Royal',		3},
					{'Sail',		5},
					{'Alien',		2},
					{'Robot',		3}
				}
			}
		}
	}
}}}}
