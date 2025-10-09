
NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '+  TEST 03 unlockables',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '6.06',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN',
		MXML_CHANGE_TABLE	= {
			{
				SKW			= {'WeapTech', 'GcUnlockableItemTrees', 'Title', 'UI_WEAP_TECH_TREE', 'Title', 'UI_TECH_TREE_SUB'},
				REMOVE		= 'Section',
			},
			{
				SKW			= {'WeapTech', 'GcUnlockableItemTrees', 'Title', 'UI_WEAP_TECH_TREE'},
				ADD_OPTION	= nil,
				PKW			= 'Trees',
				ADD			= [[
<Property value="GcUnlockableItemTree" name="Trees">
	<Property name="CostTypeID" value="NANITES"/>
	<Property value="GcUnlockableItemTreeNode" name="Root">
		<Property name="Children">
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_BOLTBOUNCE"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="BOLT_SM"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="UT_BOLT"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Unlockable" value="FLAME"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_STUNDMG"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="STUN_GREN"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="GRENADE"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="UT_RAIL_STUN"/>
					</Property>
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="UT_RAIL"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="RAILGUN"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="UT_SHOT"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="SHOTGUN"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_SMGBOUNCE"/>
							</Property>
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_SMG_DOT"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="UT_SMG"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="SMG"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="UT_CANNON"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="CANNON"/>
			</Property>
		</Property>
		<Property name="Unlockable" value="BOLT"/>
	</Property>
	<Property name="Title" value="UI_TECH_OFFENSE_SUB"/>
</Property>]]
			},
			{
				SKW			= {'WeapTech', 'GcUnlockableItemTrees', 'Title', 'UI_WEAP_TECH_TREE'},
				PKW			= 'Trees',
				ADD_OPTION	= 'AddEndSection',
				ADD			= [[
<Property value="GcUnlockableItemTree" name="Trees">
	<Property name="Title" value="UI_TECH_EXPLORE_SUB"/>
	<Property name="CostTypeID" value="NANITES"/>
	<Property value="GcUnlockableItemTreeNode" name="Root">
		<Property name="Children">
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="S15_FISHLASER"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="FISHLASER"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="TERRAIN_GREN"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="TERRAINEDITOR"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="SCOPE"/>
					</Property>
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Unlockable" value="STEALTH"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="GROUND_SHIELD"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_BUI_SCAN"/>
							</Property>
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_S10_SCAN"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="UT_SCAN"/>
					</Property>
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_SURVEY"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="SCANBINOC1"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="SCAN1"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="UT_MINER"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="STRONGLASER"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="LASER_XO"/>
			</Property>
			<Property value="GcUnlockableItemTreeNode" name="Children">
				<Property name="Children">
					<Property value="GcUnlockableItemTreeNode" name="Children">
						<Property name="Children">
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="SUN_LASER"/>
							</Property>
							<Property value="GcUnlockableItemTreeNode" name="Children">
								<Property name="Unlockable" value="SOUL_LASER"/>
							</Property>
						</Property>
						<Property name="Unlockable" value="ATLAS_LASER"/>
					</Property>
				</Property>
				<Property name="Unlockable" value="SENT_LASER"/>
			</Property>
		</Property>
		<Property name="Unlockable" value="LASER"/>
	</Property>
</Property>]]
			},
		}
	}
}}}}
