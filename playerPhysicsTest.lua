fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")
require("classPlatform")
require("classPlayer")
require("classPickup")


fizz.setGravity(0, 600)
require("testLevel")

playerPhysicsTest = {}


player = fizz.addDynamic('rect', 0, 100, 16, 32)

player = Player(100, 100, 16, 32)

coin = Pickup(50, 370, 10, 5)

player = Player(100, 100, 16, 32)

coin = Pickup(50, 370, 10, 5)

wall1 = Platform(100, 400, 200, 10)
wall2 = Platform(600, 400, 200, 10)
flyingBox = MovingPlatform(300, 350, 50, 10, 50, 0, 400)


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
        player.hitbox.x = player.hitbox.x + (player.speed * dt)
        player.animationFlip = 1
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount),2)]
    elseif love.keyboard.isDown('left') then
        player.hitbox.x = player.hitbox.x - (player.speed * dt)
        player.animationFlip = -1
        player.animationCount = player.animationCount + (player.animationSpeed * dt)
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount),2)]
    end


    function love.keypressed(key)
        if key == 'up' then
            if player.jumpCount ~= 0 then
                fizz.setVelocity(player.hitbox, 0, player.jumpVelocity)
                player.jumpCount = player.jumpCount-1
            end
        elseif key == "t" then
          flyingBox:toggle()
        end
    end

    x, y = fizz.getVelocity(player.hitbox)
    if y == 0 then
        player.jumpCount = player.jumpMax
    end

    if coin ~= nil then 
        _, _, pen = Shapes.test(coin.hitbox, player.hitbox, dt)

        if pen ~= nil then
            player.wallet = player.wallet + coin:payPlayer()
            coin = nil
        end
    end


end

function playerPhysicsTest:draw()
    camera:attach() --this MUST be at the beginning of draw() 

    
    player.draw()
    for i,v in pairs(platforms) do
      v:draw()
    end
    for i,v in pairs(movingPlatforms) do
      v:draw()
    end

    love.graphics.print(tostring(Shapes.bounds(player.hitbox)), 100, 200)
    if coin ~= nil then
        coin:draw()
    end
    player:draw()
    wall1:draw()
    wall2:draw()
    flyingBox:draw()
    
    camera:detach() --MUST be at the end of draw()
end