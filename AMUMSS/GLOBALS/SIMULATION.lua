--[[┎────────────────────────────────────────────────────────────────
	┃ Change portals tunnels to the warp tunnel
────┸────────────────────────────────────────────────────────────--]]
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC SIMULATION.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.22',
	MOD_BATCHNAME		= '_GLOBALS ~@~collection.pak',
	MOD_DESCRIPTION		= 'U',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCSIMULATIONGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				VALUE_CHANGE_TABLE 	=
				{
					{'TeleportTunnelFile',		'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'},
					{'PortalTunnelFile',		'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'},
					{'PortalStoryTunnelFile',	'MODELS/EFFECTS/WARP/WARPTUNNEL.SCENE.MBIN'}
				}
			}
		}
	}
}}}}
