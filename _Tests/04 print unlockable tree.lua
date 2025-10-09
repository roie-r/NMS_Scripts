-----------------------------------------------------------------------------------------
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_lua_2_mxml.lua')
dofile('D:/MODZ_stuff/NoMansSky/AMUMss_Scripts/LIB/_mxml_2_lua.lua')
-----------------------------------------------------------------------------------------

local tree01 = {--	multitool: (replace tree) offensive
	root	= 'WeapTech',
	parent	= 'UI_WEAP_TECH_TREE',
	rmtree	= 'UI_TECH_TREE_SUB',
	title   = 'UI_TECH_OFFENSE_SUB',
	cost	= 'NANITES',
	tree	= {
		'BOLT',{ -- boltcaster
			{
				'UT_BOLT',{ -- barrel ioniser
					{
						'BOLT_SM',{ -- boltcaster sm
							{
								'UT_BOLTBOUNCE' -- boltcaster ricochet module
							}
						}
					}
				}
			},
			{
				'FLAME' -- incinerator
			},
			{
				'GRENADE',{ -- plasma launcher
					{
						'STUN_GREN',{ -- paralysis mortar
							{
								'UT_STUNDMG' -- voltaic amplifier
							}
						}
					}
				}
			},
			{
				'RAILGUN',{ -- blaze javelin
					{
						'UT_RAIL_STUN' -- waveform oscillator
					},
					{
						'UT_RAIL' -- mass accelerator
					}
				}
			},
			{
				'SHOTGUN',{ -- scatter blaster
					{
						'UT_SHOT' -- shell greaser
					}
				}
			},
			{
				'SMG',{ -- pulse spitter
					{
						'UT_SMG',{ -- amplified cartridges
							{
								'UT_SMGBOUNCE' -- pulse spitter ricochet module
							},
							{
								'UT_SMG_DOT' -- impact igniter
							}
						}
					}
				}
			},
			{
				'CANNON',{ -- neutron cannon
					{
						'UT_CANNON' -- p-field compressor
					}
				}
			}
		}
	}
}

-- add the meta for a proper e2l UnlockableItemTree
local function BuildTree(node)
	local function traverse(tree)
		local T = {
			meta = {name='Children', value='GcUnlockableItemTreeNode'},
			Unlockable = tree[1]
		}
		if tree[2] then
			T.Children = { meta = {name='Children'} }
			for _,t in ipairs(tree[2]) do
				T.Children[#T.Children+1] = traverse(t)
			end
		end
		return T
	end
	local e2l = traverse(node.tree)
	if node.cost then e2l.meta.name = 'Root' end
	return e2l
end

local tree_root = {
	meta	= {name='Trees', value='GcUnlockableItemTree'},
	Title		= tree01.title,
	CostTypeID	= tree01.cost,
	Root		= BuildTree(tree01)
}

print(ToMxml(tree_root))
