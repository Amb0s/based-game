function initGame()
    -- Randomness
    math.randomseed(os.time())

    -- Make pixels scale
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Window size
    setWindowSize(true, true, 1920, 1080)

    -- Scale
    setScale(true)

    -- Debug
    debug = true
end

function setWindowSize(fullscreen, width, heigh)
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

    if fullscreen then
        love.window.setFullscreen(fullscreen)

    else
        love.window.setMode(windowWidth, windowHeight)
    end
end

function setScale(vertical)
    scale = (8 / 1600) * windowHeight
end
