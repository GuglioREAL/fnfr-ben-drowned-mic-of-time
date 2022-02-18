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

local menuButton

local box1 = graphics.newImage(love.graphics.newImage(graphics.imagePath("switch/box1")))
local box2 = graphics.newImage(love.graphics.newImage(graphics.imagePath("switch/box5")))
local switchBG = graphics.newImage(love.graphics.newImage(graphics.imagePath("switch/bg")))
local selector = graphics.newImage(love.graphics.newImage(graphics.imagePath("switch/selecter")))

box1.x = 0
box2.x = 700

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
                state = "Choosing a Chapter",
                details = "In the Chapter Select Menu",
                largeImageKey = "logo",
                startTimestamp = now,
            }
            nextPresenceUpdate = 0
        end

        function moveBox()
            if menuButton == 1 then
                box1.x = 0
                box2.x = 700
            elseif menuButton == 2 then
                box1.x = -700
                box2.x = 0
            end
        end

        function confirmFunc()
            if menuButton == 1 then
                Gamestate.switch(menu)
            elseif menuButton == 2 then
                love.window.showMessageBox("SORRY!", "This is not finished yet. Please wait for the next update!")
            end
        end
	end,

	update = function(self, dt)
        

		if not graphics.isFading() then
			if input:pressed("left") then
				audio.playSound(selectSound)

                if menuButton ~= 1 then
                    menuButton = menuButton - 1
                else
                    menuButton = 2
                end 
                moveBox()

			elseif input:pressed("right") then
				audio.playSound(selectSound)

                if menuButton ~= 2 then
                    menuButton = menuButton + 1
                else
                    menuButton = 1
                end
                moveBox()

			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)
                confirmFunc()
			elseif input:pressed("back") then
                graphics.fadeOut(0.5, love.event.quit)
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			switchBG:draw()

            box1:draw()
            box2:draw()
            selector:draw()

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

                
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)

		Timer.clear()
	end
}
