fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")
require("classPlatform")
require("classPlayer")
require("classPickup")

fizz.setGravity(0, 600)

betterMaxVelocity = 200

require("testLevel")

playerPhysicsTest = {}

player = Player(100, 100, 16, 32)

coin = Pickup(50, 370, 10, 5)


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
    if love.keyboard.isDown('right') then
        player.hitbox.xv = player.hitbox.xv + player.speed
        player.animationFlip = 1
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount),2)]
    elseif love.keyboard.isDown('left') then
        player.hitbox.xv = player.hitbox.xv - player.speed
        player.animationFlip = -1
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount),2)]
    end


    function love.keypressed(key)
        if key == 'up' then
            if player.jumpCount ~= 0 then
                fizz.setVelocity(player.hitbox, player.hitbox.xv, player.jumpVelocity)
                player.jumpCount = player.jumpCount-1
            end
        elseif key == "t" then
          flyingBox:toggle()
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

    coin:isColliding(player, dt)


end

function playerPhysicsTest:draw()
    camera:attach() --this MUST be at the beginning of draw() 

    love.graphics.print(tostring(player.wallet), -300+player.hitbox.x, -300+player.hitbox.y)
    player:draw()
    for i,v in pairs(platforms) do
      v:draw()
    end
    for i,v in pairs(movingPlatforms) do
      v:draw()
    end
    
    if coin ~= nil then
        coin:draw()
    end
    
    camera:detach() --MUST be at the end of draw()
end