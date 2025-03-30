require("classPlatform")
require("classPlayer")
require("classPickup")
startingPower = false --true if we start with the power on, false if we start with it off.
gravity = 1000
local startx = 88+100
local starty = 200+100

platforms = {
    floor1 = Platform(100, 400, 200, 10,0),
}

movingPlatforms = {
    flyingBox1 = MovingPlatform(540, 600, 50, 10, 160, 80, 250,50,0),
    flyingBox2 = MovingPlatform(540, 100, 50, 10, 160, 0, 250,50,0),
    floor1 = Platform(100+200, 400, 200, 10, 0),
    wall1 = Platform(-88+200, 290, 12, 100, 2),
    ceiling1 = Platform(1100+300, 200, 1100, 12, 2),
    wall2 = Platform(300+200, 590, 12, 200, 2),
    floor2 = Platform(1000+200, 800, 200, 10, 0),
    wall3 = Platform(600+200, 260+100, 12, 152, 2),
    ceiling2 = Platform(1400+200, 400+100, 800, 12, 2),
    floor3 = Platform(160+100, 900+100, 300, 10, 0),
    wall5 = Platform(-50, 500, 12, 1000, 2),

}

movingPlatforms = {
    flyingBox1 = MovingPlatform(500+100, 520+100, 50, 10, 160, 80, 800+100, 9000+100, 1),
    flyingBox2 = MovingPlatform(1, 1, 50, 10, 2, 10000, 9000+100, 900+100, 1),
}


coins = {

  coin = Pickup(50+100, 880+100, 10, 5)
  
}

switch = Switch(200+100,300, startingPower)

portals = {
    enter = Portal(100+100,456,false),
    exit = Portal(800+100, 500, true)
}

player = Player(startx, starty, 16, 32)

death = 10000