Pickup = Class {
    init = function(self, x, y, radius, amount)
        self.hitbox = Shapes.create.circle(x, y, radius)
        self.amount = amount
    end;
    payPlayer = function(self, amount)
        return self.amount
    end;
}

    --[[checks collision and adds money
    if gearPickup ~= nil then 
        _, _, pen = Shapes.test(gearPickup.hitbox, player, dt)

        if pen ~= nil then
            player.wallet = player.wallet + gearPickup:payPlayer()
            gearPickup = nil
        end
    end]]