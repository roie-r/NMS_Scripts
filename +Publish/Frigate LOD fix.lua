--------------------------------------------------------------------------------
local mod_desc = [[
  Replace frigates 5th level lod with the 4th.
  Avoids using the 5th lod model when the freighter in in orbit above a planet.
]]------------------------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.Frigate LOD Fix.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/COMBATFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/COMBATFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/DIPLOMATICFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/DIPLOMATICFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/INDUSTRIALFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/INDUSTRIALFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SCIENCEFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SCIENCEFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SUPPORTFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/SUPPORTFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATELOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATELOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATE_PROC_LOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/FRIGATES/LIVINGFRIGATE_PROC_LOD4.SCENE.MBIN',
				'REMOVE'
			},
			{
				'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/PIRATECRUISERLOD3.SCENE.MBIN',
				'MODELS/COMMON/SPACECRAFT/INDUSTRIAL/PIRATECRUISERLOD4.SCENE.MBIN',
				'REMOVE'
			}
		}
	},
}}}}
