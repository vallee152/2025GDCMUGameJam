fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")

Pickup = Class {
    init = function(self, x, y, radius, amount)
        self.hitbox = Shapes.create.circle(x, y, radius)
        self.amount = amount
        self.collected = false
        self.animationSpeed = 1
        self.animationCount = 0
        self.animationSet = {[0] = love.graphics.newImage("Colours/scrap1.png"), [1] = love.graphics.newImage("Colours/scrap2.png")}
    end;
    payPlayer = function(self)
        return self.amount
    end;
    draw = function(self)
        if self.collected ~= true then
            self.animationCount = self.animationCount + (self.animationSpeed * 0.02)
            love.graphics.circle('fill', self.hitbox.x, self.hitbox.y, self.hitbox.r)
            love.graphics.draw(self.animationSet[math.fmod(math.floor(self.animationCount), 2)], self.hitbox.x - self.hitbox.r*3, self.hitbox.y  - self.hitbox.r*3, 0, 2, 2)
        end
    end;
    isColliding = function(self, player, time)
        if self.collected ~= true then
            _, _, pen = Shapes.test(player.hitbox, self.hitbox, time)
            if pen ~= nil then
                inventory.wallet = inventory.wallet + self:payPlayer()
                self.collected = true

            end
        end
    end
}