-- imports
Gamestate = require "lib.hump.gamestate"
Timer = require "lib.hump.timer"
Vector = require "lib.hump.vector"
Class = require "lib.hump.class"
Signal = require "lib.hump.signal"
Camera = require "lib.hump.camera"
require "playerPhysicsTest"
require "game"
require "shop"
require "levelComplete"
require "inventory"
require "deathScene"
menuCursor = 0
levelCurrent = 1
levelCheckpoint = 1

function love.load()
    source = love.audio.newSource('Colours/song.ogg', 'static')
    source:setLooping(true)
    source:play()
    love.window.setMode(800, 608, {fullscreen = false, vsync = 1,
        msaa = 0, resizable = false, borderless = false})
    love.graphics.setDefaultFilter('nearest', 'nearest', 0)
    Font = love.graphics.newFont('Colours/joystix monospace.otf', 16)
    love.graphics.setFont(Font)
    Gamestate.switch(playerPhysicsTest)
end

function love.update(dt)
    Gamestate.update(dt)
end

function love.draw()
    Gamestate.draw()
end

function love.keypressed(key)
    Gamestate.keypressed(key)
end