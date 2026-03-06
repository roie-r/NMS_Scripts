---------------------------------------------------------------------
dofile('LIB/_lua_2_mxml.lua')
---------------------------------------------------------------------
local mod_desc = [[
  Generate proc texture files & include the relevant dds files
]]--------------------------------------------------------------

local GU_ = {--	TextureGameplayUse Enum
	IGR = 'IgnoreName', -- default
	MTC = 'MatchName',
	NOT = 'DoNotMatchName'
}

local proc_texture_files = {
	{--	skiff screen
		label	= 'HOLOGRAMSCROLLS',
		path	= 'TEXTURES/PLANETS/BIOMES/COMMON/BUILDINGS/SHARED/BUILDABLEBUILDINGS/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative1',
				dds		= 0	-- 0 = layer name is omited
			}
		}
	},
	{--	floating crystal
		label	= 'AIRCRYSTAL',
		path	= 'TEXTURES/PLANETS/BIOMES/COMMON/RARERESOURCE/INAIR/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Crystal',
				color	= 'Primary',
				dds		= 1
			}
		}
	},
	{--	bioship engine flare line
		label	= 'PULSELINES',
		path	= 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		layers	= {
			{
				name	= 'BASEP',
				palette = 'Paint',
				color	= 'Primary',
				texture	= {'1'},
				dds		= 1
			}
		}
	},
	{--	bioship engine flare
		label	= 'PULSELINEENGINE',
		path	= 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		layers	= {
			{
				name	= 'BASE5',
				palette = 'Paint',
				color	= 'Alternative1',
				dds		= 1
			}
		}
	},
	{--	ship interior: plastic / sentinel rifle
		label	= 'PLASTICGRAIN',
		path	= 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 1
			}
		}
	},
	{--	ship interior: plastic alt 1 (not needed)
		active	= false,
		label	= 'PLASTICGRAINALT1',
		path	= 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative1',
				dds		= 1
			}
		}
	},
	{--	ship interior: plastic alt 2 (not needed)
		active	= false,
		label	= 'PLASTICGRAINALT2',
		path	= 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				dds		= 1
			}
		}
	},
	{--	ship decals : logo
		edit	= 'mxml',
		label	= 'LOGO',
		group	= 'DECALLOGO',
		path	= 'TEXTURES/COMMON/DECALS/LOGO/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'L15', 'L14', 'L13', 'L12', 'L11', 'L10', 'L9', 'L8', 'L7', 'L6', 'L5', 'L4', 'L3', 'L2', 'L1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : rectangle
		label	= 'RECTANGLE',
		group	= 'DECALRECTANGLE',
		path	= 'TEXTURES/COMMON/DECALS/RECTANGLE/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'R15', 'R14', 'R13', 'R12', 'R11', 'R10', 'R9', 'R8', 'R7', 'R6', 'R5', 'R4', 'R3', 'R2', 'R1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : smallsign
		label	= 'SMALLSIGN',
		group	= 'DECALSMALLSIGN',
		path	= 'TEXTURES/COMMON/DECALS/SMALLSIGN/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative3',
				texture	= {'S6', 'S5', 'S4', 'S3', 'S2', 'S1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : number
		label	= 'NUMBER',
		group	= 'DECALNUMBER',
		path	= 'TEXTURES/COMMON/DECALS/NUMBER/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative1',
				texture	= {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
				dds		= 1
			}
		}
	},
	{--	ship decals : lettering
		label	= 'LETTERING',
		group	= 'DECALLET',
		path	= 'TEXTURES/COMMON/DECALS/LETTERING/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'LT1', 'LT2', 'LT3', 'LT4', 'LT5', 'LT6', 'LT7', 'LT8', 'LT9'},
				dds		= 1
			}
		}
	},
	{--	space station front lettering
		label	= 'LETTERING',
		path	= 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		layers	= {
			{
				name	= 'BASE',
				texture	= {'ST1', 'ST2', 'ST3', 'ST4', 'ST5', 'ST6', 'ST7'},
				dds		= 1
			}
		}
	},
	{--	space station front number
		label	= 'NUMBER',
		path	= 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		layers	= {
			{
				name	= 'BASE',
				texture	= {'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
				dds		= 1
			}
		}
	},
	{--	multitool colored strap
		label	= 'STRAP',
		path	= 'TEXTURES/COMMON/WEAPONS/MULTITOOL/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				dds		= 1
			}
		}
	},
	{--	multitool glow parts
		label	= 'MULTITOOLGLOW',
		path	= 'TEXTURES/COMMON/WEAPONS/MULTITOOL/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Crystal',
				color	= 'Primary',
				dds		= 1
			}
		}
	},
	{--	royal ship
		label	= 'ROYALSCLASS_TRIM',
		path	= 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		layers	= {
			{
				name	= 'OVERLAYMETAL',
				texture	= {{n='SILVER', pr=0.7}, {n='GOLD', pr=0.3}},
				dds		= 1
			},
			{
				name	= 'BASE',
				palette = 'SpaceBottom',
				color	= 'Primary',
				dds		= 1
			}
		}
	},
	{--	mech hardframe
		label	= 'SENTINELTRIM',
		path	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'OVERLAY',
				dds		= 1
			},
			{
				name	= 'PRIMARY',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 1
			},
			{
				name	= 'SECONDARY',
				palette = 'Paint',
				color	= 'Alternative1',
				dds		= 1
			},
			{
				name	= 'TERTIARY',
				palette = 'Paint',
				color	= 'Alternative2',
				dds		= 1
			},
			{
				name	= 'BASE',
				dds		= 1
			}
		}
	},
	{--	mech liquidator
		label	= 'ARMYMECH',
		path	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'TERTIARY',
				palette = 'Paint',
				color	= 'Alternative2',
				dds		= 1,
			},
			{
				name	= 'SECONDARY',
				palette = 'Paint',
				color	= 'Alternative1',
				dds		= 1,
			},
			{
				name	= 'PRIMARY',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 1,
			},
			{
				name	= 'BASE',
				dds		= 1
			}
		}
	},
	{--	mech liquidator trim
		label	= 'ARMYTRIM',
		path	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'OVERLAY',
				palette = 'Paint',
				color	= 'Alternative2',
				dds		= 1,
			},
			{
				name	= 'BASE',
				dds		= 1
			}
		}
	},
	{--	sentinel ship
		active	= false,
		label	= 'SENTINELPROC',
		path	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'FIXED',
				texture	= {'1', '2'},
				dds		= 1
			},
			{
				name	= 'OVERLAY',
				texture	= {
					-- needs dds flags and alt name for each! tex to deal with the unconventional naming
					{n='POLICE',	u=GU_.MTC},
					{n='1',			u=GU_.NOT},
					{n='2',			u=GU_.NOT},
					{n='3',			u=GU_.NOT,	pt='Paint',	ca='None'},
					{n='4',			u=GU_.NOT,	pt='Paint',	ca='Alternative1'}
				},
				dds		= 1
			},
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				texture	= {'1'},
				dds		= 1
			}
		}
	},
	{--	ship: fake light beam & glow parts	!!AFFECTS proc-gen texture
		active	= false,
		label	= 'RECTWHITELIGHT',
		path	= 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 0
			}
		}
	},
	{--	ship: glow rectangle parts			!!AFFECTS proc-gen texture
		active	= false,
		label	= 'RECTLIGHT',
		path	= 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 0
			}
		}
	},
	{--	ship: glow circle parts				!!AFFECTS proc-gen texture
		active	= false,
		label	= 'CIRCLELIGHT',
		path	= 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 0
			}
		}
	},
	{--	ship: headlights					!!AFFECTS proc-gen texture
		active	= false,
		label	= 'HEADLIGHT',
		path	= 'TEXTURES/COMMON/SPACECRAFT/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				dds		= 0
			}
		}
	},
	{--	sentinel square lights !! NOT WORKING
		active	= false,
		label	= 'LIGHTS',
		path	= 'TEXTURES/COMMON/ROBOTS/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				texture	= {'1'},
				dds		= 1
			}
		}
	},
	{--	sentinel back lights   !! NOT WORKING
		active	= false,
		label	= 'LIGHTS',
		path	= 'TEXTURES/COMMON/ROBOTS/SHARED/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Primary',
				texture	= {'2'},
				dds		= 1
			}
		}
	},
}

--	handles 3 options:
--	* An array of names
--	* An array of tables of the following - non-essential - properties:
--	  {n='name', pr=0.3, u=GU_.NOT,	pt='palette', ca='colouralt'} >> u=TextureGameplayUseEnum
--	* nil, in which case all default values apply
local function BuildProcTextures(path, layer)
	local T = { meta = {name='Textures'} }
	for _,ptex in ipairs(layer.texture or {{n=''}}) do
		if type(ptex) == 'string' then ptex = {n=ptex} end
		T[#T+1] = {
			meta	= {name='Textures', value='TkProceduralTexture'},
			Name				= ptex.n,
			Probability			= ptex.pr or 1,
			TextureGameplayUse	= ptex.u,
			TextureName			= table.concat({
				path,
				'.',
				layer.dds ~= 0	and layer.name..'.'	or '',
				ptex.n ~= ''	and ptex.n..'.'		or '',
				'DDS'
			}),
			Palette	= {
				meta	= {name='Palette', value='TkPaletteTexture'},
				Palette		= ptex.pt or (layer.palette	or 'Rock'),
				ColourAlt	= ptex.ca or (layer.color	or 'None'),
				Index		= -1
			}
		}
	end
	return T
end

local function BuildProcLayer(layer, group, fpath)
	return {
		meta	= {name='Layers', value='TkProceduralTextureLayer'},
		Name				= layer.name,
		Probability			= 1,
		Group				= group,
		SelectToMatchBase	= layer.matchbase,
		Textures			= BuildProcTextures(fpath, layer)
	}
end

-- make changes to a cTkProceduralTextureList file
local function ProcTexLayersChanges(proc_texs)
	local T = {}
	for _,layer in ipairs(proc_texs.layers) do
		if layer.delete then
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Name', layer.name},
				REMOVE				= 'Section'
			}
		else
			T[#T+1] = {
				SPECIAL_KEY_WORDS	= {'Name', layer.name},
				ADD_OPTION			= 'ReplaceWholeSection',
				ADD					= ToMxml(BuildProcLayer(layer, proc_texs.group, proc_texs.fpath))
			}
		end
	end
	return T
end

-- build a full cTkProceduralTextureList file
local function BuildProcTexListMbin(proc_texs)
	local T = { meta = {name='Layers'} }
	for _,layer in ipairs(proc_texs.layers) do
		T[#T+1] = BuildProcLayer(layer, proc_texs.group, proc_texs.fpath)
	end
	-- complete to the fixed length (8) array
	for _=1, (8 - #proc_texs.layers) do
		T[#T+1] = {value = 'TkProceduralTextureLayer'}
	end
	-- return full mxml
	return ToMxmlFile(T, 'cTkProceduralTextureList')
end

local mct, add = {}, {}
for _,ptf in ipairs(proc_texture_files) do
	if ptf.active == nil or ptf.active == true then
		ptf.fpath = ptf.path..ptf.label
		if ptf.edit then
			mct[#mct+1] = {
				MBIN_FILE_SOURCE	= ptf.fpath..'.TEXTURE.MXML',
				EXML_CREATE			= ptf.edit:lower() == 'exml',
				MXML_CHANGE_TABLE	= ProcTexLayersChanges(ptf)
			}
		else
			add[#add+1] = {
				FILE_DESTINATION 	= ptf.fpath..'.TEXTURE.MXML',
				FILE_CONTENT	 	= BuildProcTexListMbin(ptf)
			}
		end
	end
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+ TEXTURE build proc-gen layers',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.24',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= #add > 0 and add or nil,
	MODIFICATIONS 		= #mct > 0 and {{ MBIN_CHANGE_TABLE = mct }} or nil
}
