player = {}

player.x = 0
player.y = 0
player.speed = 64

player.collider = world:newBSGRectangleCollider(400, 250, 16, 24, 16)
player.collider:setFixedRotation(true)

player.sprite_sheet = love.graphics.newImage('sprites/player/eric.png')
player.grid = anim8.newGrid(24, 24, player.sprite_sheet:getWidth(), player.sprite_sheet:getHeight())

player.animations = {}
player.animations.right = anim8.newAnimation(player.grid('1-8', 1), 0.1)
player.animations.up = anim8.newAnimation(player.grid('1-8', 2), 0.1)
player.animations.left = anim8.newAnimation(player.grid('1-8', 3), 0.1)
player.animations.down = anim8.newAnimation(player.grid('1-8', 4), 0.1)

player.current_animation = player.animations.left

player.name = "Eric"

player.life = 15
player.mana = 0

player.attack = 35
player.defense = 19
player.magicAttack = 10
player.magicDefense = 10

player.vitality = 0
player.strength = 0
player.endurance = 0
player.dexterity = 0
player.agility = 10
player.luck = 15
player.intelligence = 0
player.resolution = 0

player.composure = player.vitality + player.endurance
player.wellness = player.strength + player.endurance
player.finesse = player.dexterity + player.agility
player.unknown = player.intelligence + player.resolution
player.evasion = player.agility + player.luck
player.cunning = player.agility + player.intelligence

player.money = 0

function player:update(dt)
    local isMoving = false
    local canMove = true
    local vx = 0
    local vy = 0

    if talkies.isOpen() then
        canMove = false
    end

    if love.keyboard.isDown("right") and canMove == true then
        vx = player.speed
        player.x = player.x + player.speed
        player.current_animation = player.animations.right
        isMoving = true
    end

    if love.keyboard.isDown("left") and canMove == true then
        vx = player.speed * -1
        player.current_animation = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("up") and canMove == true then
        vy = player.speed * -1
        player.current_animation = player.animations.up
        isMoving = true
    end

    if love.keyboard.isDown("down") and canMove == true then
        vy = player.speed
        player.current_animation = player.animations.down
        isMoving = true
    end

    player.collider:setLinearVelocity(vx, vy)

    if isMoving == false then
        player.current_animation:gotoFrame(4)
    end

    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.current_animation:update(dt)
end

function player:draw()
    player.current_animation:draw(player.sprite_sheet, player.x, player.y, nil, 1, nil, 12, 12)
end
