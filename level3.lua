startingPower = true
gravity = 600
local startx = 18
local starty = 30
death = 4000

platforms = {
  floor1 = Platform(350, 100, 350, 10, 0),
  floor2 = Platform(1082, 400, 32, 10, 0),
  --wall = Platform(200, 360, 32, 32, 0)
}

movingPlatforms = {
  flyingBox = MovingPlatform(750, 100, 50, 10, 80, 80, 1000, 400, 0)
}

coins = {}

player = Player(startx, starty, 16, 32)
switch = Switch(-500,-500, startingPower) --coconut

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(800, 500, true)
}