-- imports

function love.load()
    -- ran at beginning, set up variables/globals/constants
    -- list of subcalls from the main love functions
    gameState = {
        [0] = MainMenu,
        [1] = Game
    }
    currState = 0
end


function love.update(dt)
    -- game tick
    -- call the required subfunction based on current state
    currState = gameState[currState].update(dt)
end


function love.draw()
    -- render game
    -- call the required subfunction based on current state
    gameState[currState].draw()
end