----------------------------------------------------------------
local mod_desc = [[
  Restore the scanned fauna icon to the white circle

  * DDS files import is skipped SILENTLY if file paths are not found!
]]--------------------------------------------------------------

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.scanned fauna icon replace',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MOD_DESCRIPTION		= mod_desc,		
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/UI/HUD/SCANNERICONS.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS = 'CreatureDiscovered',
				VALUE_CHANGE_TABLE 	= {
					{'Filename', 'TEXTURES/UI/HUD/CREATURE.GREEN2.DDS'}
				}
			}
		}
	}
}}},
	ADD_FILES	= (
		function()
			local tex_path = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures_mod_source/textures/ui/hud/icons/CREATURE.GREEN2.dds'
			if lfs.attributes(tex_path) then
				return {{
					EXTERNAL_FILE_SOURCE = tex_path,
					FILE_DESTINATION	 = 'TEXTURES/UI/HUD/CREATURE.GREEN2.DDS'
				}}
			end
			return nil
		end
	)()
}
