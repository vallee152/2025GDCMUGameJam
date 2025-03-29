fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")
fizz.setGravity(0, 600)

playerPhysicsTest = {}

player = fizz.addDynamic('rect', 300, 100, 16, 32)


Platform = Class {
    
    init = function(self, x, y, halfWidth, halfHeight)
        self.phys = fizz.addStatic('rect', x, y, halfWidth, halfHeight)
    end;
    draw = function(self)
        love.graphics.rectangle("fill", self.phys.x - self.phys.hw, self.phys.y - self.phys.hh, self.phys.hw*2, self.phys.hh*2)
    end;
}

Pickup = Class {
    init = function(self, x, y, radius, amount)
        self.hitbox = Shapes.create.circle(x, y, radius)
        self.amount = amount
    end;
    payPlayer = function(self, amount)
        return self.amount
    end;
}


wall1 = Platform(100, 400, 200, 10)
wall2 = Platform(600, 400, 200, 10)

function playerPhysicsTest:enter()
    camera = Camera(player.x, player.y)

    player.speed = 200
    player.jumpVelocity = -300
    player.animationSet = {}
    player.animationSet[0] = love.graphics.newImage('Colours/playerWalk1.png')
    player.animationSet[1] = love.graphics.newImage('Colours/playerWalk2.png')
    player.animationSet[2] = love.graphics.newImage('Colours/playerWalk3.png')
    player.animationSet[3] = love.graphics.newImage('Colours/playerWalk2.png')
    player.img = love.graphics.newImage('Colours/player.png')
    player.jumpMax = 1
    player.jumpCount = 1
    player.draw = function(flip)
        --love.graphics.rectangle("fill", player.x - player.hw, player.y - player.hh, player.hw*2, player.hh*2)
        love.graphics.draw(player.img, player.x-player.hw*player.animationFlip*4.35, player.y-player.hh*2, 0, player.animationFlip*1.75, 2)

    end
    player.animationSpeed = 5
    doubleJumpPowerup = Pickup(100, 370, 10, 5)
    player.animationCount = 0
    player.animationFlip = 0
    player.wallet = 0
end

function playerPhysicsTest:update(dt)
    local dx,dy = player.x - camera.x, player.y - camera.y --camera update stuff
    camera:move(dx/2, dy/2)
    
    fizz.update(dt)

    if love.keyboard.isDown('right') then
        player.x = player.x + (player.speed * dt)
        player.animationCount = player.animationCount + (player.animationSpeed*dt)
        player.animationFlip = 1
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount), 4)]
    elseif love.keyboard.isDown('left') then
        player.x = player.x - (player.speed * dt)
        player.animationCount = player.animationCount + (player.animationSpeed*dt)
        player.animationFlip = -1
        player.img = player.animationSet[math.fmod(math.floor(player.animationCount), 4)]
    end

    
    function love.keypressed(key)
        if key == 'up' then
            if player.jumpCount ~= 0 then
                fizz.setVelocity(player, 0, player.jumpVelocity)
                player.jumpCount = player.jumpCount-1
            end
        end
    end

    _, y = fizz.getVelocity(player)
    if y == 0 then
        player.jumpCount = player.jumpMax
    end

    if player.y >= 3000 then
        player.y = -1000
    end
    if doubleJumpPowerup ~= nil then 
        _, _, pen = Shapes.test(doubleJumpPowerup.hitbox, player, dt)

        if pen ~= nil then
            player.wallet = player.wallet + doubleJumpPowerup:payPlayer()
            fizz.removeShape(doubleJumpPowerup.hitbox)
        end
    end
    
end

function playerPhysicsTest:draw()
    love.graphics.print(tostring(player.wallet), 100, 100)
    camera:attach() --this MUST be at the beginning of draw() 
    player.draw(flip)
    wall1:draw()
    wall2:draw()
    camera:detach() --MUST be at the end of draw()
end