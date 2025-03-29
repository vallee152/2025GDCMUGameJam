fizz = require("fizzx")
Class = require("lib/hump.class")
fizz.setGravity(0, 600)

ball = fizz.addDynamic('rect', 300, 100, 16, 16)
wall1 = fizz.addStatic('rect', 100, 400, 200, 10)
wall2 = fizz.addStatic('rect', 600, 400, 200, 10)


function love.load()
    ball.speed = 200
    ball.y_velocity = 0
    ball.jump_velocity = -300
    ball.img = love.graphics.newImage('purple.png')
    ball.jump_max = 1
    ball.jump_count = 1
    ball.draw = function()
        love.graphics.draw(ball.img, ball.x-ball.hw, ball.y-ball.hh)
        love.graphics.rectangle('line', ball.x - ball.hw, ball.y - ball.hh, ball.hw*2, ball.hh*2)
    end
    count = 0
end


function love.update(dt)
    fizz.update(dt)

    if love.keyboard.isDown('right') then
        ball.x = ball.x + (ball.speed * dt)
    elseif love.keyboard.isDown('left') then
        ball.x = ball.x - (ball.speed * dt)
    end

    function love.keypressed(key, scancode, isrepeat)
        if key == 'up' then
            if ball.jump_count ~= 0 then
                fizz.setVelocity(ball, 0, ball.jump_velocity)
                ball.jump_count = ball.jump_count-1
            end
        end
    end
    x, y = fizz.getVelocity(ball)
    if y == 0 then
        ball.jump_count = ball.jump_max
    end
end

function love.draw()
    love.graphics.print(tostring(ball.jump_count), 100, 100)
    ball.draw()
    love.graphics.rectangle("fill", wall1.x - wall1.hw, wall1.y - wall1.hh, wall1.hw*2, wall1.hh*2)
    love.graphics.rectangle("fill", wall2.x - wall2.hw, wall2.y - wall2.hh, wall2.hw*2, wall2.hh*2)
end