require("classPlatform")
require("classPlayer")
require("classPickup")
startingPower = false --true if we start with the power on, false if we start with it off.
gravity = 600

platforms = {
  floor1 = Platform(100, 400, 200, 10),
  floor2 = Platform(800, 450, 200, 10),
  wall = Platform(200, 360, 32, 32)
}

movingPlatforms = {

  flyingBox = MovingPlatform(350, 400, 50, 10, 80, 0, 250)
}


coins = {

  coin = Pickup(50, 370, 10, 5)
  
}

<<<<<<< Updated upstream
switch = Switch(100,400, startingPower)

=======
portals = {
  exit = Portal(800, 330, true)
}
switch = Switch(100,400, startingPower)
>>>>>>> Stashed changes
