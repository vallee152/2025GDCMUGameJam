fizz = require("lib.fizzx")
Class = require("lib.hump.class")

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