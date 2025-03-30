deathScene = {}

function deathScene:enter()
  inventory.wallet = 0
  inventory.levelCurrent = inventory.levelCheckpoint
  return Gamestate.push(playerPhysicsTest)
end