------------------------------------------------------------
--	Central location for sharing data... remove duplicates!
------------------------------------------------------------

-- 	ship fabricator texture additions
--	names and palette selection ships texture groups
new_ship_texture = {
	{
		name	= 'SHINY',
		sci		= true,		-- shared with scientific
		org		= true,		-- existing original
		palette	= {			-- shared with -and changed by the following
			PRIMARY		= {'Metal', 'Primary'},
			SECONDARY	= {'Paint', 'Alternative1'},
			TERTIARY	= {'Paint', 'Primary'},
		}
	},
	{
		name	= 'DEFAULT',
		sci		= true,
		org		= true,
		palette	= {
			PRIMARY		= {'Undercoat', 'Primary'},
		}
	},
	{
		name	= 'TOPOMAP',
		tip		= 'UI_TIP_SHIP_TOPOMAP',
		metal	= true,
		sci		= true,
		palette	= {
			PRIMARY		= {'Paint', 'Primary'},
			TERTIARY	= {'Undercoat', 'Primary'},
		}
	},
	{
		name	= 'PAINTSWIRL',
		tip		= 'UI_TIP_SHIP_PAINTSWIRL',
		metal	= false,
		sci		= true
	},
	{
		name	= 'MEZO',
		tip		= 'UI_TIP_SHIP_MEZO',
		metal	= false,
		sci		= true
	},
	{
		name	= 'MAYA_SNAKE',
		tip		= 'UI_TIP_SHIP_MAYA_SNAKE',
		metal	= true,
		sci		= true
	},
	{
		name	= 'MAYA_WALL',
		tip		= 'UI_TIP_SHIP_MAYA_WALL',
		metal	= true,
		sci		= true
	},
	{
		name	= 'AZTEC_DRAGON',
		tip		= 'UI_TIP_SHIP_AZTEC_DRAGON',
		metal	= false,
		sci		= true
	},
	{
		name	= 'AZTEC_FACE',
		tip		= 'UI_TIP_SHIP_AZTEC_FACE',
		metal	= false,
		sci		= true
	},
	{
		name	= 'CELTIC',
		tip		= 'UI_TIP_SHIP_CELTIC',
		metal	= true,
		sci		= true
	},
	{
		name	= 'POLYNESIA',
		tip		= 'UI_TIP_SHIP_POLYNESIA',
		metal	= false,
		sci		= true
	},
	{
		name	= 'POLYNESIA_SEA',
		tip		= 'UI_TIP_SHIP_POLYNESIA_SEA',
		metal	= true,
		sci		= true
	},
	{
		name	= 'MAORI_FACE',
		tip		= 'UI_TIP_SHIP_MAORI_FACE',
		metal	= false,
		sci		= true
	},
	{
		name	= 'EASTERN',
		tip		= 'UI_TIP_SHIP_EASTERN',
		metal	= false,
		sci		= true
	},
	{
		name	= 'WOVEN',
		tip		= 'UI_TIP_SHIP_WOVEN',
		metal	= true,
		sci		= true
	},
	{
		name	= 'WOVEN2',
		tip		= 'UI_TIP_SHIP_WOVEN2',
		metal	= true,
		sci		= true
	},
	{
		name	= 'DEMON',
		tip		= 'UI_TIP_SHIP_DEMON',
		metal	= false,
		sci		= true
	},
	{
		name	= 'TARGET',
		tip		= 'UI_TIP_SHIP_TARGET',
		metal	= false,
		sci		= true
	},
	{
		name	= 'SKULLS',
		tip		= 'UI_TIP_SHIP_SKULLS',
		metal	= true,
		sci		= true
	},
	{
		name	= 'THE_HARING',
		tip		= 'UI_TIP_SHIP_THE_HARING',
		metal	= true,
		sci		= true
	}
}
