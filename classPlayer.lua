fizz = require("lib.fizzx")
Class = require("lib.hump.class")

Player = Class {
	init = function(self, x, y, halfWidth, halfHeight)
		self.hitbox = fizz.addDynamic("rect", x, y, halfWidth, halfHeight)
		self.speed = 200
	    self.jumpVelocity = -300
	    self.img = love.graphics.newImage('Colours/player.png')
	    self.jumpMax = 1
	    self.jumpCount = 1
	    self.animationSet = {}
	    self.animationSet[0] = love.graphics.newImage('Colours/playerWalk1.png')
	    self.animationSet[1] = love.graphics.newImage('Colours/playerWalk2.png')
	    self.animationSet[2] = love.graphics.newImage('Colours/playerWalk3.png')
	    self.animationSet[3] = love.graphics.newImage('Colours/playerWalk2.png')
	    self.animationFlip = 1
	    self.animationCount = 0
	    self.animationSpeed = 5
	    self.wallet = 0
	end;
	draw = function(self)
		-- bounds box: love.graphics.rectangle("fill", self.hitbox.x - self.hitbox.hw, self.hitbox.y - self.hitbox.hh, self.hitbox.hw*2, self.hitbox.hh*2)
      	love.graphics.draw(self.img, self.hitbox.x - self.hitbox.hw*5*self.animationFlip, self.hitbox.y - self.hitbox.hh*2, 0, 2*self.animationFlip, 2)
    end;
}