---------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  use the mouse wheel for switching multitool tech & zoom stages
  scan with mouse3 button
]]---------------------------------------------------------------

local function AddBindings(action, button, axis)
	return {
		META	= {'value', 'GcInputBinding.xml'},
		Action	= {
			META		= {'Action', 'GcInputActions.xml'},
			InputAction	= action
		},
		Button	= {
			META		= {'Button', 'TkInputEnum.xml'},
			InputButton	= button
		},
		Axis	= {
			META		= {'Axis', 'TkInputAxisEnum.xml'},
			InputAxis	= axis or 'Invalid'
		}
	}
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__META key binds.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.23',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
	--	|mouse input binds|
		MBIN_FILE_SOURCE	= 'METADATA/INPUT/BINDINGS/GCINPUTBINDINGS_WIN_MOUSE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'InputAction', 'Player_Zoom'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'InputButton',	'None'},
					{'InputAxis',	'MouseWheel'}
				}
			},
			{
				SPECIAL_KEY_WORDS	= {'ActionSetType', 'OnFootControls'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS = 'InputBindings',
				ADD 				= ToExml({
					AddBindings('Player_ChangeWeapon',	'None',		'MouseWheel'),
					AddBindings('Player_Scan',			'Mouse3'),
					AddBindings('Player_Binoculars',	'Mouse5'),
					AddBindings('Player_Torch',			'Mouse6')
				})
			},
			{
				SPECIAL_KEY_WORDS	= {'ActionSetType', 'VehicleMode'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS = 'InputBindings',
				ADD 				= ToExml({
					AddBindings('Vehicle_ChangeWeapon',	'None',		'MouseWheel'),
					AddBindings('Vehicle_Scan',			'Mouse3')
				})
			},
			{
				SPECIAL_KEY_WORDS	= {'ActionSetType', 'ShipControls'},
				SECTION_UP_SPECIAL	= 1,
				PRECEDING_KEY_WORDS = 'InputBindings',
				ADD 				= ToExml({
					AddBindings('Ship_ChangeWeapon',	'None',		'MouseWheel'),
					AddBindings('Ship_Scan',			'Mouse3')
				})
			}
		}
	},
	{
	--	|keyboard input binds|
		MBIN_FILE_SOURCE	= 'METADATA/INPUT/BINDINGS/GCINPUTBINDINGS_WIN_KEYBOARD.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'InputAction', 'Vehicle_Exit'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
				-- doesn't work for the mech because of a hardcoded bug
					{'InputButton',	'KeyR'}
				}
			},
			{
			--	replace inventory KeyE with space : install tech & craft +1
				SPECIAL_KEY_WORDS	= {'InputAction', 'Fe_Alt1'},
				SECTION_UP			= 1,
				VALUE_CHANGE_TABLE 	= {
					{'InputButton',	'Space'}
				}
			},
			-- {
				-- SPECIAL_KEY_WORDS	= {'ActionSetType', 'OnFootControls'},
				-- SECTION_UP_SPECIAL	= 1,
				-- PRECEDING_KEY_WORDS = 'InputBindings',
				-- ADD 				= ToExml(AddBindings('Player_Zoom', 'Key2'))
			-- }
		}
	}
}}}}