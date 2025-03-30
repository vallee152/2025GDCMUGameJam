startingPower = true
gravity = 600
local startx = 18
local starty = 324

platforms = {
  floor1 = Platform(100, 400, 200, 10),
  floor2 = Platform(800, 450, 200, 10),
  wall = Platform(200, 360, 32, 32)
}

movingPlatforms = {
  flyingBox = MovingPlatform(350, 400, 50, 10, 80, 0, 550,1000)
}

coins = {}

player = Player(startx, starty, 16, 32)
switch = Switch(-500,-500, startingPower) --coconut

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(800, 500, true)
}