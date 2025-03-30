require("classPlatform")
require("classPlayer")
require("classPickup")
startingPower = true --true if we start with the power on, false if we start with it off.
gravity = 1000
local startx = 88+100
local starty = 200+100
local offset = 10000

platforms = {
    l2floor1 = Platform(300+offset, 400+offset, 200, 10, 0),
    l2wall1 = Platform(112+offset, 290+offset, 12, 100, 2),
    l2ceiling1 = Platform(800+offset, 200+offset, 600, 12, 2),
    l2wall2 = Platform(500+offset, 590+offset, 12, 200, 2),
    l2floor2 = Platform(1200+offset, 800+offset, 200, 10, 0),
    l2wall3 = Platform(800+offset, 360+offset, 12, 152, 2),
    l2ceiling2 = Platform(1100+offset, 500+offset, 300, 12, 2),
    l2floor3 = Platform(260+offset, 1000+offset, 300, 10, 0),
    l2wall5 = Platform(-50+offset, 500+offset, 12, 1000, 2),
    l2wall6 = Platform(1300+offset, 0+offset, 12, 600, 2),
    l2wall7 = Platform(1600+offset, 700+offset, 12, 800, 2),
}

movingPlatforms = {
    l2flyingBox1 = MovingPlatform(600+offset, 620+offset, 50, 10, 160, 80, 900+offset, 9100+offset, 1),
    l2flyingBox2 = MovingPlatform(1+offset, 1+offset, 50, 10, 2, 500, 9100+offset, 1000+offset, 1),
    l2flyingBox3 = MovingPlatform(1450+offset, 1+offset, 50, 10, 2, 500, 9100+offset, 1000+offset, 1),
}


coins = {

    l2coin1 = Pickup(1500+offset, 400+offset, 10, 5),
    l2coin2 = Pickup(150+offset, 980+offset, 10, 5)
  
}

switch = Switch(300+offset,300+offset, startingPower)

portals = {
    enter = Portal(200+offset,456+offset,false),
    exit = Portal(1700+offset, 1000+offset, true)
}

player = Player(startx+offset, starty+offset, 16, 32)

death = 5000+offset