fizz = require("lib.fizzx")
Class = require("lib.hump.class")
require("classPlatform")
fizz.setGravity(0, 600)

playerPhysicsTest = {}

player = fizz.addDynamic('rect', 300, 100, 16, 32)


wall1 = Platform(100, 400, 200, 10)
wall2 = Platform(600, 400, 200, 10)
flyingBox = MovingPlatform(300, 350, 50, 10, 50, 0, 400)

function playerPhysicsTest:enter()
    camera = Camera(player.x, player.y)

    player.speed = 200
    player.y_velocity = 0
    player.jump_velocity = -300
    player.img = love.graphics.newImage('Colours/player.png')
    player.jump_max = 1
    player.jump_count = 1
    player.draw = function()
        love.graphics.draw(player.img, player.x-player.hw*2, player.y-player.hh*2, 0, 1, 2)
    end
    count = 0
end

function playerPhysicsTest:update(dt)
    local dx,dy = player.x - camera.x, player.y - camera.y --camera update stuff
    camera:move(dx/2, dy/2)
    
    fizz.update(dt)
    flyingBox:update()

    if love.keyboard.isDown('right') then
        player.x = player.x + (player.speed * dt)
    elseif love.keyboard.isDown('left') then
        player.x = player.x - (player.speed * dt)
    end

    function love.keypressed(key, scancode, isrepeat)
        if key == 'up' then
            if player.jump_count ~= 0 then
                fizz.setVelocity(player, 0, player.jump_velocity)
                player.jump_count = player.jump_count-1
            end
        elseif key == "t" then
          flyingBox:toggle()
        end
    end
    x, y = fizz.getVelocity(player)
    if y == 0 then
        player.jump_count = player.jump_max
    end

    fizz.setGravity(0, 600+(0.01*player.y))
end

function playerPhysicsTest:draw()
    camera:attach() --this MUST be at the beginning of draw() 

    
    player.draw()
    wall1:draw()
    wall2:draw()
    flyingBox:draw()
    
    camera:detach() --MUST be at the end of draw()
end