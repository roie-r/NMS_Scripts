-----------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
-----------------------------------------------------------------
local mod_desc = [[
  use the mouse wheel for switching multitool tech & zoom stages
  scan with mouse3 button
]]---------------------------------------------------------------

local key_map = {
	FRONTEND = {
		Fe_Alt1					= { btn='Space'	}, -- inventory activate : install tech & craft +1
		Fe_Destroy				= { btn='F3'	},
		UI_StackSplitDown		= { btn='Key1'	},
		UI_StackSplitUp			= { btn='Key3'	},
		BaseBuilding_SwitchBase	= { btn='LShift',	all=true }
	},
	OnFootControls = {
		Player_ChangeWeapon		= { btn='Key2'	},
		Player_Grenade	 		= { btn='PageDown',	add=true },
		Terrain_SizeUp			= { btn='F1'	},
		Terrain_SizeDown		= { btn='F2'	},
		Player_Deconstruct		= { btn='F3'	},
		Player_Torch	 		= { btn='PageUp'},
		Player_Binoculars 		= { btn='End'	},
		Binocs_PrevMode			= { btn='F1'	},
		Binocs_NextMode			= { btn='F2'	}
	},
	ShipControls = {
		Ship_ChangeWeapon		= { btn='Key2'	},
		Ship_Land				= { btn='KeyR'	},
		Ship_Exit				= { btn='KeyR'	},
		Ship_FreeLook			= { del=true	},
		Ship_CyclePower			= { btn='LAlt'	}
	},
	VehicleMode = {
		Vehicle_ChangeWeapon	= { btn='Key2'	},
		Player_Binoculars 		= { btn='End'	},
		Vehicle_Dive			= { btn='LAlt'	},
		Vehicle_Horn			= { btn='LCtrl'	},
		Vehicle_Exit			= { btn='KeyR'	}
	},
	PhotoModeMvCam = {
		Photo_Cam				= { btn='Enter',	all=true },
		Photo_CamUp				= { btn='Space'	},
		Photo_CamDown			= { btn='LCtrl',	all=true }
	}
}

local mouse_map = {
	OnFootControls = {
		Player_Zoom	 			= { btn='MouseWheelDown',	add=true},
		Player_ChangeWeapon		= { btn='MouseWheelDown',	add=true},
		Player_Scan	 			= { btn='Mouse3',			add=true},
		Player_Torch	 		= { btn='Mouse6',			add=true},
		Player_Grenade	 		= { btn='Mouse4' },
		Player_ChangeAltWeapon	= { del=true }
	},
	ShipControls = {
		Ship_FreeLook			= { btn='Mouse2',			add=true},
		Ship_ChangeWeapon		= { btn='MouseWheelDown',	add=true},
		Ship_Scan				= { btn='Mouse3',			add=true},
		ShipZoom				= { del=true },
		Ship_ClosestTarget		= { del=true }
	},
	VehicleMode = {
		Vehicle_ChangeWeapon	= { btn='MouseWheelDown',	add=true},
		Vehicle_Scan			= { btn='Mouse3',			add=true}
	}
}

local function AddBindings(action, button, axis)
	return {
		meta	= {name='InputBindings', value='GcInputBinding'},
		Action	= {
			meta		= {name='Action', value='GcInputActions'},
			InputAction	= action
		},
		Button	= {
			meta		= {name='Button', value='TkInputEnum'},
			InputButton	= button
		},
		Axis	= {
			meta		= {name='Axis', value='TkInputAxisEnum'},
			InputAxis	= axis or 'None'
		}
	}
end

local function MxChangeTable(tbl)
	local mx_ct = {}
	for set, binds in pairs(tbl) do
		for act, prp in pairs(binds) do
			if prp.add then
				mx_ct[#mx_ct+1] = {
					SPECIAL_KEY_WORDS	= {'ActionSetType', set},
					SECTION_UP_SPECIAL	= 1,
					PRECEDING_KEY_WORDS = 'InputBindings',
					ADD 				= ToMxml( AddBindings(act, prp.btn) )
				}
			elseif not prp.del then
				mx_ct[#mx_ct+1] = {
					REPLACE_TYPE 		= prp.all and 'All' or nil,
					SPECIAL_KEY_WORDS	= {'InputAction', act},
					SECTION_UP			= 1,
					SECTION_ACTIVE		= prp.sec or nil,
					VALUE_CHANGE_TABLE 	= {
						{'InputButton', prp.btn}
					}
				}
			else
				mx_ct[#mx_ct+1] = {
					SPECIAL_KEY_WORDS	= {'InputAction', act},
					SECTION_UP			= 1,
					REMOVE				= 'Section'
				}
			end
		end
	end
	return mx_ct
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ META key binds',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{--	|mouse input binds|
		MBIN_FILE_SOURCE	= 'METADATA/INPUT/BINDINGS/GCINPUTBINDINGS_WIN_MOUSE.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= MxChangeTable(mouse_map)
	},
	{--	|keyboard input binds|
		MBIN_FILE_SOURCE	= 'METADATA/INPUT/BINDINGS/GCINPUTBINDINGS_WIN_KEYBOARD.MBIN',
		EXML_CREATE			= false,
		MXML_CHANGE_TABLE	= MxChangeTable(key_map)
	}
}}}}

--[[---InputButtonEnum---
	None
	Space
	Exclamation
	Quotes
	Hash
	Dollar
	Percent
	Ampersand
	Apostrophe
	LeftBracket
	RightBracket
	Asterisk
	Plus
	Comma
	Hyphen
	Period
	Slash
	Key0
	Key1
	Key2
	Key3
	Key4
	Key5
	Key6
	Key7
	Key8
	Key9
	Colon
	Semicolon
	LessThan
	Equals
	GreaterThan
	QuestionMark
	At
	KeyA
	KeyB
	KeyC
	KeyD
	KeyE
	KeyF
	KeyG
	KeyH
	KeyI
	KeyJ
	KeyK
	KeyL
	KeyM
	KeyN
	KeyO
	KeyP
	KeyQ
	KeyR
	KeyS
	KeyT
	KeyU
	KeyV
	KeyW
	KeyX
	KeyY
	KeyZ
	LeftSquare
	BackSlash
	RightSquare
	Caret
	Underscode
	Grave
	LeftCurly
	Bar
	RightCurly
	Tilde
	Special2
	Escape
	Enter
	Backspace
	Insert
	Delete
	CapsLock
	Home
	End
	PageUp
	PageDown
	F1
	F2
	F3
	F4
	F5
	F6
	F7
	F8
	F9
	F10
	F11
	F12
	Tab
	Shift
	LShift
	RShift
	Alt
	LAlt
	RAlt
	Ctrl
	LCtrl
	RCtrl
	LOption
	ROption
	Up
	Down
	Left
	Right
	KeyboardUnbound
	Mouse1
	Mouse2
	Mouse3
	Mouse4
	Mouse5
	Mouse6
	Mouse7
	Mouse8
	MouseWheelUp
	MouseWheelDown
	MouseUnbound
	TouchscreenPress
	TouchscreenTwoFingerPress
	TouchscreenThreeFingerPress
	TouchscreenFourFingerPress
	TouchscreenSwipeLeft
	TouchscreenSwipeRight
	TouchscreenSwipeUp
	TouchscreenSwipeDown
	PadA
	PadB
	PadC
	PadD
	PadStart
	PadSelect
	PadLeftShoulder1
	PadRightShoulder1
	PadLeftShoulder2
	PadRightShoulder2
	PadLeftTrigger
	PadRightTrigger
	PadLeftThumb
	PadRightThumb
	PadUp
	PadDown
	PadLeft
	PadRight
	LeftHandA
	LeftHandB
	LeftHandC
	LeftHandD
	ChordBothShoulders
	PadLeftTriggerSpecial
	PadRightTriggerSpecial
	PadSpecial0
	PadSpecial1
	PadSpecial2
	PadSpecial3
	PadSpecial4
	PadSpecial5
	PadSpecial6
	PadSpecial7
	PadSpecial8
	PadSpecial9
	PadSpecial10
	PadSpecial11
	PadSpecial12
	PadSpecial13
	PadSpecial14
	PadSpecial15
	PadSpecial16
	PadSpecial17
	PadSpecial18
	PadSpecial19
	PadUnbound
	Gesture
	GestureLeftWrist
	GestureRightWrist
	GestureBinoculars
	GestureBackpack
	GestureExitVehicle
	GestureThrottle
	GestureFlightStick
	GestureTeleport
	GestureLeftWrist_LeftHanded
	GestureRightWrist_LeftHanded
	GestureBinoculars_LeftHanded
	GestureBackpack_LeftHanded
	MaxEnumValue
]]

-- local function AddBindings(action, button, axis)
	-- return (
		-- [[<Property name="InputBindings" value="GcInputBinding">
			-- <Property name="Action" value="GcInputActions">
				-- <Property name="InputAction" value="%s" />
			-- </Property>
			-- <Property name="Button" value="TkInputEnum">
				-- <Property name="InputButton" value="%s" />
			-- </Property>
			-- <Property name="Axis" value="TkInputAxisEnum">
				-- <Property name="InputAxis" value="%s" />
			-- </Property>
		-- </Property>]]
	-- ):format(action, button, axis or 'None')
-- end
