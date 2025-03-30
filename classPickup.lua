fizz = require("lib.fizzx")
Shapes = require("lib.fizzx.shapes")
Class = require("lib.hump.class")

Pickup = Class {
    init = function(self, x, y, radius, amount)
        self.hitbox = Shapes.create.circle(x, y, radius)
        self.amount = amount
    end;
    payPlayer = function(self, amount)
        return self.amount
    end;
    draw = function(self)
        love.graphics.circle('fill', self.hitbox.x, self.hitbox.y, self.hitbox.r)
    end
}

    --[[checks collision and adds money
    if gearPickup ~= nil then 
        _, _, pen = Shapes.test(gearPickup.hitbox, player.hitbox, dt)

        if pen ~= nil then
            player.wallet = player.wallet + gearPickup:payPlayer()
            gearPickup = nil
        end
    end]]

    --[[draw requires this extra bit
    if gearPickup ~= nil then
        gearPickup:draw()
    end
    ]]