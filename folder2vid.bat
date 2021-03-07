echo %1
ffmpeg -r 30 -i %1/%%d.png %1.mp4
