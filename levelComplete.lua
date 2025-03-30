

levelComplete = {}
local teleporterBackground
function levelComplete:draw()
--  love.graphics.draw(teleporterBackground, 0, 0, 0, 2)
  love.graphics.print("LEVEL COMPLETE!",216,100,0,2)
  love.graphics.print("Scrap: " .. tostring(player.wallet), 100,150)
  local bonus = (levelCurrent - levelCheckpoint) * 10
  love.graphics.print("You currently have a " .. tostring(bonus) .."% scrap bonus.", 100, 175)
  love.graphics.print("Bonus increases by 10% \nfor every level you complete in a row.",100,200)
  love.graphics.print("Press S or Down to continue exploring. \nPress W or Up to return to your ship \nand buy upgrades.",100,250)
end