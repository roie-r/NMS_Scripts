--[[┎────────────────────────────────────────────────────────────
	┃ Add plant harvesting in given radius to lab-lamp base part
────┸────────────────────────────────────────────────────────--]]
-- BUILDLABLAMP (Lab Lamp)
-- OCTACABINET (Octa-Cabinet)
-- UI_HARVEST_ALL (text)

Collection_Radius = 22

Inetraction_Entity_EXML = '<?xml ' .. [[
	version="1.0" encoding="utf-8"?>
	<Data template="TkAttachmentData">
		<Property name="Components">
			<Property value="TkAnimationComponentData.xml">
				<Property name="Idle" value="TkAnimationData.xml">
					<Property name="Anim" value="" />
					<Property name="Filename" value="" />
					<Property name="AnimType" value="Loop" />
					<Property name="FrameStart" value="0" />
					<Property name="FrameEnd" value="0" />
					<Property name="StartNode" value="" />
					<Property name="ExtraStartNodes" />
					<Property name="Priority" value="0" />
					<Property name="LoopOffsetMin" value="0" />
					<Property name="LoopOffsetMax" value="0" />
					<Property name="Delay" value="0" />
					<Property name="Speed" value="1" />
					<Property name="ActionFrameStart" value="0" />
					<Property name="ActionFrame" value="-1" />
					<Property name="ControlCreatureSize" value="AllSizes" />
					<Property name="Additive" value="False" />
					<Property name="Mirrored" value="False" />
					<Property name="Active" value="True" />
					<Property name="AdditiveBaseAnim" value="" />
					<Property name="AdditiveBaseFrame" value="0" />
					<Property name="GameData" value="TkAnimationGameData.xml">
						<Property name="RootMotionEnabled" value="False" />
						<Property name="BlockPlayerMovement" value="False" />
						<Property name="BlockPlayerWeapon" value="Unblocked" />
					</Property>
				</Property>
				<Property name="Anims">
					<Property value="TkAnimationData.xml">
						<Property name="Anim" value="OFF" />
						<Property name="Filename" value="MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/ANIMS/BIOROOM/BLANK.ANIM.MBIN" />
						<Property name="AnimType" value="OneShot" />
						<Property name="FrameStart" value="0" />
						<Property name="FrameEnd" value="0" />
						<Property name="StartNode" value="" />
						<Property name="ExtraStartNodes" />
						<Property name="Priority" value="0" />
						<Property name="LoopOffsetMin" value="0" />
						<Property name="LoopOffsetMax" value="0" />
						<Property name="Delay" value="0" />
						<Property name="Speed" value="1" />
						<Property name="ActionFrameStart" value="0" />
						<Property name="ActionFrame" value="-1" />
						<Property name="ControlCreatureSize" value="AllSizes" />
						<Property name="Additive" value="False" />
						<Property name="Mirrored" value="False" />
						<Property name="Active" value="True" />
						<Property name="AdditiveBaseAnim" value="" />
						<Property name="AdditiveBaseFrame" value="0" />
						<Property name="GameData" value="TkAnimationGameData.xml">
							<Property name="RootMotionEnabled" value="False" />
							<Property name="BlockPlayerMovement" value="False" />
							<Property name="BlockPlayerWeapon" value="Unblocked" />
						</Property>
					</Property>
					<Property value="TkAnimationData.xml">
						<Property name="Anim" value="ON" />
						<Property name="Filename" value="MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/PARTS/BUILDABLEPARTS/ANIMS/BIOROOM/HARVESTALL.ANIM.MBIN" />
						<Property name="AnimType" value="OneShot" />
						<Property name="FrameStart" value="0" />
						<Property name="FrameEnd" value="0" />
						<Property name="StartNode" value="" />
						<Property name="ExtraStartNodes" />
						<Property name="Priority" value="0" />
						<Property name="LoopOffsetMin" value="0" />
						<Property name="LoopOffsetMax" value="0" />
						<Property name="Delay" value="0" />
						<Property name="Speed" value="1" />
						<Property name="ActionFrameStart" value="0" />
						<Property name="ActionFrame" value="-1" />
						<Property name="ControlCreatureSize" value="AllSizes" />
						<Property name="Additive" value="False" />
						<Property name="Mirrored" value="False" />
						<Property name="Active" value="True" />
						<Property name="AdditiveBaseAnim" value="" />
						<Property name="AdditiveBaseFrame" value="0" />
						<Property name="GameData" value="TkAnimationGameData.xml">
							<Property name="RootMotionEnabled" value="False" />
							<Property name="BlockPlayerMovement" value="False" />
							<Property name="BlockPlayerWeapon" value="Unblocked" />
						</Property>
					</Property>
				</Property>
				<Property name="Trees" />
				<Property name="NetSyncAnimation" value="False" />
				<Property name="JointLODOverrides" />
			</Property>
			<Property value="TkPhysicsComponentData.xml">
				<Property name="Data" value="TkPhysicsData.xml">
					<Property name="Mass" value="0" />
					<Property name="Friction" value="0.5" />
					<Property name="RollingFriction" value="0.2" />
					<Property name="AngularDamping" value="0.2" />
					<Property name="LinearDamping" value="0.1" />
					<Property name="Gravity" value="20" />
				</Property>
				<Property name="VolumeTriggerType" value="TkVolumeTriggerType.xml">
					<Property name="VolumeTriggerType" value="Open" />
				</Property>
				<Property name="SurfaceProperties" value="None" />
				<Property name="TriggerVolume" value="False" />
				<Property name="Climbable" value="False" />
				<Property name="Floor" value="False" />
				<Property name="IgnoreModelOwner" value="False" />
				<Property name="NoVehicleCollide" value="False" />
				<Property name="NoPlayerCollide" value="True" />
				<Property name="CameraInvisible" value="False" />
				<Property name="InvisibleForInteraction" value="False" />
				<Property name="AllowTeleporter" value="False" />
				<Property name="BlockTeleporter" value="False" />
				<Property name="DisableGravity" value="False" />
				<Property name="SpinOnCreate" value="0" />
			</Property>
			<Property value="GcSimpleInteractionComponentData.xml">
				<Property name="SimpleInteractionType" value="Interact" />
				<Property name="InteractDistance" value="0" />
				<Property name="Use2dInteractDistance" value="False" />
				<Property name="Id" value="" />
				<Property name="Rarity" value="GcRarity.xml">
					<Property name="Rarity" value="Common" />
				</Property>
				<Property name="Size" value="GcSizeIndicator.xml">
					<Property name="SizeIndicator" value="Medium" />
				</Property>
				<Property name="TriggerAction" value="HARVEST" />
				<Property name="TriggerActionOnPrepare" value="" />
				<Property name="TriggerActionToggle" value="" />
				<Property name="BroadcastTriggerAction" value="True" />
				<Property name="Delay" value="0" />
				<Property name="HideContents" value="True" />
				<Property name="InteractIsCrime" value="False" />
				<Property name="InteractFiendCrimeType" value="GcFiendCrime.xml">
					<Property name="FiendCrime" value="None" />
				</Property>
				<Property name="InteractCrimeLevel" value="0" />
				<Property name="ActivationCost" value="GcInteractionActivationCost.xml">
					<Property name="SubstanceId" value="" />
					<Property name="AltIds" />
					<Property name="Cost" value="0" />
					<Property name="Repeat" value="False" />
					<Property name="RequiredTech" value="" />
				</Property>
				<Property name="StatToTrack" value="GcStatsEnum.xml">
					<Property name="Stat" value="None" />
				</Property>
				<Property name="StartsBuried" value="False" />
				<Property name="MustBeVisibleToInteract" value="False" />
				<Property name="NeedsStorm" value="False" />
				<Property name="Name" value="UI_HARVEST_ALL" />
				<Property name="VRInteractMessage" value="" />
				<Property name="TerminalMessage" value="" />
				<Property name="ScanType" value="BINOC_INTERACTABLE" />
				<Property name="ScanData" value="" />
				<Property name="ScanIcon" value="GcDiscoveryTypes.xml">
					<Property name="DiscoveryType" value="Unknown" />
				</Property>
				<Property name="ActivateLocatorsFromRarity" value="False" />
				<Property name="RarityLocators">
					<Property value="NMSString0x10.xml">
						<Property name="Value" value="" />
					</Property>
					<Property value="NMSString0x10.xml">
						<Property name="Value" value="" />
					</Property>
					<Property value="NMSString0x10.xml">
						<Property name="Value" value="" />
					</Property>
				</Property>
				<Property name="BaseBuildingTriggerActions" />
				<Property name="RewardOverrideTable" />
				<Property name="PersistencyBufferOverride" />
				<Property name="UsePersonalPersistentBuffer" value="False" />
				<Property name="ReseedOnRewardSuccess" value="False" />
				<Property name="CanCollectInMech" value="False" />
			</Property>
			<Property value="GcTriggerActionComponentData.xml">
				<Property name="HideModel" value="False" />
				<Property name="StartInactive" value="False" />
				<Property name="States">
					<Property value="GcActionTriggerState.xml">
						<Property name="StateID" value="BOOT" />
						<Property name="Triggers">
							<Property value="GcActionTrigger.xml">
								<Property name="Trigger" value="GcStateTimeEvent.xml">
									<Property name="Seconds" value="0" />
									<Property name="RandomSeconds" value="0" />
								</Property>
								<Property name="Action">
									<Property value="GcPlayAnimAction.xml">
										<Property name="Anim" value="OFF" />
									</Property>
								</Property>
							</Property>
						</Property>
					</Property>
					<Property value="GcActionTriggerState.xml">
						<Property name="StateID" value="HARVEST" />
						<Property name="Triggers">
							<Property value="GcActionTrigger.xml">
								<Property name="Trigger" value="GcStateTimeEvent.xml">
									<Property name="Seconds" value="0" />
									<Property name="RandomSeconds" value="0" />
								</Property>
								<Property name="Action">
									<Property value="GcHarvestPlantAction.xml">
										<Property name="Radius" value="]] .. Collection_Radius .. [[" />
									</Property>
									<Property value="GcPlayAnimAction.xml">
										<Property name="Anim" value="ON" />
									</Property>
								</Property>
							</Property>
							<Property value="GcActionTrigger.xml">
								<Property name="Trigger" value="GcStateTimeEvent.xml">
									<Property name="Seconds" value="5" />
									<Property name="RandomSeconds" value="0" />
								</Property>
								<Property name="Action">
									<Property value="GcGoToStateAction.xml">
										<Property name="State" value="BOOT" />
										<Property name="Broadcast" value="False" />
										<Property name="BroadcastLevel" value="Scene" />
									</Property>
								</Property>
							</Property>
						</Property>
					</Property>
				</Property>
				<Property name="Persistent" value="False" />
				<Property name="PersistentState" value="" />
				<Property name="ResetShotTimeOnStateChange" value="False" />
				<Property name="LinkStateToBaseGrid" value="False" />
			</Property>
		</Property>
		<Property name="LodDistances">
			<Property value="0" />
			<Property value="50" />
			<Property value="80" />
			<Property value="150" />
			<Property value="500" />
		</Property>
	</Data>
]]

Object_Interaction = [[
	<Property value="TkSceneNodeData.xml">
		<Property name="Name" value="Interaction" />
		<Property name="NameHash" value="2476508076" />
		<Property name="Type" value="LOCATOR" />
		<Property name="Transform" value="TkTransformData.xml">
			<Property name="TransX" value="0" />
			<Property name="TransY" value="1" />
			<Property name="TransZ" value="0" />
			<Property name="RotX" value="0" />
			<Property name="RotY" value="0" />
			<Property name="RotZ" value="0" />
			<Property name="ScaleX" value="1" />
			<Property name="ScaleY" value="1" />
			<Property name="ScaleZ" value="1" />
		</Property>
		<Property name="Attributes">
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="ATTACHMENT" />
				<Property name="AltID" value="" />
				<Property name="Value" value="MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\DECORATION\LABLAMP\INTERACTION.ENTITY.MBIN" />
			</Property>
		</Property>
		<Property name="Children">
			<Property value="TkSceneNodeData.xml">
				<Property name="Name" value="MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\DECORATION\LABLAMP" />
				<Property name="NameHash" value="2419627813" />
				<Property name="Type" value="COLLISION" />
				<Property name="Transform" value="TkTransformData.xml">
					<Property name="TransX" value="0" />
					<Property name="TransY" value="0" />
					<Property name="TransZ" value="0" />
					<Property name="RotX" value="0" />
					<Property name="RotY" value="0" />
					<Property name="RotZ" value="0" />
					<Property name="ScaleX" value="1" />
					<Property name="ScaleY" value="1" />
					<Property name="ScaleZ" value="1" />
				</Property>
				<Property name="Attributes">
					<Property value="TkSceneNodeAttributeData.xml">
						<Property name="Name" value="TYPE" />
						<Property name="AltID" value="" />
						<Property name="Value" value="Sphere" />
					</Property>
					<Property value="TkSceneNodeAttributeData.xml">
						<Property name="Name" value="RADIUS" />
						<Property name="AltID" value="" />
						<Property name="Value" value="1.0" />
					</Property>
				</Property>
				<Property name="Children" />
			</Property>
			<Property value="TkSceneNodeData.xml">
				<Property name="Name" value="INTERACT" />
				<Property name="NameHash" value="3698755080" />
				<Property name="Type" value="LOCATOR" />
				<Property name="Transform" value="TkTransformData.xml">
					<Property name="TransX" value="0" />
					<Property name="TransY" value="0" />
					<Property name="TransZ" value="0" />
					<Property name="RotX" value="0" />
					<Property name="RotY" value="0" />
					<Property name="RotZ" value="0" />
					<Property name="ScaleX" value="1" />
					<Property name="ScaleY" value="1" />
					<Property name="ScaleZ" value="1" />
				</Property>
				<Property name="Attributes" />
				<Property name="Children" />
			</Property>
		</Property>
	</Property>
]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '___TEST 13 add base plant harvester.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.37',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\DECORATION\LABLAMP.SCENE.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= Object_Interaction
			}
		}
	}
}}},
	ADD_FILES	= {
		{
			FILE_DESTINATION = 'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\DECORATION\LABLAMP\INTERACTION.ENTITY.EXML',
			FILE_CONTENT	 = Inetraction_Entity_EXML
		}
	}
}
