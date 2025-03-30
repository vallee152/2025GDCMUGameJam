
startingPower = false --true if we start with the power on, false if we start with it off.
gravity = 600
local startx = 18
local starty = 324

platforms = {
  floor1 = Platform(100, 400, 200, 10, 0),
  floor2 = Platform(800, 450, 200, 10, 0),
  wall = Platform(200, 360, 32, 32, 2)
}

movingPlatforms = {

  flyingBox = MovingPlatform(350, 400, 50, 10, 80, 0, 450, 9000, 0),
  
  anotherPlatform = MovingPlatform(450, 100, 50, 10, 0, 60, 850, 400, 0)
}


coins = {

  coin = Pickup(50, 370, 10, 5)
  
}

switch = Switch(100,400, startingPower)


player = Player(startx, starty, 16, 32)

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(800, 500, true)
}
switch = Switch(100,400, startingPower)
