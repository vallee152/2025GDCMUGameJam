startingPower = true
gravity = 600
local startx = 18
local starty = 30
death = 4000

platforms = {
  floor1 = Platform(350, 100, 350, 10, 0),
  floor2 = Platform(1228, 400, 128, 10, 0),
  floor3 = Platform(1388, 368, 32, 32, 2),
  floor4 = Platform(1452, 304, 32, 32, 2),
  floor5 = Platform(1584, 282, 100, 10, 2),
  floor6 = Platform(2100, 282, 100, 10, 2),
  floor7 = Platform(1834, 1000, 250, 10, 2),
  wall1 = Platform(1652, 641, 32, 359, 2)
}

movingPlatforms = {
  flyingBox = MovingPlatform(750, 100, 50, 10, 80, 80, 1000, 400, 0)
}

coins = {
  coin1 = Pickup(2120, 242, 10, 5)
}

player = Player(startx, starty, 16, 32)
switch = Switch(-500,-500, startingPower) --coconut

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(800, 500, true)
}