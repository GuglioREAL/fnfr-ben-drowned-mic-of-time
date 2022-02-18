--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

local leftFunc, rightFunc, confirmFunc, backFunc, drawFunc

local menuState

local titleBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/menuBG")))

local options = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/lol2")))
local story = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/lol1")))
local freeplay = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/lol3")))

local menuButton

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")


local function switchMenu(menu)
	menuState = 1
end

return {
	enter = function(self, previous)
		menuButton = 1
		songNum = 0

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

        if useDiscordRPC then
            presence = {
                state = "Choosing a mode",
                details = "In the Gamemode Select Menu",
                largeImageKey = "logo",
                startTimestamp = now,
            }
            nextPresenceUpdate = 0
        end

	end,

	update = function(self, dt)

		if not graphics.isFading() then
			if input:pressed("up") then
				audio.playSound(selectSound)

                if menuButton ~= 1 then
                    menuButton = menuButton - 1
                else
                    menuButton = 3
                end

			elseif input:pressed("down") then
				audio.playSound(selectSound)

                if menuButton ~= 3 then
                    menuButton = menuButton + 1
                else
                    menuButton = 1
                end

			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				--confirmFunc()
                if menuButton == 1 then
                    menu:musicStop()
                    status.setLoading(true)

			        graphics.fadeOut(
				        0.5,
				        function()
					        storyMode = false
					        songAppend = "-hard"
					        songNum = weekNum
					        Gamestate.switch(bd, songNum, songAppend)

					        status.setLoading(false)
				        end
			        )
                elseif menuButton == 2 then
                    status.setLoading(true)
                    Gamestate.switch(menuSettings)
                    status.setLoading(false)
                elseif menuButton == 3 then
                    status.setLoading(true)
                    Gamestate.switch(menuFreeplay)
                    status.setLoading(false)
                end
			elseif input:pressed("back") then
				audio.playSound(selectSound)

				Gamestate.switch(menu)
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			titleBG:draw()
            if menuButton == 1 then
                graphics.setColor(1,0,0)
            end
            story:draw()
            graphics.setColor(1,1,1)
            if menuButton == 2 then
                graphics.setColor(1,0,0)
            end
            options:draw()
            graphics.setColor(1,1,1)
            if menuButton == 3 then
                graphics.setColor(1,0,0)
            end
            freeplay:draw()
            graphics.setColor(1,1,1)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
                love.graphics.printf("Funkin' Vasion: v1.2.0\nFNFR: v1.1.0-beta2", -708, 340, 833, "left", nil, 1, 1)
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)

		Timer.clear()
	end
}
