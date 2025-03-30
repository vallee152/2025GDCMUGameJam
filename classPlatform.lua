fizz = require("lib.fizzx")
Class = require("lib.hump.class")
Signal = require("lib.hump.signal")

Platform = Class {
    
    init = function(self, x, y, halfWidth, halfHeight)
        self.phys = fizz.addStatic('rect', x, y, halfWidth, halfHeight)
    end;
    draw = function(self)
        love.graphics.rectangle("fill", self.phys.x - self.phys.hw, self.phys.y - self.phys.hh, self.phys.hw*2, self.phys.hh*2)
    end;
}

MovingPlatform = Class{
    init = function(self, x, y, halfWidth, halfHeight, xVel, yVel, traverse)
      xOg = x
      yOg = y
      xVelOg = xVel
      yVelOg = yVel
      xTrav = traverse
      reversed = false
      
      self.phys = fizz.addKinematic('rect', x, y, halfWidth, halfHeight)
      fizz.setVelocity(self.phys, xVel, yVel)
      Signal.register("power", function()
          self:toggle()
      end)
    end;
    
    draw = function(self)
      love.graphics.rectangle("fill", self.phys.x - self.phys.hw, self.phys.y - self.phys.hh, self.phys.hw*2, self.phys.hh*2)
    end;
    
    
    toggle = function(self)
        if fizz.getVelocity(self.phys) == 0 then
          if reversed == false then
            fizz.setVelocity(self.phys, xVelOg, yVelOg)
          else
            fizz.setVelocity(self.phys, -1*xVelOg, -1*yVelOg)
          end
        else
          fizz.setVelocity(self.phys, 0, 0)
        end
      end;
    
    update = function(self)
      if (self.phys.x - xOg) > xTrav or self.phys.x < xOg then
          reversed = not reversed
          if reversed == false then
            fizz.setVelocity(self.phys, xVelOg, yVelOg)
          else
            fizz.setVelocity(self.phys, -1*xVelOg, -1*yVelOg)
          end
      end
    end;
    
}

Switch = Class{
    init = function(self, x, y, state)
      self.hitbox = Shapes.create.rect(x, y, 32, 32)
      self.on = state
    end;
    
    draw = function(self)
      if self.on then
        love.graphics.rectangle("fill", self.hitbox.x - 16, self.hitbox.y - 16, 64, 64)
      else
        love.graphics.rectangle("line", self.hitbox.x - 16, self.hitbox.y - 16, 64, 64)
      end
    end;
    
    toggle = function(self)
      _, _, pen = Shapes.test(player.hitbox, self.hitbox, time)
      if pen ~= nil then
        self.on = not self.on
          Signal.emit("power")
      end
    end;
      
}