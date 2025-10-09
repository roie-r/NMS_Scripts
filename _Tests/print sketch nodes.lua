-------------------------------------------------
-- print sketch node CustomData ascii values
-------------------------------------------------

local sketch_nodes = [[
					<Property name="TkSketchComponentData">
				<Property name="GraphPosX" value="0.000000" />
				<Property name="GraphPosY" value="0.000000" />
				<Property name="GraphZoom" value="1.000000" />
				<Property name="UpdateRateMultiplier" value="1.000000" />
				<Property name="Nodes">
					<Property name="Nodes" value="TkSketchNodeData" _index="0">
						<Property name="TypeName" value="OnSpawned" />
						<Property name="TriggerType" value="RunParallel" />
						<Property name="SelectedVariant" value="0" />
						<Property name="PositionX" value="241" />
						<Property name="PositionY" value="196" />
						<Property name="Connections">
							<Property name="Connections" value="TkSketchNodeConnections" _index="0">
								<Property name="Connections">
									<Property name="Connections" value="2" _index="0" />
								</Property>
							</Property>
						</Property>
						<Property name="CustomData" />
					</Property>
					<Property name="Nodes" value="TkSketchNodeData" _index="1">
						<Property name="TypeName" value="SetLightColour" />
						<Property name="TriggerType" value="RunParallel" />
						<Property name="SelectedVariant" value="2" />
						<Property name="PositionX" value="1060" />
						<Property name="PositionY" value="175" />
						<Property name="Connections">
							<Property name="Connections" value="TkSketchNodeConnections" _index="0">
								<Property name="Connections" />
							</Property>
						</Property>
						<Property name="CustomData">
							<Property name="CustomData" value="84" _index="0" />
							<Property name="CustomData" value="101" _index="1" />
							<Property name="CustomData" value="114" _index="2" />
							<Property name="CustomData" value="109" _index="3" />
							<Property name="CustomData" value="105" _index="4" />
							<Property name="CustomData" value="110" _index="5" />
							<Property name="CustomData" value="97" _index="6" />
							<Property name="CustomData" value="108" _index="7" />
							<Property name="CustomData" value="80" _index="8" />
							<Property name="CustomData" value="111" _index="9" />
							<Property name="CustomData" value="105" _index="10" />
							<Property name="CustomData" value="110" _index="11" />
							<Property name="CustomData" value="116" _index="12" />
							<Property name="CustomData" value="0" _index="13" />
							<Property name="CustomData" value="0" _index="14" />
							<Property name="CustomData" value="0" _index="15" />
							<Property name="CustomData" value="0" _index="16" />
							<Property name="CustomData" value="0" _index="17" />
							<Property name="CustomData" value="0" _index="18" />
							<Property name="CustomData" value="0" _index="19" />
							<Property name="CustomData" value="0" _index="20" />
							<Property name="CustomData" value="0" _index="21" />
							<Property name="CustomData" value="0" _index="22" />
							<Property name="CustomData" value="0" _index="23" />
						</Property>
					</Property>
					<Property name="Nodes" value="TkSketchNodeData" _index="2">
						<Property name="TypeName" value="GetAmbientColour" />
						<Property name="TriggerType" value="RunParallel" />
						<Property name="SelectedVariant" value="0" />
						<Property name="PositionX" value="608" />
						<Property name="PositionY" value="133" />
						<Property name="Connections">
							<Property name="Connections" value="TkSketchNodeConnections" _index="0">
								<Property name="Connections">
									<Property name="Connections" value="1" _index="0" />
								</Property>
							</Property>
						</Property>
						<Property name="CustomData">
							<Property name="CustomData" value="62" _index="0" />
							<Property name="CustomData" value="0" _index="1" />
							<Property name="CustomData" value="0" _index="2" />
							<Property name="CustomData" value="0" _index="3" />
							<Property name="CustomData" value="1" _index="4" />
							<Property name="CustomData" value="0" _index="5" />
							<Property name="CustomData" value="0" _index="6" />
							<Property name="CustomData" value="0" _index="7" />
							<Property name="CustomData" value="0" _index="8" />
							<Property name="CustomData" value="0" _index="9" />
							<Property name="CustomData" value="0" _index="10" />
							<Property name="CustomData" value="0" _index="11" />
						</Property>
					</Property>
				</Property>
			</Property>
		</Property>
]]

for i, sec in sketch_nodes:gmatch('NodeData" _index="(%d-)".-name="CustomData"(.-)</Property') do
	local chrs = {}
	for c in sec:gmatch('value="(%d-)"') do
		chrs[#chrs+1] = string.char(c)
	end
	print(i..': '..table.concat(chrs)..'\n')
end
