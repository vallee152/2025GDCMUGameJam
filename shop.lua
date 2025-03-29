shop = {}
local shopBackground
local shopItems
local shopBonus
local cursor

function shop:init()
    --[[shopBackground = love.graphics.newImage('backgrounds/shop')

    shopItems = {
        [0] = {
            name = 'good legs',
            dPrice = 1,
            scale = 0,
            cPrice = 1,
            max = 1,
            sprite = love.graphics.newImage('items/legs.png'),
            description = ''
        },
        [1] = {
            name = 'booster',
            dPrice = 1,
            scale = 1,
            cPrice = 1,
            max = 0,
            sprite = love.graphics.newImage('items/booster.png'),
            description = ''
        },
        [2] = {
            name = 'processor speed',
            dPrice = 2,
            scale = 4,
            cPrice = 2,
            max = 0,
            sprite = love.graphics.newImage('items/processor.png'),
            description = ''
        },
        [3] = {
            name = 'antigravity',
            dPrice = 100,
            scale = 10,
            cPrice = 100,
            max = 0,
            sprite = love.graphics.newImage('items/antigrav.png'),
            description = ''
        }
    }]]
end

function shop:enter()
    shopBonus = false --[[TODO: check how many levels the player has gone through]]
    cursor = 0
end

function shop:leave()

end

function shop:update(dt)

end

function shop:draw()
    love.graphics.print(cursor, 0, 0)
end

function shop:getKey()
    cursor = cursor + 1
end

function shop:buyItem(testVar)

end