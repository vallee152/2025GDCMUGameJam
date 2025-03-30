startingPower = false
gravity = 600
local startx = 18
local starty = 324
death = 1000

platforms = {
  floor1 = Platform(100, 400, 200, 10,0),
  floor2 = Platform(800, 450, 200, 10,0),
  wall = Platform(200, 360, 32, 32,2)
}

movingPlatforms = {
  flyingBox = MovingPlatform(350, 400, 50, 10, 80, 0, 550,1000,0)
}

coins = {}

player = Player(startx, starty, 16, 32)
switch = Switch(100,340, startingPower) --coconut

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(800, 500, true)
}