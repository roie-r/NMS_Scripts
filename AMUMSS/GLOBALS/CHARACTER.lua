--[[┎────────────────────────────────────────────────────────────────
	┃ Disable auto-ladder mount; general tweaks
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC CHARACTER.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCCHARACTERGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	= {
					{'LadderDistanceToAutoMount',			0},	-- 0.4
					{'LadderCooldownAfterBeforeAutoClimb',	0},	-- 0.6
				}
			},
			{
				MATH_OPERATION 		= '+',
				VALUE_CHANGE_TABLE 	= {
					{'TimeNotOnGroundToUseFallingCamera',	64},	-- 0.2
					{'TimeFallingUntilPanic',				128},	-- 0.8
					{'SlopeAngleForUphillClimb',			15},	-- 30
					{'SlopeAngleForDownhillClimb',			15},	-- 30
					{'SlopeAngleForSlide',					10},	-- 45
					{'TrudgeUphillSpeed',					2}		-- 0
				}
			}
		}
	}
}}}}
