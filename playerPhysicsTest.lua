fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")
require("classPlatform")
require("classPlayer")
require("classPickup")
require("testLevel")

fizz.setGravity(0, gravity)

betterMaxVelocity = 200


playerPhysicsTest = {}

player = Player(100, 100, 16, 32)


function playerPhysicsTest:enter()
    camera = Camera(player.x, player.y)
end

function playerPhysicsTest:update(dt)
    local dx,dy = player.hitbox.x - camera.x, player.hitbox.y - camera.y --camera update stuff
    camera:move(dx/2, dy/2)
    
    fizz.update(dt)
    for i,v in pairs(movingPlatforms) do
      v:update()
    end
    for i,v in pairs(coins) do
      v:isColliding(player, dt)
    end
    if love.keyboard.isDown('right') then
        player.hitbox.xv = player.hitbox.xv + player.speed
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
    end
    if love.keyboard.isDown('left') then
        player.hitbox.xv = player.hitbox.xv - player.speed
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
    end


    function love.keypressed(key)
        if key == 'up' then
            if player.jumpCount ~= 0 then
                fizz.setVelocity(player.hitbox, player.hitbox.xv, player.jumpVelocity)
                player.jumpCount = player.jumpCount-1
            end
        elseif key == "down" then
          switch:toggle()
        end
    end

    if player.hitbox.xv > betterMaxVelocity then
        player.hitbox.xv = betterMaxVelocity
    elseif player.hitbox.xv < -betterMaxVelocity then
        player.hitbox.xv = -betterMaxVelocity
    end

    x, y = fizz.getVelocity(player.hitbox)
    if y == 0 then
        player.jumpCount = player.jumpMax
    end



end

function playerPhysicsTest:draw()
    camera:attach() --this MUST be at the beginning of draw() 

    love.graphics.print("Scrap: " ..tostring(inventory.wallet), -300+camera.x, -300+camera.y)
    switch:draw()
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
    camera:detach() --MUST be at the end of draw()
end