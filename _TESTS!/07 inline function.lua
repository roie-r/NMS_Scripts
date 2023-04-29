
function BoostLimit(_,currentValue)
	currentValue = tonumber(currentValue)
	return currentValue >= 400 and currentValue * 0.8 or currentValue
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '__GC SPACESHIP.pak',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE	= 'GCSPACESHIPGLOBALS.GLOBAL.MBIN',
		EXML_CHANGE_TABLE	= {
			{
				REPLACE_TYPE 		= 'All',
				INTEGER_TO_FLOAT	= 'Force',
				VALUE_CHANGE_TABLE 	= {
					{'BoostThrustForce', 'BoostLimit()'}
				}
			}
		}
	}
}}}}
