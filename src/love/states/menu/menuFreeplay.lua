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

local menuNum = 1

local weekNum = 1
local songNum, songAppend
local songDifficulty = 2
menuu = 1
songNum = 1

local bg1 = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/fp1-1")))
local bg2 = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/fp1-2")))
local downOff = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/ADU")))
local downOn = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/ADP")))
local upOff = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/AUU")))
local upOn = graphics.newImage(love.graphics.newImage(graphics.imagePath("menu/fp/AUP")))
local THING = love.filesystem.load("sprites/menu/fp/thing.lua")()

THING.x, THING.y = 200, 140

freeplaySongPlay = {
	sod = love.audio.newSource("music/mot/song-of-drowning/Inst.ogg", "static"),
	fate = love.audio.newSource("music/mot/fate/Inst.ogg", "static"),
	sorrow = love.audio.newSource("music/mot/sorrow/Inst.ogg", "static")
}

local menuNames = {
	"Story Mode",
	"Freeplay",
	"Options"
}

local weekMeta = {
	"Song Of Drowning",
	"Fate",
	"Sorrow"
}
local difficultyStrs = {
	"-easy",
	"",
	"-hard"
}

local selectSound = love.audio.newSource("sounds/menu/select.ogg", "static")
local confirmSound = love.audio.newSource("sounds/menu/confirm.ogg", "static")


local function switchMenu(menu)
	if menuu == 1 then
		function confirmFunc()
			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					if freeplaySongPlay.sod:isPlaying() then
						freeplaySongPlay.sod:stop()
					elseif freeplaySongPlay.fate:isPlaying() then
						freeplaySongPlay.fate:stop()
					elseif freeplaySongPlay.sorrow:isPlaying() then
						freeplaySongPlay.sorrow:stop()
					end
					storyMode = false
					songAppend = "-hard"
					songNum = weekNum
					Gamestate.switch(bd, songNum, songAppend)

					status.setLoading(false)
				end
			)
		end
		function backFunc()
			if menuState == 1 then
				switchMenu(1)
			else
				menuState = menuState - 1
			end
		end
		function drawFunc()
			graphics.setColor(1, 1, 1)
			love.graphics.printf(weekMeta[weekNum], -640, 0, 853, "center", nil, 1.5, 1.5)
		end
	end

	menuState = 1
end

if menuu == 1 then
	function confirmFunc()
		status.setLoading(true)

		graphics.fadeOut(
			0.5,
			function()
				if freeplaySongPlay.sod:isPlaying() then
					freeplaySongPlay.sod:stop()
				elseif freeplaySongPlay.fate:isPlaying() then
					freeplaySongPlay.fate:stop()
				elseif freeplaySongPlay.sorrow:isPlaying() then
					freeplaySongPlay.sorrow:stop()
				end
				storyMode = false
				songAppend = "-hard"
				songNum = weekNum
				Gamestate.switch(bd, songNum, songAppend)

				status.setLoading(false)
			end
		)
	end
	function backFunc()
		if menuState == 1 then
			switchMenu(1)
		else
			menuState = menuState - 1
		end
	end
	function drawFunc()
		graphics.setColor(1, 1, 1)
		love.graphics.printf(weekMeta[weekNum], -640, 0, 853, "center", nil, 1.5, 1.5)
	end
end

menuState = 1

return {
	enter = function(self, previous)
		menu:musicStop()
		audio.playSound(freeplaySongPlay.sod)
		songNum = 0

		cam.sizeX, cam.sizeY = 0.9, 0.9
		camScale.x, camScale.y = 0.9, 0.9

		switchMenu(1)

		graphics.setFade(0)
		graphics.fadeIn(0.5)
		if useDiscordRPC then
			presence = {
				state = "Choosing a song",
				details = "In the Freeplay Menu",
				largeImageKey = "logo",
				startTimestamp = now,
			}
			nextPresenceUpdate = 0
		end

	end,

	update = function(self, dt)
		THING:update(dt)
		if not graphics.isFading() then
			if input:pressed("up") then
				audio.playSound(selectSound)

				if weekNum ~= 1 then
					weekNum = weekNum - 1
					songNum = songNum - 1
				else
					weekNum = 3
					songNum = 3
				end
				if freeplaySongPlay.sod:isPlaying() then
					freeplaySongPlay.sod:stop()
				elseif freeplaySongPlay.fate:isPlaying() then
					freeplaySongPlay.fate:stop()
				elseif freeplaySongPlay.sorrow:isPlaying() then
					freeplaySongPlay.sorrow:stop()
				end
				if weekNum == 1 then
					freeplaySongPlay.sod:play()
				elseif weekNum == 2 then
					freeplaySongPlay.fate:play()
				else
					freeplaySongPlay.sorrow:play()
				end
			elseif input:pressed("down") then
				audio.playSound(selectSound)

				if weekNum ~= 3 then
					weekNum = weekNum + 1
					songNum = songNum + 1
				else
					weekNum = 1
					songNum = 1
				end
				if freeplaySongPlay.sod:isPlaying() then
					freeplaySongPlay.sod:stop()
				elseif freeplaySongPlay.fate:isPlaying() then
					freeplaySongPlay.fate:stop()
				elseif freeplaySongPlay.sorrow:isPlaying() then
					freeplaySongPlay.sorrow:stop()
				end
				if weekNum == 1 then
					freeplaySongPlay.sod:play()
				elseif weekNum == 2 then
					freeplaySongPlay.fate:play()
				else
					freeplaySongPlay.sorrow:play()
				end
			elseif input:pressed("confirm") then
				audio.playSound(confirmSound)

				confirmFunc()
			elseif input:pressed("back") then
				audio.playSound(selectSound)
				if freeplaySongPlay.sod:isPlaying() then
					freeplaySongPlay.sod:stop()
				elseif freeplaySongPlay.fate:isPlaying() then
					freeplaySongPlay.fate:stop()
				elseif freeplaySongPlay.sorrow:isPlaying() then
					freeplaySongPlay.sorrow:stop()
				end

				if menuState == 1 then
					Gamestate.switch(menuSelect)
				else
					menuState = menuState - 1
				end
				
			end
		end
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)

			bg2:draw()
			bg1:draw()
			THING:draw()
			if input:pressed("down") then
				downOn:draw()
			else
				downOff:draw()
			end
			if input:pressed("up") then
				upOn:draw()
			else
				upOff:draw()
			end

			love.graphics.push()
				love.graphics.scale(cam.sizeX, cam.sizeY)

				drawFunc()
			love.graphics.pop()
		love.graphics.pop()
	end,

	leave = function(self)

		Timer.clear()
	end
}
