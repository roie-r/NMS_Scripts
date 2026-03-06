-------------------------------------------------------------------------------
---	MXML 2 LUA ... by lMonk
---	A tool for converting between mxml file format and lua table.
--- The complete tool can be found at: https://github.com/roie-r/mxml_2_lua
-------------------------------------------------------------------------------
---	Build GcObjectSpawnData entries ... version: 1.0.05
-------------------------------------------------------------------------------

--	=> Build a GcObjectSpawnData entry for biome object files
function ObjectSpawnEntry(items)
	local function orTrue(b)
		return b == nil and true or b
	end
	local function spawnEntry(osd)
		return {
			meta	= {name=(osd.class or 'Objects'), value='GcObjectSpawnData'},
			Resource	= {
				meta	= {name='Resource', value='GcResourceElement'},
				Filename	= osd.filename,										-- s
				Seed		= osd.resourceseed or 'NONE',
				ProceduralTexture	= osd.texturesamplers and {
					meta = {name='ProceduralTexture', value='TkProceduralTextureChosenOptionList'},
					Samplers = (
						function()
							local T = { meta = {name='Samplers'} }
							for _,ptco in ipairs(osd.texturesamplers) do
								local tsam = {
									meta = {name='Samplers', value='TkProceduralTextureChosenOptionSampler'},
									Options = { meta = {name='Options'} }
								}
								for _, opt in ipairs(ptco) do
									tsam.Options[#tsam.Options+1] = {
										meta = {name='Options', value='TkProceduralTextureChosenOption'},
										Layer			= opt.layer,						-- s
										Group			= opt.group,						-- s
										Palette			= {
											meta = {name='Palette', value='TkPaletteTexture'},
											Palette		= opt.palette	or 'Rock',			-- Enum
											ColourAlt	= opt.colouralt	or 'None'			-- Enum
										},
										OverrideColour	= opt.override	or true,			-- b
										Colour			= ColorData(opt.color, 'Colour'),	-- rgb/hex
										OptionName		= opt.optionname					-- s
									}
								end
								T[#T+1] = tsam
							end
							return T
						end
					)()
				} or nil
			},
			Type		= osd.type or 'Instanced',								-- Enum
			ImposterActivation = {
				meta = {name='ImposterActivation', value='TkImposterActivation'},
				ImposterActivation		= osd.impactive or 'Default'			-- Enum
			},
			ImposterType = {
				meta = {name='ImposterType', value='TkImposterType'},
				ImposterType			= osd.imptype or 'Hemispherical'		-- Enum
			},
			QualityVariants = (													-- list
				function()
					local T = {meta = {name='QualityVariants'}}
					for i, osdv in ipairs(osd.qualityvariants) do
						T[#T+1] = {
							meta	= {name='QualityVariants', value='GcObjectSpawnDataVariant'},
							ID						= i == 1 and 'STANDARD' or 'ULTRA',
							Coverage				= osdv.coverage,			-- f
							FlatDensity				= osdv.flatdensity,			-- f
							SlopeDensity			= osdv.slopedensity,		-- f
							SlopeMultiplier			= osdv.slopemultiplier,		-- f
							MaxRegionRadius			= osdv.maxregion or 10,		-- i
							MaxImposterRadius		= osdv.maximposter or 88,	-- i
							FadeOutStartDistance	= osdv.fadeoutstart or 9999,-- f
							FadeOutEndDistance		= osdv.fadeoutend or 9999,	-- f
							FadeOutOffsetDistance	= osdv.fadeoutoffset or nil,-- f
							LodDistances	= {									-- list
								meta = {name='LodDistances'},
								0,
								osdv.lod and osdv.lod[1] or 20,					-- f
								osdv.lod and osdv.lod[2] or 60,					-- f
								osdv.lod and osdv.lod[3] or 150,				-- f
								osdv.lod and osdv.lod[4] or 500					-- f
							}
						}
					end
					return T
				end
			)(),
			Placement					= osd.placement,						-- s
			PlacementPriority			= osd.priority or 'Normal',				-- Enum
			AlignToNormal				= osd.aligntonormal,					-- b
			['MinScale ']				= osd.minscale,							-- f
			MaxScale					= osd.maxscale,							-- f
			MinScaleY					= osd.minscaley,						-- f
			MaxScaleY					= osd.maxscaley,						-- f
			SlopeScaling				= osd.slopescaling,						-- f
			PatchEdgeScaling			= osd.edgescaling,						-- f
			MaxXZRotation				= osd.maxxzrotation,					-- f
			MaxYRotation				= osd.maxyrotation,						-- f
			MaxRaise					= osd.maxraise,							-- f
			MaxLower					= osd.maxlower,							-- f
			UseMultipleUpgradeRays		= osd.usemultirays,						-- b
			Order						= osd.order,							-- i
			Seed 						= osd.spawnseed or 'NONE',
			LargeObjectCoverage			= osd.largeobject or 'AlwaysPlace',		-- Enum
			OverlapStyle				= osd.overlap or 'None',				-- Enum
			MinAngle					= osd.minangle,							-- f
			MaxAngle					= osd.maxangle,							-- f
			MinHeight					= osd.minheight or -1,					-- f
			MaxHeight					= osd.maxheight or 128,					-- f
			RelativeToSeaLevel			= orTrue(osd.relativetosea),			-- b
			MatchGroundColour			= osd.matchground,						-- b
			GroundColourIndex			= osd.groundcolour or 'Auto',			-- Enum
			SwapPrimaryForSecondaryColour=osd.swap1stfor2nd,					-- b
			SwapPrimaryForRandomColour	= osd.swap1stforRand,					-- b
			AutoCollision				= osd.autocollision,					-- b
			CollideWithPlayer			= osd.collidewithplayer,				-- b
			CollideWithPlayerVehicle	= orTrue(osd.collidewithvehicle),		-- b
			DestroyedByPlayerVehicle	= orTrue(osd.destroyedbyvehicle),		-- b
			DestroyedByPlayerShip		= orTrue(osd.destroyedbyship),			-- b
			DestroyedByTerrainEdit		= orTrue(osd.destroyedbyterrainedit),	-- b
			InvisibleToCamera			= orTrue(osd.invisibletocamera),		-- b
			CreaturesCanEat				= osd.creaturescaneat,					-- b
			ShearWindStrength			= osd.shearwind,						-- f
			SupportsScanToReveal		= osd.scantoreveal,						-- b
			MoveToGroundOnUpgrade		= true,
			IsFloatingIsland			= osd.isfloatingisland,					-- b
			DestroyedByVehicleEffect	= osd.vehicleeffect or 'VEHICLECRASH',	-- s
		}
	end
	return ProcessOnenAll(items, spawnEntry)
end