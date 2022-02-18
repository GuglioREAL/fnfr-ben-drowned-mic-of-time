local song, difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		weeks:enter()

        didAnim = false
        hahahahahahaSoFunnyIHaveToAddThisCuzImDumb = true

        cam.sizeX, cam.sizeY = 0.6, 0.6
		camScale.x, camScale.y = 0.6, 0.6

		song = songNum
		difficulty = songAppend
        foreground = graphics.newImage(love.graphics.newImage(graphics.imagePath("ben/ben tree")))
        background = graphics.newImage(love.graphics.newImage(graphics.imagePath("ben/ben sky")))
        ground = graphics.newImage(love.graphics.newImage(graphics.imagePath("ben/ben ground")))
        foreground.y = 80

        enemy = love.filesystem.load("sprites/characters/benRipBozo.lua")()

        enemy.x, enemy.y = -175, 210
        
		boyfriend.x, boyfriend.y = 380, 330

		enemyIcon:animate("daddy dearest", false)

		self:load()
	end,

	load = function(self)
		weeks:load()

		if song == 3 then
			inst = love.audio.newSource("music/mot/sorrow/Inst.ogg", "stream")
			voices = love.audio.newSource("music/mot/sorrow/Voices.ogg", "stream")

            enemy = love.filesystem.load("sprites/characters/benSorrow.lua")()
            secondEnemy = love.filesystem.load("sprites/characters/ben_alive.lua")()
            boyfriend = love.filesystem.load("sprites/characters/boyfriendSorrow.lua")()
            enemyIcon:animate("ben3", false)

            boyfriend.x, boyfriend.y = 950, 760
            enemy.x, enemy.y = -950, 220
            secondEnemy.x, secondEnemy.y = -950, 760
            didAnim = true
            hahahahahahaSoFunnyIHaveToAddThisCuzImDumb = false
		elseif song == 2 then
			inst = love.audio.newSource("music/mot/fate/Inst.ogg", "stream")
			voices = love.audio.newSource("music/mot/fate/Voices.ogg", "stream")
            boyfriend = love.filesystem.load("sprites/characters/boyfriend.lua")()
            enemyIcon:animate("ben2", true)

            boyfriend.x, boyfriend.y = 380, 330
            enemy.x, enemy.y = -175, 210
            didAnim = true
            hahahahahahaSoFunnyIHaveToAddThisCuzImDumb = false
		else
			inst = love.audio.newSource("music/mot/song-of-drowning/Inst.ogg", "stream")
			voices = love.audio.newSource("music/mot/song-of-drowning/Voices.ogg", "stream")

            enemy = love.filesystem.load("sprites/characters/benRipBozo.lua")()
            benAnim = love.filesystem.load("sprites/characters/benAnim.lua")()
            enemyIcon:animate("ben", true)

            boyfriend.x, boyfriend.y = 380, 330
            enemy.x, enemy.y = -175, 210
            benAnim.x, benAnim.y = -175, 210

            benAnim:animate("tele", false)
		end

		self:initUI()
        if song ~= 1 then
		    weeks:setupCountdown()
        else
            teleSound = love.audio.newSource("sounds/mot/bentp.ogg", "static")
            audio.playSound(teleSound)
        end
	end,

	initUI = function(self)
		weeks:initUI()

		if song == 3 then
			weeks:generateNotes(love.filesystem.load("charts/mot/sorrow-hard.lua")())
		elseif song == 2 then
			weeks:generateNotes(love.filesystem.load("charts/mot/fate.lua")())
		else
			weeks:generateNotes(love.filesystem.load("charts/mot/song-of-drowning-hard.lua")())
		end
	end,

	update = function(self, dt)
		weeks:update(dt)
        if song == 2 then
            if health >= 80 then
                if enemyIcon:getAnimName() == "ben2" then
                    enemyIcon:animate("ben2 losing", false)
                end
            else
                if enemyIcon:getAnimName() == "ben2 losing" then
                    enemyIcon:animate("ben2", true)
                end
            end
        elseif song == 3 then
            if health >= 80 then
                if enemyIcon:getAnimName() == "ben3" then
                    enemyIcon:animate("ben3 losing", false)
                end
            else
                if enemyIcon:getAnimName() == "ben3 losing" then
                    enemyIcon:animate("ben3", false)
                end
            end
        end
        enemyIcon:update(dt)

        if song == 1 then
            if not benAnim:isAnimated() then
                benAnim:animate("idle", true)
                hahahahahahaSoFunnyIHaveToAddThisCuzImDumb = true
                didAnim = true
            end
            if not didAnim then
                boyfriend:update(dt)
            end
            benAnim:update(dt)
        end

        if song == 3 then
            secondEnemy:update(dt)
            if musicTime >= 220802 then
                enemy.x, enemy.y = -950, 790
                if enemy:getAnimName() == "up" then
                    secondEnemy:animate("up", false)
                    enemy:animate("DEEZ NUTS", false)
                elseif enemy:getAnimName() == "down" then
                    secondEnemy:animate("down", false)
                    enemy:animate("DEEZ NUTS", false)
                elseif enemy:getAnimName() == "left" then
                    secondEnemy:animate("left", false)
                    enemy:animate("DEEZ NUTS", false)
                elseif enemy:getAnimName() == "right" then
                    secondEnemy:animate("right", false)
                    enemy:animate("DEEZ NUTS", false)
                end
            end
        end
        if song == 1 then
            if didAnim and not doingCountdown then
                weeks:setupCountdownSong1()
                doingCountdown = true
            end
            if musicTime <= 18000 then
                cam.sizeX, cam.sizeY = 1.1, 1.1
		        camScale.x, camScale.y = 1.1, 1.1
            else
                cam.sizeX, cam.sizeY = 0.6, 0.6
		        camScale.x, camScale.y = 0.6, 0.6
            end
            if not inst:isPlaying() and not voices:isPlaying() then
                hahahahahahaSoFunnyIHaveToAddThisCuzImDumb = false
            end
        end
        if didAnim then
            if not (hahahahahahaSoFunnyIHaveToAddThisCuzImDumb) and not (countingDown or graphics.isFading()) and not (inst:isPlaying() and voices:isPlaying()) then
                if storyMode and song < 3 then
                    song = song + 1

                    self:load()
                else
                    status.setLoading(true)

                    graphics.fadeOut(
                        0.5,
                        function()
                            Gamestate.switch(menu)

                            status.setLoading(false)
                        end
                    )
                end
            end
        end

		weeks:updateUI(dt)
	end,

	draw = function(self)
        if song ~= 3 then
            love.graphics.push()
                love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
                love.graphics.scale(cam.sizeX, cam.sizeY)

                love.graphics.push()
                    love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

                    background:draw()
                    foreground:draw()
                    ground:draw()

                love.graphics.pop()
                love.graphics.push()
                    love.graphics.translate(cam.x, cam.y)
                    if (song == 1 and musicTime >= 18000) or (song == 2) then
                        enemy:draw()
                    end
                    if song == 1 then
                        if musicTime <= 18000 then
                            benAnim:draw()
                        end
                    end
                    boyfriend:draw()
                love.graphics.pop()
                love.graphics.push()
                    love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

                love.graphics.pop()
                weeks:drawRating(0.9)
            love.graphics.pop()
            if didAnim then
                weeks:drawUI()
            end
        else
            if (musicTime <= 192168) or (musicTime >= 201028 and musicTime <= 219860) or (musicTime >= 220402) then 
                love.graphics.push()
                    love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
                    love.graphics.scale(cam.sizeX, cam.sizeY)

                    love.graphics.push()
                        love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

                    love.graphics.pop()
                    love.graphics.push()
                        love.graphics.translate(cam.x, cam.y)

                        if musicTime <= 227800 then
                            enemy:draw()
                        elseif musicTime >= 230800 then
                            secondEnemy:draw()
                        end
                        boyfriend:draw()
                    love.graphics.pop()
                    love.graphics.push()
                        love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

                    love.graphics.pop()
                    weeks:drawRating(0.9)
                love.graphics.pop()

                love.graphics.push()
                    love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
                    love.graphics.scale(0.7, 0.7)

                    for i = 1, 4 do
                        if (musicTime <= 192168) then
                            if enemyArrows[i]:getAnimName() == "off" then
                                graphics.setColor(0.6, 0.6, 0.6)
                            end
                            enemyArrows[i]:draw()
                            graphics.setColor(1, 1, 1)
                        end
                        boyfriendArrows[i]:draw()

                        love.graphics.push()
                            love.graphics.translate(0, -musicPos)

                            for j = #enemyNotes[i], 1, -1 do
                                if (not settings.downscroll and enemyNotes[i][j].y - musicPos <= 560) or (settings.downscroll and enemyNotes[i][j].y - musicPos >= -560) then
                                    local animName = enemyNotes[i][j]:getAnimName()
                                    if (musicTime <= 192168) then
                                        if animName == "hold" or animName == "end" then
                                            graphics.setColor(1, 1, 1, 0.5)
                                        end
                                        enemyNotes[i][j]:draw()
                                        graphics.setColor(1, 1, 1)
                                    end
                                end
                            end
                            for j = #boyfriendNotes[i], 1, -1 do
                                if (not settings.downscroll and boyfriendNotes[i][j].y - musicPos <= 560) or (settings.downscroll and boyfriendNotes[i][j].y - musicPos >= -560) then
                                    local animName = boyfriendNotes[i][j]:getAnimName()

                                    if settings.downscroll then
                                        if animName == "hold" or animName == "end" then
                                            graphics.setColor(1, 1, 1, math.min(0.5, (500 - (boyfriendNotes[i][j].y - musicPos)) / 150))
                                        else
                                            graphics.setColor(1, 1, 1, math.min(1, (500 - (boyfriendNotes[i][j].y - musicPos)) / 75))
                                        end
                                    else
                                        if animName == "hold" or animName == "end" then
                                            graphics.setColor(1, 1, 1, math.min(0.5, (500 + (boyfriendNotes[i][j].y - musicPos)) / 150))
                                        else
                                            graphics.setColor(1, 1, 1, math.min(1, (500 + (boyfriendNotes[i][j].y - musicPos)) / 75))
                                        end
                                    end
                                    boyfriendNotes[i][j]:draw()
                                end
                            end
                            graphics.setColor(1, 1, 1)
                        love.graphics.pop()
                    end

                    graphics.setColor(1, 1, 1, countdownFade[1])
                    countdown:draw()
                    graphics.setColor(1, 1, 1)
                
                    
                love.graphics.pop()
            end
        end

	end,

	leave = function(self)
		background = nil
		foreground = nil
		ground = nil

		weeks:leave()
	end
}
