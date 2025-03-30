fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")
require("classPlatform")
require("classPlayer")
require("classPickup")
require("testLevel")

fizz.setGravity(0, gravity)

require("testLevel")


playerPhysicsTest = {}

player = Player(100, 100, 16, 32)


function playerPhysicsTest:enter()
    camera = Camera(player.x, player.y)
end

function playerPhysicsTest:update(dt)
    time = dt
    if timeControl then
        time = time/player.timeControlStrength
    end

    local dx,dy = player.hitbox.x - camera.x, player.hitbox.y - camera.y --camera update stuff
    camera:move(dx/2, dy/2)
    
    fizz.update(time)
    for i,v in pairs(movingPlatforms) do
      v:update()
    end
    for i,v in pairs(coins) do
      v:isColliding(player, dt)
    end
    for i,v in pairs(portals) do
      v:update(dt)
      if v.exited then
        return Gamestate.push(levelComplete)
      end
    end
    
    if love.keyboard.isDown('right') then
        player.hitbox.xv = player.hitbox.xv + player.speed
        player.animationCount = player.animationCount + (player.animationSpeed * time)
    end
    if love.keyboard.isDown('left') then
        player.hitbox.xv = player.hitbox.xv - player.speed
        player.animationCount = player.animationCount + (player.animationSpeed * time)
    end


    function love.keypressed(key)
        if key == "up" then
            if player.jumpCount ~= 0 then
                player.hitbox.yv = player.hitbox.yv + player.jumpVelocity
                player.jumpCount = player.jumpCount-1
            end
        elseif key == "down" then
          switch:toggle()
        elseif key == "lshift" or key == "rshift" then
            player.maxVelocity = 400
            player.speed = 14
        elseif key == "q" then
            timeControl = not timeControl
        end
    end
    function love.keyreleased(key)
        if key == "lshift" or key == "rshift" then
            player.maxVelocity = 200
            player.speed = 7
        end
    end

    if player.hitbox.xv > player.maxVelocity then
        player.hitbox.xv = player.maxVelocity
    elseif player.hitbox.xv < -player.maxVelocity then
        player.hitbox.xv = -player.maxVelocity
    end

    if player.hitbox.yv == previousYV then
        player.jumpCount = player.jumpMax
        previousYV = 0
    elseif player.hitbox.yv == 0 then
        player.jumpCount = player.jumpMax
        previousYV = 0
    else
        previousYV = player.hitbox.yv
    end



end

function playerPhysicsTest:draw()
    camera:attach() --this MUST be at the beginning of draw() 

    love.graphics.print("Scrap: " ..tostring(inventory.wallet), -300+camera.x, -300+camera.y)
    switch:draw()
    for i,v in pairs(portals) do
      v:draw()
    end
    player:draw()
    for i,v in pairs(platforms) do
      v:draw()
    end
    for i,v in pairs(movingPlatforms) do
      v:draw()
    end
    for i,v in pairs(coins) do
      v:draw()
    end
    switch:draw()
    camera:detach() --MUST be at the end of draw()
end