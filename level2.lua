require("classPlatform")
require("classPlayer")
require("classPickup")
startingPower = false --true if we start with the power on, false if we start with it off.
gravity = 700

platforms = {
    floor1 = Platform(100, 400, 200, 10),
    
}

movingPlatforms = {
    flyingBox1 = MovingPlatform(540, 600, 50, 10, 160, 80, 250,50),
    flyingBox2 = MovingPlatform(540, 100, 50, 10, 160, 0, 250,50),
}


coins = {

  --coin = Pickup(50, 370, 10, 5)
  
}

switch = Switch(200,300, startingPower)

portals = {
  --exit = Portal(800, 330, true)
}
--switch = Switch(100,400, startingPower)
