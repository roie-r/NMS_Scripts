---------------------------------------------------------------------
dofile('LIB/lua_2_exml.lua')
---------------------------------------------------------------------
mod_desc = [[
  Generate proc texture files & include the relevant dds files
  diff/normal/masks	= true >> add the texture path to layer
  If a source path is present add the files to the pak
]]--------------------------------------------------------------

--	TextureGameplayUseEnum
U_ = {IGR='IgnoreName', MCT='MatchName', DNM='DoNotMatchName'}

local proc_texture_files = {
	{--	bioship engine flare line
		label	 = 'PULSELINES',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		{
			ly_name	= 'BASEP',
			tx_name	= {'1'},
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	bioship engine flare
		label	 = 'PULSELINEENGINE',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		{
			ly_name	= 'BASE5',
			palette = 'Paint',
			color	= 'Alternative1',
			diff	= true
		}
	},
	{--	ship interior: plastic
		label	 = 'PLASTICGRAIN',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	ship interior: plastic alt1
		disabled = true,
		label	 = 'PLASTICGRAINALT1',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Alternative1',
			diff	= true
		}
	},
	{--	ship interior: plastic alt2 (maybe disabled)
		disabled = true,
		label	 = 'PLASTICGRAINALT2',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/SHARED/COCKPITINTERIORS/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Alternative3',
			diff	= true
		}
	},
	{--	ship decals : logo
		label	 = 'LOGO',
		group	 = 'DECALLOGO',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/logo/',
		nmspath	 = 'TEXTURES/COMMON/DECALS/LOGO/',
		{
			ly_name	= 'OVERLAY',
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'L15', 'L14', 'L13', 'L12', 'L11', 'L10', 'L9', 'L8', 'L7', 'L6', 'L5', 'L4', 'L3', 'L2', 'L1'},
			palette = 'Paint',
			color	= 'Alternative2',
			diff	= true
		}
	},
	{--	ship decals : rectangle
		label	 = 'RECTANGLE',
		group	 = 'DECALRECTANGLE',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/rectangle/',
		nmspath	 = 'TEXTURES/COMMON/DECALS/RECTANGLE/',
		{
			ly_name	= 'OVERLAY',
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'R15', 'R14', 'R13', 'R12', 'R11', 'R10', 'R9', 'R8', 'R7', 'R6', 'R5', 'R4', 'R3', 'R2', 'R1'},
			palette = 'Paint',
			color	= 'Alternative2',
			diff	= true
		}
	},
	{--	ship decals : smallsign
		label	 = 'SMALLSIGN',
		group	 = 'DECALSMALLSIGN',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/smallsign/',
		nmspath	 = 'TEXTURES/COMMON/DECALS/SMALLSIGN/',
		{
			ly_name	= 'OVERLAY',
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'S6', 'S5', 'S4', 'S3', 'S2', 'S1'},
			palette = 'Paint',
			color	= 'Alternative3',
			diff	= true
		}
	},
	{--	ship decals : number
		label	 = 'NUMBER',
		group	 = 'DECALNUMBER',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/number/',
		nmspath	 = 'TEXTURES/COMMON/DECALS/NUMBER/',
		{
			ly_name	= 'OVERLAY',
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
			palette = 'Paint',
			color	= 'Alternative1',
			diff	= true
		}
	},
	{--	ship decals : lettering
		label	 = 'LETTERING',
		group	 = 'DECALLET',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/lettering/',
		nmspath	 = 'TEXTURES/COMMON/DECALS/LETTERING/',
		{
			ly_name	= 'OVERLAY',
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'LT1', 'LT2', 'LT3', 'LT4', 'LT5', 'LT6', 'LT7', 'LT8', 'LT9'},
			palette = 'Paint',
			color	= 'Alternative2',
			diff	= true
		}
	},
	{--	space station front lettering
		label	 = 'LETTERING',
		group	 = 'DECALLETTER',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/station/',
		nmspath	 = 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		{
			ly_name	= 'OVERLAY',
			color	= 'Primary',
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'ST1', 'ST2', 'ST3', 'ST4', 'ST5', 'ST6', 'ST7'},
			diff	= true
		}
	},
	{--	space station front number
		label	 = 'NUMBER',
		group	 = 'DECALNUMBER',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/station/',
		nmspath	 = 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		{
			ly_name	= 'OVERLAY',
			color	= 'Primary',
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
			diff	= true
		}
	},
	{--	multitool glow parts
		label	 = 'MULTITOOLGLOW',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Weapon/',
		nmspath	 = 'TEXTURES/COMMON/WEAPONS/MULTITOOL/',
		{
			ly_name	= 'BASE',
			palette = 'Crystal',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	royal ship
		label	 = 'ROYALSCLASS_TRIM',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Ship/Royal/',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/S-CLASS/',
		{
			ly_name	= 'OVERLAYMETAL',
			tx_name	= {{n='SILVER', pr=0.7}, {n='GOLD', pr=0.3}},
			diff	= true
		},
		{
			ly_name	= 'BASE',
			palette = 'SpaceBottom',
			color	= 'Primary',
			diff	= true,
			normal	= true,
			masks	= true
		}
	},
	{--	mech hardframe
		label	 = 'SENTINELTRIM',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/FriendlyRobot/',
		nmspath	 = 'TEXTURES/COMMON/ROBOTS/',
		{
			ly_name	= 'OVERLAY',
			diff	= true,
		},
		{
			ly_name	= 'PRIMARY',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true,
		},
		{
			ly_name	= 'SECONDARY',
			palette = 'Paint',
			color	= 'Alternative1',
			diff	= true,
		},
		{
			ly_name	= 'TERTIARY',
			palette = 'Paint',
			color	= 'Alternative2',
			diff	= true,
		},
		{
			ly_name	= 'BASE',
			diff	= true,
			normal	= true,
			masks	= true
		}
	},
	{--	sentinel ship
		disabled = true,
		label	 = 'SENTINELPROC',
		nmspath	 = 'TEXTURES/COMMON/ROBOTS/',
		{
			ly_name	= 'FIXED',
			tx_name	= {'1', '2'},
			diff	= true,
			masks	= true
		},
		{
			ly_name	= 'OVERLAY',
			tx_name	= {
				-- needs dds flags and alt name for each tex to deal with the unconventional naming
				{n='POLICE',	u=U_.MCT},
				{n='1',			u=U_.DNM},
				{n='2',			u=U_.DNM},
				{n='3',			u=U_.DNM,	pt='Paint',	ca='None'},
				{n='4',			u=U_.DNM,	pt='Paint',	ca='Alternative1'}
			},
			diff	= true,
			normal	= true,
			masks	= true
		},
		{
			ly_name	= 'BASE',
			tx_name	= {'1'},
			palette = 'Paint',
			color	= 'Primary',
			diff	= true,
			normal	= true,
			masks	= true
		}
	},
	{--	ship: fake light beam & glow parts !!AFFECTS ship pro-gen PAINTED/PANELS!!
		disabled = true,
		label	 = 'RECTWHITELIGHT',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/_Publish/',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	ship: glow rectangle parts !!AFFECTS ship pro-gen PAINTED/PANELS!!
		disabled = true,
		label	 = 'RECTLIGHT',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/_Publish/',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	ship: glow circle parts !!AFFECTS ship proc-gen PAINTED/PANELS!!
		disabled = true,
		label	 = 'CIRCLELIGHT',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/_Publish/',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/FIGHTERS/SHARED/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	ship: glow circle parts !!AFFECTS ship proc-gen PAINTED/PANELS!!
		disabled = true,
		label	 = 'HEADLIGHT',
		source	 = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/_Publish/',
		nmspath	 = 'TEXTURES/COMMON/SPACECRAFT/SHARED/',
		{
			ly_name	= 'BASE',
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	sentinel square lights !! NOT WORKING
		disabled = true,
		label	 = 'LIGHTS',
		nmspath	 = 'TEXTURES/COMMON/ROBOTS/SHARED/',
		{
			ly_name	= 'BASE',
			tx_name	= {'1'},
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
	{--	sentinel back lights   !! NOT WORKING
		disabled = true,
		label	 = 'LIGHTS',
		nmspath	 = 'TEXTURES/COMMON/ROBOTS/SHARED/',
		{
			ly_name	= 'BASE',
			tx_name	= {'2'},
			palette = 'Paint',
			color	= 'Primary',
			diff	= true
		}
	},
}

local function GetProcTextures(path, layer)
	-- concat table with [.] separator
	local function TexPath(args)
		if not args.b then return nil end
		local con = ''
		for _,ar in ipairs(args) do
			if ar and #ar > 0 then
				con = con..ar..'.'
			end
		end
		return con..'DDS'
	end
	local T = {META = {'name', 'Textures'}}

	-- handles 3 options:
	--  A names string array
	--  A list of tables of the following - non-essential - properties:
	--   {n='name', pr=0.3, u=U_.DNM,	pt='palette', ca='colouralt'} >> u=TextureGameplayUseEnum
	--  or none, in which case all default values will apply
	for _,ptex in ipairs(layer.tx_name and layer.tx_name or {{n=''}}) do
		if type(ptex) == 'string' then ptex = {n=ptex} end
		T[#T+1] = {
			META	= {'value', 'TkProceduralTexture.xml'},
			Name				= ptex.n,
			Probability			= ptex.pr or 1,
			TextureGameplayUse	= ptex.u,
			Diffuse				= TexPath({b=layer.diff,   path, layer.ly_name, ptex.n}),
			Normal				= TexPath({b=layer.normal, path, layer.ly_name, 'NORMAL'}),
			Mask				= TexPath({b=layer.masks,  path, layer.ly_name, 'MASKS'}),
			Palette				= {
				META	= {'Palette', 'TkPaletteTexture.xml'},
				Palette		= ptex.pt or (layer.palette	or 'Rock'),
				ColourAlt	= ptex.ca or (layer.color	or 'None')
			}
		}
	end
	return T
end

local function BuildProcTexListMbin(tex_layer)
	-- Assign the exml table with its designated meta
	local T = { META = {'name', 'Layers'} }
	for _,ly in ipairs(tex_layer) do
		T[#T+1] = {
			META	= {'value', 'TkProceduralTextureLayer.xml'},
			Name		= ly.ly_name,
			Probability	= tex_layer.ly_prob	or 1,
			Group		= tex_layer.group,
			Textures	= GetProcTextures(tex_layer.nmspath..tex_layer.label, ly)
		}
	end
	-- complete to the fixed length (8) array
	for _=1, (8 - #tex_layer) do
		T[#T+1] = {value = 'TkProceduralTextureLayer.xml'}
	end
	-- new mbin
	return FileWrapping(T, 'TkProceduralTextureList')
end

-- io.open('e:/_dump/15.TEXTURE.EXML', 'w'):write(BuildProcTexListMbin(proc_texture_files[15]))

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__TEXTURE build proc-gen layers.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '4.44',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= (
		function()
			local T = {}
			for _,ptf in ipairs(proc_texture_files) do
				if not ptf.disabled then
					T[#T+1] = {
						FILE_CONTENT		= BuildProcTexListMbin(ptf),
						FILE_DESTINATION	= ptf.nmspath..ptf.label..'.TEXTURE.EXML'
					}
					if ptf.source then
						T[#T+1] = {
							EXTERNAL_FILE_SOURCE= ptf.source..ptf.label..'*.DDS',
							FILE_DESTINATION	= ptf.nmspath..'*.DDS'
						}
					end
				end
			end
			return T
		end
	)()
}
