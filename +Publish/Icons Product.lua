---------------------------------------------------------------
local mod_desc = [[
  edit/replace/update/improve product icons

  * ADD_FILES will skipped SILENTLY if new files are not found!
]]-------------------------------------------------------------

local prod_icons = {
	CARBON_SEAL		= 'PRODUCTS/PRODUCT.MSEAL.DDS',
	STATION_KEY		= 'PRODUCTS/PRODUCT.STATION.OVERRIDE.DDS',
	FISHBAIT_1		= 'COOKINGPRODUCTS/PRODUCT.BAIT.WORMS.DDS',
	FOOD_M_BALL		= 'COOKINGPRODUCTS/PRODUCT.MEAT.BRAIN.DDS',
	FOOD_M_BEETLE	= 'COOKINGPRODUCTS/PRODUCT.MEAT.CARAPACE.DDS',
	FOOD_M_BONE		= 'COOKINGPRODUCTS/PRODUCT.BONE.CRYSTAL.DDS',
	FOOD_M_CAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.LIVER.DDS',
	FOOD_M_COW		= 'COOKINGPRODUCTS/PRODUCT.MEAT.STEAK1.DDS',
	FOOD_M_CRAB		= 'COOKINGPRODUCTS/PRODUCT.MEAT.CRAB.DDS',
	FOOD_M_DIGGER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.BONEY.DDS',
	FOOD_M_DIPLO	= 'COOKINGPRODUCTS/PRODUCT.MEAT.STEAK2.DDS',
	FOOD_M_DRILL	= 'COOKINGPRODUCTS/PRODUCT.MEAT.SINEW.DDS',
	FOOD_M_FISH		= 'COOKINGPRODUCTS/PRODUCT.MEAT.FISH.DDS',
	FOOD_M_FLYER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.WING.DDS',
	FOOD_M_HORROR	= 'COOKINGPRODUCTS/PRODUCT.MEAT.HORROR.DDS',
	FOOD_M_MEAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.CHUNKY.DDS',
	FOOD_M_MOLE		= 'COOKINGPRODUCTS/PRODUCT.MEAT.MOLE.DDS',
	FOOD_M_REX		= 'COOKINGPRODUCTS/PRODUCT.MEAT.SCALE.DDS',
	FOOD_M_STRIDER	= 'COOKINGPRODUCTS/PRODUCT.MEAT.SAUSAGE1.DDS',
	FOOD_V_BUG		= 'COOKINGPRODUCTS/PRODUCT.R.BUG.DDS',
	FOOD_V_GEK		= 'COOKINGPRODUCTS/PRODUCT.MILK.PROTO.DDS',
	FOOD_V_FLYER	= 'COOKINGPRODUCTS/PRODUCT.MILK.CRAW.DDS',
	FOOD_V_MILK		= 'COOKINGPRODUCTS/PRODUCT.MILK.WILD.DDS',
	FOOD_R_BONEMILK	= 'COOKINGPRODUCTS/PRODUCT.MILK.BONE.DDS',
	FOOD_R_EYEBALLS	= 'COOKINGPRODUCTS/PRODUCT.R.EYEBALLS.DDS',
	FOOD_R_HORROR	= 'COOKINGPRODUCTS/PRODUCT.R.HORROR.DDS',
	FOOD_V_BONE		= 'COOKINGPRODUCTS/PRODUCT.BONE.PIECE.DDS',
	FOOD_V_CAT		= 'COOKINGPRODUCTS/PRODUCT.MEAT.KIDNEY.DDS',
	FOOD_V_CRAB		= 'COOKINGPRODUCTS/PRODUCT.BONE.CRAB.DDS',
	FOOD_V_DIPLO	= 'COOKINGPRODUCTS/PRODUCT.EGG.GIANT.DDS',
	FOOD_V_ROBOT	= 'COOKINGPRODUCTS/PRODUCT.ROBOT.WIRE.DDS',
	FOOD_V_STRIDER	= 'COOKINGPRODUCTS/PRODUCT.EGG.TALL.DDS',
	FOOD_W_CASE		= 'COOKINGPRODUCTS/PRODUCT.MEAT.DDS',
	GEODE_CAVE		= 'U4PRODUCTS/PRODUCT.GEODECAVE.DDS',
	SHIPCHARGE		= 'U4PRODUCTS/PRODUCT.SHIPCHARGE.DDS'
}

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.Product Icons.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_DESCRIPTION		= mod_desc,
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN',
		EXML_CHANGE_TABLE	= (
			function()
				local T = {}
				for id, icon in pairs(prod_icons) do
					T[#T+1] = {
						SPECIAL_KEY_WORDS	= {'ID', id},
						PRECEDING_KEY_WORDS = 'Icon',
						VALUE_CHANGE_TABLE 	= {
							{'Filename', 'TEXTURES/UI/FRONTEND/ICONS/'..icon}
						}
					}
				end
				T[#T+1] = {
					SPECIAL_KEY_WORDS	= {
						{'ID', 'FOOD_M_HORROR'},
						{'ID', 'FOOD_R_HORROR'},
						{'ID', 'FOOD_M_GRUB'},
						{'ID', 'FOOD_V_BUG'},
						{'ID', 'FOOD_STEW_EVIL'}
					},
					PRECEDING_KEY_WORDS = 'Colour',
					INTEGER_TO_FLOAT	= 'Force',
					VALUE_CHANGE_TABLE 	= {
						{'R',	0.73333335},
						{'G',	0.21960784},
						{'B',	0.1882353}
					}
				}
				return T
			end
		)()
	}
}}},
	ADD_FILES	= (
		function()
			local T = {}
			local tex_path = 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Icons/'
			for _,folder in ipairs({
				'Products',
				'CookingProducts',
				'ShipIcons',
				'u4Products',
				'Update3'
			}) do
				if lfs.attributes(tex_path..folder) then
					T[#T+1] = {
						EXTERNAL_FILE_SOURCE = tex_path..folder..'/*.DDS',
						FILE_DESTINATION	 = 'TEXTURES/UI/FRONTEND/ICONS/'..folder..'/*.DDS',
					}
				end
			end
			return #T > 0 and T or nil
		end
	)()
}
