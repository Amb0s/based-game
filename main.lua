function love.load()
    -- Libraries
    anim8 = require("src/libraries/anim8/anim8")
    sti = require("src/libraries/sti")
    wf = require("src/libraries/windfield")
    camera = require("src/libraries/hump/camera")
    talkies = require("src/libraries/talkies/talkies")

    -- Initialization
    require("src/init")
    initGame()

    -- Helpers
    require("src/utils")

    -- Messageboxes
    require("src/messageboxes")

    -- World
    require("src/world")

    -- Camera
    require("src/camera")

    -- Player
    require("src/player")

    -- NPCs
    require("src/npc")
    spawnNPCs()

    -- Chests
    require("src/chest")
    createChests()

    -- Resources
    require("src/sounds")
end

function love.update(dt)
    player:update(dt)
    npcs:update(dt)
    chests:update(dt)
    world:update(dt)
    cam:update(dt)
    messageboxes:update(dt)
end

function love.draw()
    cam:attach()

    drawMap()

    -- Merge object tables and sort them.
    objects = {unpack(npcs), unpack(chests)}
    table.sort(objects, function(a, b) return a.y < b.y end)

    local isDrawn = false

    for i,_ in ipairs(objects) do
        if not isDrawn and objects[i].y > player.y then
            player:draw()
            isDrawn = true
        end
        chests:draw()
        npcs:draw()
    end

    -- If the player is below all objects, they won't be drawn within the for loop.
    if not isDrawn then
        player:draw()
    end

    -- Foreground objects go here...
    -- (nothing at the moment)

    if debug then
        world:draw()
    end

    cam:detach()

    messageboxes:draw()

    drawHUD()
end

function love.keypressed(key)
    if key == "space" then talkies.onAction()
    elseif key == "c" then talkies.clearMessages()
    elseif key == "escape" then love.event.quit()
    end
end
