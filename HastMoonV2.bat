@echo off
setlocal EnableDelayedExpansion

set LUA_FILE=output.lua
set seen=

echo return { > %LUA_FILE%

for /r %%F in (*.ytd) do (
    set "fullpath=%%F"
    rem Extracting file name without extension
    for %%A in ("!fullpath!") do set "filename=%%~nA"
    
    rem Remove +hi from the file name
    set "filename=!filename:+hi=!"

    rem Replace underscores (_) with spaces
    set "name=!filename:_= !"

    rem Check if we've seen this name before
    if not "!seen!" == "!seen!;!name!" (
        set seen=!seen!;!name!
    echo "    { model = '!name!', name = '!name!', brand = '!name!', price = 0, category = 'donate', type = 'automobile', shop = 'pdm' }," >> %LUA_FILE%

    )
)

echo } >> %LUA_FILE%

echo -- Moon Ozel Yapilmistir -- >> %LUA_FILE%
echo -- Hast [Kedue] -- >> %LUA_FILE%
echo -- Iletisim Icin DC: Kedue -- >> %LUA_FILE%
echo -- Yada discord.gg/moonrp -- >> %LUA_FILE%
echo Done.