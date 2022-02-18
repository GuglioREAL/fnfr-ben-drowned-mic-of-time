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

local upFunc, downFunc, confirmFunc, backFunc, drawFunc, musicStop

local menuState

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2

local logo = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/logoo")))
local godrays = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/godrays")))
local title = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/title")))

local titleEnter = love.filesystem.load("sprites/menu/titleEnter.lua")()

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")

local music = love.audio.newSource("music/menu/menu.ogg", "stream")

local function switchMenu(menu)
	
	function confirmFunc()
        status.setLoading(true)
		Gamestate.switch(menuSelect)
        status.setLoading(false)
	end
	function backFunc()
		audio.playSound(selectSound)
		graphics.fadeOut(0.5, love.event.quit)
	end

	menuState = 1
end

titleEnter.x, titleEnter.y = 225, 350

music:setLooping(true)

return {
	enter = function(self, previous)
        titleEnter:animate("anim", true)
		songNum = 0

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)

		if useDiscordRPC then
			presence = {
				state = "Press Enter",
				details = "In the Menu",
				largeImageKey = "logo",
				startTimestamp = now,
			}
			nextPresenceUpdate = 0
		end

		music:play()
	end,

	musicStop = function(self)
		music:stop()
	end,

	update = function(self, dt)
		titleEnter:update(dt)

		if not graphics.isFading() then
			if input:pressed("confirm") then
				audio.playSound(confirmSound)

				titleEnter:animate("pressed", false)
				confirmFunc()
			elseif input:pressed("back") then
				backFunc()
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)
				title:draw()
				godrays:draw()
				logo:draw()

				titleEnter:draw()

				love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)
		Timer.clear()
	end
}
