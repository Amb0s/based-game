cam = camera()
cam:zoomTo(scale)

function cam:update(dt)
    cam:lookAt(player.x, player.y)

    -- This section prevents the camera from viewing outside the background
    -- First, get width/height of the game window, divided by the game scale
    local w = love.graphics.getWidth() / scale
    local h = love.graphics.getHeight() / scale

    -- Get width/height of background
    local mapW = map.width * map.tilewidth
    local mapH = map.height * map.tileheight

    if cam.x < w / 2 then
        cam.x = w / 2
    end

    if cam.y < h / 2 then
        cam.y = h / 2
    end

    if cam.x > (mapW - w / 2) then
        cam.x = (mapW - w / 2)
    end

    if cam.y > (mapH - h / 2) then
        cam.y = (mapH - h / 2)
    end
end
