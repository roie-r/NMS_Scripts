dofile('LIB/_lua_2_mxml.lua')

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME		= '+ TEST 07 action open any dialog',
	MOD_AUTHOR			= 'lMonk',
	AMUMSS_SUPPRESS_MSG	= 'MIXED_TABLE',
	MODIFICATIONS		= nil,
	ADD_FILES			= {
		{
			FILE_DESTINATION = 'MODELS/PLANETS/BIOMES/COMMON/BUILDINGS/SENTINELHIVE/SENTINELHIVE_DOWN.ENTITY.MXML',
			FILE_CONTENT	 = ToMxmlFile(
				{
					meta = {template='cTkAttachmentData'},
					Components = {
						meta = {name='Components'},
						{
							meta = {name='Components', value='GcSimpleInteractionComponentData'},
							GcSimpleInteractionComponentData = {
								meta = {name='GcSimpleInteractionComponentData'},
								Name = 'UI_SENTINEL_HIVE_SETUP_OPT2'
							}
						},
						{
							meta = {name='Components', value='GcInteractionComponentData'},
							GcInteractionComponentData = {
								meta = {name='GcInteractionComponentData'},
								InteractionAction = 'PressButton',
								InteractionType = {
									meta = {name='InteractionType', value='GcInteractionType'},
									InteractionType = 'StoryUtility'
								},
								AttractDistanceSq = 9,
								InteractAngle = 360,
								InteractDistance = 5,
								PuzzleMissionOverrideTable = {
									meta = {name='PuzzleMissionOverrideTable'},
									{
										meta = {name='PuzzleMissionOverrideTable', value='GcAlienPuzzleMissionOverride'},
										Mission = 'EXPLORE_LOG',
										Puzzle = '?COMM4_GLITCHBOX' --  dialog id
									}
								}
							}
						},
						{
							meta = {name='Components', value='TkPhysicsComponentData'}
						}
					}
				}
			)
		}
	}
}
