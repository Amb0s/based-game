chests = {}

function createChest(x, y, id)
    local chest = {}

    chest.state = 0
    chest.x = x
    chest.y = y
    chest.id = id
    chest.state = 0

    chest.width = 16
    chest.height = 16

    chest.centerX = chest.x + 8
    chest.centerY = chest.y + 8

    function chest:interact()
        if self.state == 0 then
            self.state = 1
        end
    end

    function chest:update(dt)
        if distanceBetween(self.x + self.width / 2, self.y + self.height / 2, player.x, player.y) < 24 then
            self:interact()
        end
    end

    table.insert(chests, chest)
end

function createChests()
    createChest(350, 290, 1)
end

function chests:update(dt)
    for _,c in ipairs(chests) do
        c:update(dt)
    end
end

function chests:draw()
    love.graphics.setColor(1, 1, 1, 1)
    for _,c in ipairs(chests) do
        if c.state == 0 then
            love.graphics.draw(love.graphics.newImage('sprites/misc/chest_closed.png'), c.x, c.y)
        elseif c.state == 1 then
            love.graphics.draw(love.graphics.newImage('sprites/misc/chest_open.png'), c.x, c.y)
        end
    end
end
