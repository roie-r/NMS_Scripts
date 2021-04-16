--[[┎──────────────────────────────────────────
	┃ Remove bloom glow flag
────┸──────────────────────────────────────--]]
P = {
	ship = 'MODELS\COMMON\SPACECRAFT\\',
	exo = 'MODELS\COMMON\VEHICLES\\',
	glitch = 'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\FOLIAGE\\',
	cook = 'MODELS\PLANETS\BIOMES\COMMON\COOKING\\',
	wild = 'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\BIOMESPECPLANTS\\',
	farm = 'MODELS\PLANETS\BIOMES\COMMON\INTERACTIVEFLORA\\'
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 02 remove bloom.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS\COMMON\SPACECRAFT\DROPSHIPS\SUBWINGS\SUBWINGSF\SUBWINGSF_RIGHT\GLOW_MAT.MATERIAL.MBIN',
			'MODELS\COMMON\SPACECRAFT\DROPSHIPS\SUBWINGS\SUBWINGSF\SUBWINGSF_RIGHT\GLOW_MAT1.MATERIAL.MBIN',
			'MODELS\COMMON\SPACECRAFT\DROPSHIPS\SUBWINGS\SUBWINGSF\SUBWINGSF_LEFT\GLOW_MAT.MATERIAL.MBIN',
			'MODELS\COMMON\SPACECRAFT\DROPSHIPS\SUBWINGS\SUBWINGSF\SUBWINGSF_LEFT\GLOW_MAT1.MATERIAL.MBIN',

			-- P.glitch .. 'BEAMSTONE\SCROLLING_MAT.MATERIAL.MBIN',
			-- P.glitch .. 'BEAMSTONE\LIGHTBEAM_MAT3.MATERIAL.MBIN',
			-- P.glitch .. 'SHARDGARDEN\SHARD_MAT.MATERIAL.MBIN',
			-- P.glitch .. 'STARJOINT\MSTRUCTURE_MAT.MATERIAL.MBIN',
			-- P.glitch .. 'BONEGARDEN\BONEGLOWCOLOURISABLE.MATERIAL.MBIN',
			-- P.glitch .. 'WEIRDCUBE\CELLSCOLOURISABLE1.MATERIAL.MBIN',
			-- P.glitch .. 'WEIRDCUBE\CELLSCOLOURISABLE2.MATERIAL.MBIN',

			-- P.cook .. 'ALOEFLESH\FRUITGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'FIREBERRY\FIREPLANTGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'FROZENTUBERS\GLOWSCROLLMAT.MATERIAL.MBIN',
			-- P.cook .. 'HEXABERRY\HEXABERRYFLOATMAT.MATERIAL.MBIN',
			-- P.cook .. 'HEXABERRY\HEXABERRYORBMAT.MATERIAL.MBIN',
			-- P.cook .. 'IMPULSEBEANS\IMPULSEGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'IMPULSEBEANS\IMPULSESCROLLGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'JADEPEAS\JADEPEASGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'PULPYROOTS\COOKINGGLOWMAT.MATERIAL.MBIN',
			-- P.cook .. 'SWEETROOT\GLOWSCROLLMAT.MATERIAL.MBIN',

			-- P.wild .. 'LUSHPLANT\STARBULB_MAT.MATERIAL.MBIN',
			-- P.wild .. 'RADIOACTIVEPLANT\RADIOFRUIT_MAT.MATERIAL.MBIN',
			-- P.wild .. 'SCORCHEDPLANT\FRUITYELLOW_MAT.MATERIAL.MBIN',
			-- P.wild .. 'SNOWPLANT\AIRCRYSTAL_MAT.MATERIAL.MBIN',
			-- P.wild .. 'TOXICPLANT\PLANTUNLIT_MAT.MATERIAL.MBIN',

			-- P.farm .. 'FARMLUSH\STARBULB_MAT.MATERIAL.MBIN',
			-- P.farm .. 'FARMRADIOACTIVE\FRUITGLOW_MAT.MATERIAL.MBIN',
			-- P.farm .. 'FARMSCORCHED\FRUITYELLOW_MAT.MATERIAL.MBIN',
			-- P.farm .. 'FARMTOXIC\PLANTUNLIT_MAT.MATERIAL.MBIN',
			-- P.farm .. 'FARMDEADCREATURE\CAV_PLANTUNLIT_MAT.MATERIAL.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				SPECIAL_KEY_WORDS	= {'MaterialFlag', '_F34_GLOW'},
				REMOVE				= 'SECTION'
			}
		}
	}
}}}}
