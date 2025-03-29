-- imports
Gamestate = require "lib.hump.gamestate"
Timer = require "lib.hump.timer"
Vector = require "lib.hump.vector"
Class = require "lib.hump.class"
Signal = require "lib.hump.signal"
Camera = require "lib.hump.camera"
require "game"

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest', 0)
    Gamestate.switch(game)
end

function love.update(dt)
    Gamestate.update(dt)
end

function love.draw()
    Gamestate.draw()
end