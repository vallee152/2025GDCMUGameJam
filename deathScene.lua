deathScene = {}

function deathScene:enter()
  inventory.wallet = 0
  inventory.levelCurrent = inventory.levelCheckpoint
  player = Player(0,0,16,32)
  stretch = 1    
  camera = Camera(player.x, player.y)
end

function deathScene:draw()
  
  local dx,dy = player.hitbox.x - camera.x, player.hitbox.y - camera.y --camera update stuff
  camera:move(dx/2, dy/2)
  camera:attach()
  stretch = stretch + 0.1
  player:drawSpaghetti(stretch)
  if stretch > 20 then
    return Gamestate.push(playerPhysicsTest)
  end
  camera:detach()
end