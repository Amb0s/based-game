npcs = {}

function spawnNPC(name, messages, sprites, portrait, x, y)
    local npc = {}

    npc.name = name
    npc.messages = messages
    npc.speed = 64

    npc.x = x
    npc.y = y

    npc.sprites = love.graphics.newImage(sprites)
    npc.grid = anim8.newGrid(24, 24, npc.sprites:getWidth(), npc.sprites:getHeight())

    npc.portrait = love.graphics.newImage(portrait)

    npc.height = 24
    npc.width = 24

    npc.animations = {}
    npc.animations.right = anim8.newAnimation(npc.grid('1-8', 1), 0.1)
    npc.animations.up = anim8.newAnimation(npc.grid('1-8', 2), 0.1)
    npc.animations.left = anim8.newAnimation(npc.grid('1-8', 3), 0.1)
    npc.animations.down = anim8.newAnimation(npc.grid('1-8', 4), 0.1)

    npc.animation = npc.animations.right

    function npc:draw()
        self.animation:draw(self.sprites, self.x, self.y, nil, 1, nil, 12, 12)
    end

    function npc:interact()
        createMessageBox(npc.name, npc.messages, npc.portrait)
    end

    function npc:update(dt)
        if distanceBetween(self.x + self.width / 2, self.y + self.height / 2, player.x, player.y) < 17 then
            self:interact()
        end
    end

    table.insert(npcs, npc)
end

function spawnNPCs()
    spawnNPC("Natalie", {'Hello', 'Who are you?'}, 'sprites/npc/' .. string.lower("Natalie") .. '.png', 'sprites/portraits/' .. string.lower("Natalie") .. '.png', 400, 290)
end

function npcs:update(dt)
    for _, n in ipairs(npcs) do
        n:update(dt)
    end
end

function npcs:draw()
    for _, n in ipairs(npcs) do
        n:draw()
    end
end
