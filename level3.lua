startingPower = true
gravity = 1400
offset = 20000
local startx = 18 +offset
local starty = 30 +offset
death = 4000



platforms = {
  floor1 = Platform(350+offset, 100+offset, 350, 10, 0),
  floor2 = Platform(1128+offset, 400+offset, 128, 10, 0),
  floor3 = Platform(1388+offset, 368+offset, 32, 32, 2),
  floor4 = Platform(1452+offset, 304+offset, 32, 32, 2),
  floor5 = Platform(1584+offset, 282+offset, 100, 10, 2),
  floor6 = Platform(2100+offset, 282+offset, 100, 10, 2),
  floor7 = Platform(1917+offset, 1000+offset, 333, 10, 2),
  wall1 = Platform(1652+offset, 641+offset, 32, 359, 2),
  wall2 = Platform(668+offset, 741+offset, 32, 641, 2),
  wall3 = Platform(1032+offset, 891+offset, 32, 491, 2)
}

movingPlatforms = {
  flyingBox = MovingPlatform(750+offset, 100+offset, 50, 10, 80, 80, 1000+offset, 400+offset, 0),
  flyingBox1 = MovingPlatform(2250+offset, 282+offset, 50, 10, 0, 160, 2251+offset, 1010+offset, 0)

}

coins = {
  coin1 = Pickup(2120+offset, 242+offset, 10, 5)
}

player = Player(startx, starty, 16, 32)
switch = Switch(-500+offset,-500+offset, startingPower) --coconut

portals = {
  enter = Portal(startx + 32,starty+128,false),
  exit = Portal(2050+32+offset, 282+50+offset, true)
}