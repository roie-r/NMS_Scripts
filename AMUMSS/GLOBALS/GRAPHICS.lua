--[[┎────────────────────────────────────────────────────────────────
	┃ graphics tweaks
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC GRAPHICS.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.38',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCGRAPHICSGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				MATH_OPERATION 		= '+',
				INTEGER_TO_FLOAT	= 'FORCE',
				VALUE_CHANGE_TABLE 	= {
					{'SunLightIntensity',		1},
					{'HBAOIntensity',			-1},
					{'LightShaftScattering',	-0.15},
					{'LightShaftBottom',		0.025},
					{'LightShaftTop',			0.08},
					{'GrassValueMin',			-0.1},
					{'GrassValueMax',			0.1},

					-- {'ShadowLength',			800},
					-- {'ShadowLengthShip',		2400},
					-- {'ShadowLengthSpace',		40000},
					-- {'ShadowLengthStation',		2600},
					-- {'ShadowLengthCameraView',	2600},

					-- {'TerrainDroppedMipsMed',	-1},	-- 1
					-- {'TerrainMipBiasMed',		-0.5},	-- 0.5
					-- {'TerrainBlocksPerFrameMed',8}		-- 24
				}
			},
			-- {
				-- VALUE_CHANGE_TABLE 	= {
					-- {'ForceUncachedTerrain',	true}
				-- }
			-- }
		}
	}
}}}}
