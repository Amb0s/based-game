@echo off

REM User settings
REM If you want paths relative to the .bat script's location, use %CD% or %~dp0, or use the full file paths.
REM However you do it, you MUST include a `\` at the end. %~dp0 appends a `\` at the end, %CD% does not.
REM Do not add quotation marks around your folder or file names.

set src=%~dp0
set love=C:\Program Files\LOVE\
set build=%~dp0
set name=based_game

set output=%love%%name%
powershell Compress-Archive -Path '%src%*' -DestinationPath '%output%.zip' -Force
move "%output%.zip" "%output%.love"
copy /b "%love%love.exe"+"%output%.love" "%build%%name%.exe"
xcopy "%love%license.txt" "%build%" /r /q
xcopy "%love%love.dll" "%build%" /r /q
xcopy "%love%SDL2.dll" "%build%" /r /q
xcopy "%love%lua51.dll" "%build%" /r /q
xcopy "%love%OpenAL32.dll" "%build%" /r /q
xcopy "%love%mpg123.dll" "%build%" /r /q
xcopy "%love%msvcp120.dll" "%build%" /r /q
xcopy "%love%msvcr120.dll" "%build%" /r /q
del "%output%.love"

