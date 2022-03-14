SETLOCAL ENABLEDELAYEDEXPANSION
set /p version=<VERSION.txt
mkdir tmp
cd tmp
mkdir PlanetsDontSoundLikeThis
cp ../Info.json PlanetsDontSoundLikeThis
cp ../PlanetsDontSoundLikeThis/bin/Release/PlanetsDontSoundLikeThis.dll PlanetsDontSoundLikeThis

cd PlanetsDontSoundLikeThis
for /f "delims=" %%a in (Info.json) do (
    SET s=%%a
    SET s=!s:$VERSION=%version%!
    echo !s!
)>>"InfoChanged.json"
rm Info.json
mv InfoChanged.json Info.json
cd ..

tar -a -c -f PlanetsDontSoundLikeThis-%version%.zip PlanetsDontSoundLikeThis
mv PlanetsDontSoundLikeThis-%version%.zip ..
cd ..
rm -rf tmp
pause
