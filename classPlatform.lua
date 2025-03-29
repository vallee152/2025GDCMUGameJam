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
    init = function(self, x, y, halfWidth, halfHeight, xDist, yDist, xVel, yVel)
      local xOg = x
      local yOg = y
      local xLimit = x + xDist
      local yLimit = y + yDist
      local xVelOg = xVel
      local yVelOg = yVel
      local reversed = false
      
      self.phys = fizz.addKinematic('rect', x, y, halfWidth, halfHeight)
      fizz.setVelocity(self.phys, xVel, yVel)
    end;
    
    draw = function(self)
      love.graphics.rectangle("fill", self.phys.x - self.phys.hw, self.phys.y - self.phys.hh, self.phys.hw*2, self.phys.hh*2)
    end;
}