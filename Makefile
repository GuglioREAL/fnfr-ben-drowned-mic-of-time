# --------------------------------------------------------------------------------
# Friday Night Funkin' Rewritten Makefile v1.3
#
# Copyright (C) 2021  HTV04
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------------

all: lovefile desktop console

desktop: lovefile win64 win32 macos

console: lovefile switch

lovefile:
	@rm -rf build/lovefile
	@mkdir -p build/lovefile

	@cd src/love; zip -r -9 ../../build/lovefile/funkin-vasion-rewritten.love .

	@mkdir -p build/release
	@rm -f build/release/funkin-vasion-rewritten-lovefile.zip
	@cd build/lovefile; zip -9 -r ../release/funkin-vasion-rewritten-lovefile.zip .

win64: lovefile
	@rm -rf build/win64
	@mkdir -p build/win64

	@cp resources/win64/love/OpenAL32.dll build/win64
	@cp resources/win64/love/SDL2.dll build/win64
	@cp resources/win64/love/license.txt build/win64
	@cp resources/win64/love/lua51.dll build/win64
	@cp resources/win64/love/mpg123.dll build/win64
	@cp resources/win64/love/love.dll build/win64
	@cp resources/win64/love/msvcp120.dll build/win64
	@cp resources/win64/love/msvcr120.dll build/win64
	@cp resources/win64/love/discord-rpc.dll build/win64

	@cat resources/win64/love/love.exe build/lovefile/funkin-vasion-rewritten.love > build/win64/funkin-vasion-rewritten.exe

	@mkdir -p build/release
	@rm -f build/release/funkin-vasion-rewritten-win64.zip
	@cd build/win64; zip -9 -r ../release/funkin-vasion-rewritten-win64.zip .

win32: lovefile
	@rm -rf build/win32
	@mkdir -p build/win32

	@cp resources/win32/love/OpenAL32.dll build/win32
	@cp resources/win32/love/SDL2.dll build/win32
	@cp resources/win32/love/license.txt build/win32
	@cp resources/win32/love/lua51.dll build/win32
	@cp resources/win32/love/mpg123.dll build/win32
	@cp resources/win32/love/love.dll build/win32
	@cp resources/win32/love/msvcp120.dll build/win32
	@cp resources/win32/love/msvcr120.dll build/win32
	@cp resources/win32/love/discord-rpc.dll build/win32

	@cat resources/win32/love/love.exe build/lovefile/funkin-vasion-rewritten.love > build/win32/funkin-vasion-rewritten.exe

	@mkdir -p build/release
	@rm -f build/release/funkin-vasion-rewritten-win32.zip
	@cd build/win32; zip -9 -r ../release/funkin-vasion-rewritten-win32.zip .

macos: lovefile
	@rm -rf build/macos
	@mkdir -p "build/macos/Friday Night Funkin' Rewritten.app"

	@cp -r resources/macos/love.app/. "build/macos/Friday Night Funkin' Rewritten.app"

	@cp build/lovefile/funkin-vasion-rewritten.love "build/macos/Friday Night Funkin' Rewritten.app/Contents/Resources"

	@mkdir -p build/release
	@rm -f build/release/funkin-vasion-rewritten-macos.zip
	@cd build/macos; zip -9 -r ../release/funkin-vasion-rewritten-macos.zip .

switch: lovefile
	@rm -rf build/switch
	@mkdir -p build/switch/switch/funkin-vasion-rewritten

	@nacptool --create "Friday Night Funkin' Ben Drowned Mic Of Time" GameVasion "$(shell cat version.txt)" build/switch/funkin-vasion-rewritten.nacp

	@mkdir build/switch/romfs
	@cp build/lovefile/funkin-vasion-rewritten.love build/switch/romfs/game.love

	@elf2nro resources/switch/love.elf build/switch/switch/funkin-vasion-rewritten/funkin-vasion-rewritten.nro --icon=resources/switch/icon.jpg --nacp=build/switch/funkin-vasion-rewritten.nacp --romfsdir=build/switch/romfs

	@rm -r build/switch/romfs
	@rm build/switch/funkin-vasion-rewritten.nacp

	@mkdir -p build/release
	@rm -f build/release/funkin-vasion-rewritten-switch.zip
	@cd build/switch; zip -9 -r ../release/funkin-vasion-rewritten-switch.zip .

clean:
	@rm -rf build
