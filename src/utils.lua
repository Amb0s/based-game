function drawHUD()
    love.graphics.scale(2)
    font = love.graphics.newImageFont("fonts/imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"") -- bad performance!
    love.graphics.setFont(font)

    if debug then
        love.graphics.print(player.money, 4, 4)
        love.graphics.print(player.x, 4, 20)
        love.graphics.print(player.y, 4, 36)
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
