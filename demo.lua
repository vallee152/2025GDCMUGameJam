platform = {}

function love.load()
        -- This is the height and the width of the platform.
    platform.width = love.graphics.getWidth()    -- This makes the platform as wide as the whole game window.
    platform.height = love.graphics.getHeight()  -- This makes the platform as tall as the whole game window.
        
        -- This is the coordinates where the platform will be rendered.
    platform.x = 0                               -- This starts drawing the platform at the left edge of the game window.
    platform.y = platform.height / 2             -- This starts drawing the platform at the very middle of the game window
            -- Add this below the platform variables.

        -- This is the coordinates where the player character will be rendered.
    player.x = love.graphics.getWidth() / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
    player.y = love.graphics.getHeight() / 2  -- This sets the player at the middle of the screen based on the height of the game window. 

        -- This calls the file named "purple.png" and puts it in the variable called player.img.
    player.img = love.graphics.newImage('purple.png')
    player.speed = 200    -- This is the player's speed. This value can be change based on your liking.
end

function love.update(dt)
    if love.keyboard.isDown('d') then                    -- When the player presses and holds down the "D" button:
        player.x = player.x + (player.speed * dt)    -- The player moves to the right.
    elseif love.keyboard.isDown('a') then                -- When the player presses and holds down the "A" button:
        player.x = player.x - (player.speed * dt)    -- The player moves to the left.
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)        -- This sets the platform color to white.

        -- The platform will now be drawn as a white rectangle while taking in the variables we declared above.
    love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

            -- Add this below the love.graphics.rectangle line.
        
        -- This draws the player.
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end
player = {}  -- Add this below the platform variable