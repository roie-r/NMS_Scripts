--[[┎──────────────────────────────────────────────────────────
	┃ Add hazard protection to beacon and signal booster tech
────┸──────────────────────────────────────────────────────--]]
Protection_Radius = 8

Heater_Attachment = [[
	<Property value="TkSceneNodeData.xml">
		<Property name="Name" value="HeatedFloors"/>
		<Property name="NameHash" value="0"/>
		<Property name="Type" value="LOCATOR"/>
		<Property name="Transform" value="TkTransformData.xml">
			<Property name="TransX" value="0"/>
			<Property name="TransY" value="0"/>
			<Property name="TransZ" value="0"/>
			<Property name="RotX" value="0"/>
			<Property name="RotY" value="0"/>
			<Property name="RotZ" value="0"/>
			<Property name="ScaleX" value="1"/>
			<Property name="ScaleY" value="1"/>
			<Property name="ScaleZ" value="1"/>
		</Property>
		<Property name="Attributes">
			<Property value="TkSceneNodeAttributeData.xml">
				<Property name="Name" value="ATTACHMENT"/>
				<Property name="AltID" value=""/>
				<Property name="Value" value="MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\SPACEBASE\PROPS\STANDINGLIGHT_SMALL\ENTITIES\HEATER.ENTITY.MBIN"/>
			</Property>
		</Property>
		<Property name="Children">
			<Property value="TkSceneNodeData.xml">
				<Property name="Name" value="HeaterCollision"/>
				<Property name="NameHash" value="635332889"/>
				<Property name="Type" value="COLLISION"/>
				<Property name="Transform" value="TkTransformData.xml">
					<Property name="TransX" value="0"/>
					<Property name="TransY" value="0"/>
					<Property name="TransZ" value="0"/>
					<Property name="RotX" value="0"/>
					<Property name="RotY" value="0"/>
					<Property name="RotZ" value="0"/>
					<Property name="ScaleX" value="1"/>
					<Property name="ScaleY" value="1"/>
					<Property name="ScaleZ" value="1"/>
				</Property>
				<Property name="Attributes">
					<Property value="TkSceneNodeAttributeData.xml">
						<Property name="Name" value="TYPE"/>
						<Property name="AltID" value=""/>
						<Property name="Value" value="Sphere"/>
					</Property>
					<Property value="TkSceneNodeAttributeData.xml">
						<Property name="Name" value="RADIUS"/>
						<Property name="AltID" value=""/>
						<Property name="Value" value="]] .. Protection_Radius .. [["/>
					</Property>
				</Property>
				<Property name="Children"/>
			</Property>
		</Property>
	</Property>
]]

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__MODEL hazard protection with tech.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '3.35',
	MOD_BATCHNAME		= '_MODELS ~@~collection.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= {
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\TECH\SIGNALSCANNER.SCENE.MBIN',
			'MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\TECH\BEACON.SCENE.MBIN',
		},
		EXML_CHANGE_TABLE	= {
			{
				PRECEDING_KEY_WORDS	= 'Children',
				ADD 				= Heater_Attachment
			}
		}
	}
}}}}
