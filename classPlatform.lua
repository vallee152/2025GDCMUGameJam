fizz = require("lib.fizzx")
Class = require("lib.hump.class")
Signal = require("lib.hump.signal")
require("levelComplete")

Platform = Class {
    
    init = function(self, x, y, halfWidth, halfHeight)
        self.phys = fizz.addStatic('rect', x, y, halfWidth, halfHeight)
    end;
    draw = function(self)
        love.graphics.rectangle("fill", self.phys.x - self.phys.hw, self.phys.y - self.phys.hh, self.phys.hw*2, self.phys.hh*2)
    end;
}

MovingPlatform = Class{
    init = function(self, x, y, halfWidth, halfHeight, xVel, yVel, xFinal, yFinal)
      self.xOg = x
      self.yOg = y
      self.xVelOg = xVel
      self.yVelOg = yVel
      self.xFinal = xFinal
      self.yFinal = yFinal
      self.xDir = self.xOg / math.abs(self.xOg)
      self.yDir = self.yOg / math.abs(self.yOg)
      self.off = false
      self.reversed = false
      
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
        if self.off == true then
          if self.reversed == false then
            fizz.setVelocity(self.phys, self.xVelOg, self.yVelOg)
          else
            fizz.setVelocity(self.phys, -1*self.xVelOg, -1*self.yVelOg)
          end
          self.off = false
        else
          fizz.setVelocity(self.phys, 0, 0)
          self.off = true
        end
      end;
    
    update = function(self)
      if self.reversed == false then
        if (self.phys.x * self.xDir > self.xFinal * self.xDir) or (self.phys.y * self.yDir > self.yFinal * self.yDir) then
          fizz.setVelocity(self.phys, -1*self.xVelOg, -1*self.yVelOg)
          self.reversed = true
        end
      else
        if (self.phys.x * self.xDir < self.xOg * self.xDir) or (self.phys.y * self.yDir < self.yOg * self.yDir) then
          fizz.setVelocity(self.phys, self.xVelOg, self.yVelOg)
          self.reversed = false
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

Portal = Class{
  init = function(self, x, y, isExit)
    self.exited = false
    self.hitbox = Shapes.create.rect(x,y,32,64)
    self.isExit = isExit
    self.animationSet = {}
    if isExit then
	    self.animationSet[0] = love.graphics.newImage('Colours/exitPortal1.png')
	    self.animationSet[1] = love.graphics.newImage('Colours/exitPortal2.png')
	    self.animationSet[2] = love.graphics.newImage('Colours/exitPortal3.png')
	    self.animationSet[3] = love.graphics.newImage('Colours/exitPortal2.png')
    else
      self.animationSet[0] = love.graphics.newImage('Colours/entryPortal1.png')
	    self.animationSet[1] = love.graphics.newImage('Colours/entryPortal2.png')
	    self.animationSet[2] = love.graphics.newImage('Colours/entryPortal3.png')
	    self.animationSet[3] = love.graphics.newImage('Colours/entryPortal2.png')
    end
    self.animationCount = 0
    self.animationSpeed = 2
    self.img = self.animationSet[0]
  end;
  
  update = function(self, dt)
    self.animationCount = self.animationCount + (self.animationSpeed * dt)
    self.img = self.animationSet[math.fmod(math.floor(self.animationCount), 4)]
    if self.isExit == true then
      _, _, self.pen = Shapes.test(player.hitbox, self.hitbox, time)
      if self.pen ~= nil then
        self.exited = true
      end
    end
  end;
  
  draw = function(self)
    love.graphics.draw(self.img, self.hitbox.x - self.hitbox.hw*2, self.hitbox.y - self.hitbox.hh*2, 0, 2, 2)

  end;
  }