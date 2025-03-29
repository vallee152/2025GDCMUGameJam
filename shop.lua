strings = require "upgrades"

shop = {}
local shopBackground
local shopItems
local shopBonus
local animating = false
local percent = 0
local currPos = {
    x = 0,
    y = 96
}
local oldPos = {
    x = 0,
    y = 96
}
local destPos = {
    x = 0,
    y = 96
}

function shop:init()
    --shopBackground = love.graphics.newImage('backgrounds/shop')

    shopItems = {
        length = 4,
        [0] = {
            name = strings.jumpBoost.title,
            desc = strings.jumpBoost.desc,
            dPrice = 1,
            scale = 0,
            cPrice = 1,
            max = 1,
            --sprite = love.graphics.newImage('items/legs.png'),
            description = ''
        },
        [1] = {
            name = strings.jumpBoost.title,
            desc = strings.jumpBoost.desc,
            dPrice = 1,
            scale = 1,
            cPrice = 1,
            max = 0,
            --sprite = love.graphics.newImage('items/booster.png'),
            description = ''
        },
        [2] = {
            name = strings.timeSlow.title,
            desc = strings.timeSlow.desc,
            dPrice = 2,
            scale = 4,
            cPrice = 2,
            max = 0,
            --sprite = love.graphics.newImage('items/processor.png'),
            description = ''
        },
        [3] = {
            name = strings.jumpBoost.title,
            desc = strings.jumpBoost.desc,
            dPrice = 100,
            scale = 10,
            cPrice = 100,
            max = 0,
            --sprite = love.graphics.newImage('items/antigrav.png'),
            description = ''
        }
    }

    animating = false
    animationTime = 0
end

function shop:enter()
    shopBonus = false --[[TODO: check how many levels the player has gone through]]
    menuCursor = 0
end

function shop:leave()

end

function shop:update(dt)
    specX = 64 + menuCursor * 64
    if not animating and currPos.x ~= specX then
        animating = true
        destPos.x = 64 + menuCursor * 64
        oldPos.x = currPos.x
        animationTime = 0
    end
    if animating then
        if destPos.x ~= specX then
            oldPos.x = currPos.x
            animationTime = 0
            destPos.x = specX
        end
        animationTime = animationTime + 5* dt
        difference = destPos.x - oldPos.x
        currPos.x = oldPos.x + shop:animationPercent(animationTime) * difference
    end
    if animating and animationTime >= 1 then
        animating = false
    end
end

function shop:draw()
    love.graphics.print(tostring(shop:animationPercent(1)) .. ' ' .. tostring(animation) .. ' ' .. tostring(animationTime) .. ' ' .. tostring(percent), 0, 0)
    love.graphics.rectangle('line', currPos.x, currPos.y, 32, 32)
end

function shop:keypressed(key)
    if key == 'up' or key == 'left' then
        menuCursor = (menuCursor - 1) % shopItems.length
    elseif key == 'down' or key == 'right' then
        menuCursor = (menuCursor + 1) % shopItems.length
    elseif key == 'enter' then
        shop:buyItem(menuCursor)
    end
end

function shop:buyItem(selection)

end

function shop:animationPercent(time)
    if time <= 1 and time >= 0 then
        return 20 * (time ^ 5/ 20 - time ^ 4 / 8 + time ^ 2 / 8)
    elseif time > 1 then
        return 1
    else
        return 0
    end
end