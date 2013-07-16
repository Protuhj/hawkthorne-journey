-- Items are objects that the player is capable of keeping in their inventory
-- Tracking IDs is most useful when in context of savegames.
-- Format:
-- <ID> = <location>
-- Where <location> is the location to the item that lua expects when using the 'require' call
-- When adding a new item, be sure you do NOT re-use IDs
-- If you retire an item from the game, do NOT adjust IDs, these IDs should be unique to a single item!
return {
    -- consumables
    item_1 = 'items/consumables/baggle',
    item_2 = 'items/consumables/healthpotion',
    item_3 = 'items/consumables/superhealthpotion',
    item_4 = 'items/consumables/tacomeat',
    item_5 = 'items/consumables/watermelon',
    -- materials
    item_6 = 'items/materials/blade',
    item_7 = 'items/materials/bone',
    item_8 = 'items/materials/boulder',
    item_9 = 'items/materials/crystal',
    item_10 = 'items/materials/ember',
    item_11 = 'items/materials/fire',
    item_12 = 'items/materials/leaf',
    item_13 = 'items/materials/lost',
    item_14 = 'items/materials/rock',
    item_15 = 'items/materials/stick',
    item_16 = 'items/materials/stone',
    -- misc
    item_17 = 'items/misc/lightning',
    -- weapons
    item_18 = 'items/weapons/arrow',
    item_19 = 'items/weapons/battleaxe',
    item_20 = 'items/weapons/boneclub',
    item_21 = 'items/weapons/bow',
    item_22 = 'items/weapons/club',
    item_23 = 'items/weapons/crimson sword',
    item_24 = 'items/weapons/icicle',
    item_25 = 'items/weapons/longsword',
    item_26 = 'items/weapons/mace',
    item_27 = 'items/weapons/mallet',
    item_28 = 'items/weapons/sword',
    item_29 = 'items/weapons/throwingaxe',
    item_30 = 'items/weapons/throwingknife',
    item_31 = 'items/weapons/torch'

    --keys
    item_32 = 'items'
}