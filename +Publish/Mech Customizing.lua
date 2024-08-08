---------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
---------------------------------------------------------------------
local mod_desc = [[
  Adds in-game customizing for the hardframe and Liquidator mech!
  (Customizing is done through the mech's geobay menu)

  * If you want to pack the texture files with the script,
   you'll need to set a relevant file path for them.
   If you use ModExtraFilesToInclude, just comment/delete 'source'
]]-------------------------------------------------------------------

local proc_texture_files = {
	{--	mech hardframe
		enabled	= true,
		label	= 'SENTINELTRIM',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/FriendlyRobot/',
		nmspath	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'OVERLAY',
				diff	= true,
			},
			{
				name	= 'PRIMARY',
				palette = 'Paint',
				color	= 'Primary',
				diff	= true,
			},
			{
				name	= 'SECONDARY',
				palette = 'Paint',
				color	= 'Alternative1',
				diff	= true,
			},
			{
				name	= 'TERTIARY',
				palette = 'Paint',
				color	= 'Alternative2',
				diff	= true,
			},
			{
				name	= 'BASE',
				diff	= true,
				noname	= true, -- omit name from mask & normal path
				normal	= true,
				masks	= true
			}
		}
	},
	{--	mech liquidator
		enabled	= true,
		label	= 'ARMYMECH',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/FriendlyRobot/',
		nmspath	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'TERTIARY',
				palette = 'Paint',
				color	= 'Alternative2',
				diff	= true,
			},
			{
				name	= 'PRIMARY',
				palette = 'Paint',
				color	= 'Primary',
				diff	= true,
			},
			{
				name	= 'SECONDARY',
				palette = 'Paint',
				color	= 'Alternative1',
				diff	= true,
			},
			{
				name	= 'BASE',
				diff	= true,
				noname	= true, -- omit name from mask & normal path
				normal	= true,
				masks	= true
			}
		}
	},
	{--	mech liquidator trim
		enabled	= true,
		label	= 'ARMYTRIM',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/FriendlyRobot/',
		nmspath	= 'TEXTURES/COMMON/ROBOTS/',
		layers	= {
			{
				name	= 'OVERLAY',
				palette = 'Paint',
				color	= 'Alternative2',
				diff	= true,
			},
			{
				name	= 'BASE',
				diff	= true,
				noname	= true, -- omit name from mask & normal path
				normal	= true,
				masks	= true
			}
		}
	},
}

local function GetProcTextures(path, layer)
	local function TexPath(b, prts)
		if not b then return nil end
		local pth = ''
		for _,p in ipairs(prts) do
			if p and #p > 0 then
				pth = pth..p..'.'
			end
		end
		return pth..'DDS'
	end
	local T = {meta = {'name', 'Textures'}}

	--	handles 3 options:
	--	* An array of names
	--	* An array of tables of the following - non-essential - properties:
	--	  {n='name', pr=0.3, u=GU_.DNM,	pt='palette', ca='colouralt'} >> u=TextureGameplayUseEnum
	--	* None, in which case all default values apply
	for _,ptex in ipairs(layer.texture or {{n=''}}) do
		if type(ptex) == 'string' then ptex = {n=ptex} end
		T[#T+1] = {
			meta	= {'value', 'TkProceduralTexture.xml'},
			Name				= ptex.n,
			Probability			= ptex.pr or 1,
			TextureGameplayUse	= ptex.u,

			Diffuse				= TexPath(layer.diff,   {path, layer.name, ptex.n}),
			Normal				= TexPath(layer.normal, {path, layer.noname and '' or layer.name, 'NORMAL'}),
			Mask				= TexPath(layer.masks,  {path, layer.noname and '' or layer.name, 'MASKS'}),
			Parallax			= TexPath(layer.prlx,	{path, layer.noname and '' or layer.name, 'PARALLAX'}),
			Palette				= {
				meta	= {'Palette', 'TkPaletteTexture.xml'},
				Palette		= ptex.pt or (layer.palette	or 'Rock'),
				ColourAlt	= ptex.ca or (layer.color	or 'None')
			}
		}
	end
	return T
end

local function BuildProcTexListMbin(proc_tex_list)
	-- Assign the exml table with its designated meta
	local T = { meta = {'name', 'Layers'} }
	for _,ly in ipairs(proc_tex_list.layers) do
		T[#T+1] = {
			meta	= {'value', 'TkProceduralTextureLayer.xml'},
			Name				= ly.name,
			Probability			= proc_tex_list.ly_prob	or 1,
			Group				= proc_tex_list.group,
			SelectToMatchBase	= ly.matchbase,
			Textures			= GetProcTextures(proc_tex_list.nmspath..proc_tex_list.label, ly)
		}
	end
	-- complete to the fixed length (8) array
	for _=1, (8 - #proc_tex_list.layers) do
		T[#T+1] = {value = 'TkProceduralTextureLayer.xml'}
	end
	-- new mbin
	return FileWrapping(T, 'TkProceduralTextureList')
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.Mech Hardframe Customizing.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.03',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= (
		function()
			local T = {}
			for _,ptf in ipairs(proc_texture_files) do
				if ptf.enabled then
					T[#T+1] = {
						FILE_CONTENT	 = BuildProcTexListMbin(ptf),
						FILE_DESTINATION = ptf.nmspath..ptf.label..'.TEXTURE.EXML'
					}
					if ptf.source then
						T[#T+1] = {
							EXTERNAL_FILE_SOURCE = ptf.source..ptf.label..'*.DDS',
							FILE_DESTINATION	 = ptf.nmspath..'*.DDS'
						}
					end
				end
			end
			return T
		end
	)()
}
