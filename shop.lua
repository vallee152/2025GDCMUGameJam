require "upgrades"
require "lib.hump.gamestate"

shop = {}
local shopBackground
local shopForeground
local shopSelector
local shopItems
local shopBonus
local animating = false
local currPos = {
    x = 220,
    y = 156
}
local oldPos = {
    x = 220,
    y = 156
}
local destPos = {
    x = 220,
    y = 156
}
local i
local returnTo

function shop:init()
    shopBackground = love.graphics.newImage('Colours/shopBackground.png')
    shopForeground = love.graphics.newImage('Colours/shopForeground.png')
    shopSelector = love.graphics.newImage('Colours/shopSelector.png')

    shopItems = {
        length = 4,
        [0] = {
            title = upgrades.sprint.title,
            desc = upgrades.sprint.desc,
            dPrice = 1,
            scale = 0,
            cPrice = 1,
            max = 1,
            sprite = love.graphics.newImage('Colours/sprint.png'),
            description = ''
        },
        [1] = {
            title = upgrades.jumpBoost.title,
            desc = upgrades.jumpBoost.desc,
            dPrice = 1,
            scale = 1,
            cPrice = 1,
            max = 0,
            sprite = love.graphics.newImage('Colours/jumpBoost.png'),
            description = ''
        },
        [2] = {
            title = upgrades.timeSlow.title,
            desc = upgrades.timeSlow.desc,
            dPrice = 2,
            scale = 4,
            cPrice = 2,
            max = 0,
            sprite = love.graphics.newImage('Colours/timeSlow.png'),
            description = ''
        },
        [3] = {
            title = upgrades.doubleJump.title,
            desc = upgrades.doubleJump.desc,
            dPrice = 100,
            scale = 10,
            cPrice = 100,
            max = 0,
            sprite = love.graphics.newImage('Colours/doubleJump.png'),
            description = ''
        }
    }

    animating = false
    animationTime = 0
end

function shop:enter()
    shopBonus = false --[[TODO: check how many levels the player has gone through]]
    menuCursor = 0
    returnTo = previous
end

function shop:leave()

end

function shop:update(dt)
    specX = 220 + menuCursor * 96
    if not animating and currPos.x ~= specX then
        animating = true
        destPos.x = 224 + menuCursor * 96
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
    love.graphics.draw(shopBackground, 0, 0, 0, 2)
    love.graphics.draw(shopForeground, 0, 0, 0, 2)
    for i = 0, 3, 1 do
        love.graphics.draw(shopItems[i].sprite, 224 + i * 96, 160, 0, 2)
    end
    love.graphics.draw(shopSelector, currPos.x, currPos.y, 0, 2)
    love.graphics.print({{1,1,1}, shopItems[menuCursor].title}, 224, 230)
    love.graphics.print({{1,1,1}, shopItems[menuCursor].desc}, 228, 260)
    love.graphics.print({{1,1,1}, 'Price: ' .. tostring(shopItems[menuCursor].cPrice)
        .. shop:tabText(tostring(shopItems[menuCursor].cPrice), 6) .. 'Quantity: ' .. tostring(0)}, 228, 390)
end

function shop:keypressed(key)
    if key == 'up' or key == 'left' or key == 'w' or key == 'a' then
        menuCursor = (menuCursor - 1) % shopItems.length
    elseif key == 'down' or key == 'right' or key == 's' or key == 'd' then
        menuCursor = (menuCursor + 1) % shopItems.length
    elseif key == 'q' then
        shop:buyItem(menuCursor)
    elseif key == 'lshift' or key == 'rshift' then
        return Gamestate.pop()
    end
    return false
end

function shop:buyItem(selection)
    shopItems[selection].cPrice = shopItems[selection].dPrice * 2
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

function shop:tabText(text, space)
    a = ''
    for i = text:len(), space, 1 do
        a = a .. ' '
    end
    return a
end