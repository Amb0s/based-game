map = sti("maps/dungeon_1_1.lua")

world = wf.newWorld(0, 0)
colliders = {}
if map.layers["colliders"] then
    for i, obj in pairs(map.layers["colliders"].objects) do
        local collider = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
        collider:setType('static')
        table.insert(colliders, collider)
    end
end

function drawMap()
    map:drawLayer(map.layers['base'])
    map:drawLayer(map.layers['entrances'])
end
