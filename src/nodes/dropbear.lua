local anim8 = require 'vendor/anim8'
local sound = require 'vendor/TEsound'
local gamestate = require 'vendor/gamestate'
local enemy = require 'nodes/enemy'

local DropBear = {}
DropBear.__index = DropBear

-- This file represents the DropBear before it has dropped
-- In order to create a proper DropBear, set the node type in the tmx file to 'dropbear' instead of 'enemy'
function DropBear.new( node, collider )
    local dropbear = {}
    setmetatable(dropbear, DropBear)

    dropbear.node = node
    dropbear.collider = collider
    dropbear.width = 48
    dropbear.height = 48
    -- Flag to track whether or not the DropBear has dropped out of the tree or not
    dropbear.dropped = false
    dropbear.dropspeed = 30

    return dropbear
end

-- Node entrance function
function DropBear:enter()
    -- Determine the floor's location
    local x = self.node.x
    local y = self.node.y + self.height

    -- Set the closestFloor location to be sufficiently large
    local closestFloor = 1000000
    local found = false

    -- Iterate over the platforms and blocks to determine the best candidate
    -- If the platform/block's x + width falls in range of the target x AND
    -- the platform/block's y is below the target y AND
    -- the platform/block's y is closer to the target y
    -- v.x <= x weeds out all platforms/blocks that are way to the right
    if gamestate.currentState().map.objectgroups.platform then
        for k,v in pairs(gamestate.currentState().map.objectgroups.platform.objects) do
            if (v.x <= x and v.x + v.width >= x and v.y > y and v.y < closestFloor) then
                found = true
                closestFloor = v.y
            end
        end
    end
    -- Iterate over the blocks to determine the best candidate
    if gamestate.currentState().map.objectgroups.block then
        for k,v in pairs(gamestate.currentState().map.objectgroups.block.objects) do
            if (v.x <= x and v.x + v.width >= x and v.y > y and v.y < closestFloor) then
                found = true
                closestFloor = v.y
            end
        end
    end
    if not found then
        print ( "Warning: no floor found for node: " .. self.node.type .. " at (" .. self.node.x .. "," .. self.node.y .. ")" )
    end
    self.node.floor = closestFloor - self.height
end

function DropBear:update(dt, player)
    if not self.dropped then
        -- Determine if the bear should drop out of the tree
        local playerdistance = math.abs(player.position.x - self.node.x) - (self.width / 2) - (player.bbox_width / 2)
        if playerdistance <= 5 then
            -- TODO: Need a 'roar' sound
            sound.playSfx( 'hippy_enter' )

            local level = gamestate.currentState()
            local node = enemy.new( self.node, self.collider, 'dropbear' )
            node.props.dropspeed = self.dropspeed
            level:addNode(node)
            self.dropbear = node

            self.dropbear.position = {x=self.node.x + 12, y=self.node.y}
            self.dropbear.velocity.y = self.dropspeed
            -- Ensure the dropping animation is used
            self.dropbear.state = 'dropping'
            self.dropped = true
        end
    end
end

-- If the bear hasn't dropped yet, short-circuit the drawing process
function DropBear:draw()
    if not self.dropped then
        return
    end
end

return DropBear
