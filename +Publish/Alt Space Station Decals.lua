dofile('LIB/_lua_2_mxml.lua')
---------------------------------------------------------------------------------
local mod_desc = [[
  Replaces old style space station numbers and decals.

  * 'source' path in the table is used for importing the files!
    it must be updated to a local path in order to be used.

  * DDS files import is skipped SILENTLY if file paths are not found!
]]-------------------------------------------------------------------------------
--<<M2L marker>>--

local proc_texture_files = {
	{--	space station front lettering
		label	= 'LETTERING',
		-- group	= 'DECALLETTER',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures_mod_source/textures/space/spacestation/decals/',
		nmspath	= 'TEXTURES/SPACE/SPACESTATION/DECALS/',
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
		-- group	= 'DECALNUMBER',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures_mod_source/textures/space/spacestation/decals/',
		nmspath	= 'TEXTURES/SPACE/SPACESTATION/DECALS/',
		layers	= {
			{
				name	= 'BASE',
				texture	= {'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
				dds		= 1
			}
		}
	}
}

local function GetProcTextures(path, layer)
	local T = { meta = {name='Textures'} }
	--	handles 3 options:
	--	* An array of names
	--	* An array of tables of the following - non-essential - properties:
	--	  {n='name', pr=0.3, u=GU_.DNM,	pt='palette', ca='colouralt'} >> u=TextureGameplayUseEnum
	--	* nil, in which case all default values apply
	for _,ptex in ipairs(layer.texture or {{n=''}}) do
		if type(ptex) == 'string' then ptex = {n=ptex} end
		T[#T+1] = {
			meta = {name='Textures', value='TkProceduralTexture'},
			Name				= ptex.n,
			Probability			= ptex.pr or 1,
			TextureGameplayUse	= ptex.u,
			TextureName			= table.concat({
				path,
				'.',
				layer.dds ~= 0 and layer.name..'.' or '',
				ptex.n ~= '' and ptex.n..'.' or '',
				'DDS'
			}),
			Palette				= {
				meta = {name='Palette', value='TkPaletteTexture'},
				Palette		= ptex.pt or (layer.palette	or 'Rock'),
				ColourAlt	= ptex.ca or (layer.color	or 'None'),
				Index		= -1
			}
		}
	end
	return T
end

local function BuildProcTexListMbin(proc_tex_list)
	local T = { meta = {name='Layers'} }
	for _,layr in ipairs(proc_tex_list.layers) do
		T[#T+1] = {
			meta = {name='value', value='TkProceduralTextureLayer'},
			Name				= layr.name,
			Probability			= proc_tex_list.ly_prob	or 1,
			Group				= proc_tex_list.group,
			SelectToMatchBase	= layr.matchbase,
			Textures			= GetProcTextures(proc_tex_list.nmspath..proc_tex_list.label, layr)
		}
	end
	-- complete to the fixed length (8) array
	for _=1, (8 - #proc_tex_list.layers) do
		T[#T+1] = {value = 'TkProceduralTextureLayer'}
	end
	-- new mbin
	return ToMxmlFile(T, 'cTkProceduralTextureList')
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= 'MOD.lMonk.Alt Space Staion Decals',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= (
		function()
			local T = {}
			for _,ptf in ipairs(proc_texture_files) do
				T[#T+1] = {
					FILE_CONTENT	 = BuildProcTexListMbin(ptf),
					FILE_DESTINATION = ptf.nmspath..ptf.label..'.TEXTURE.MXML'
				}
				if ptf.source and lfs.attributes(ptf.source) then
					T[#T+1] = {
						EXTERNAL_FILE_SOURCE = ptf.source..ptf.label..'*.DDS',
						FILE_DESTINATION	 = ptf.nmspath..'*.DDS'
					}
				end
			end
			return T
		end
	)()
}