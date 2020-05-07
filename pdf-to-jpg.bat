@echo off

setlocal enableextensions enabledelayedexpansion

set DPI=300
set ALPHABITS=2
set QUALITY=80
set FIRSTPAGE=1
set LASTPAGE=9999
set MEMORY=300
set GS="bin/gswin32c.exe"

set PDFFILE=""
set JPGFILE=""

set /a count = 1

@FOR /f "delims=" %%f IN ('dir /b /s "C:\XXXXXXXXXXXXXXX\*.pdf"') DO (

	set /a count += 1

	echo %%f
	echo.
	
	set PDFFILE=%%f
	set JPGFILE=ArquivosConvertidos\!count!_%%%d.jpg

	echo PDFFILE !PDFFILE!
	echo JPGFILE !JPGFILE!
	
	echo Carregando %GS%...
	echo.

	%~dp0%GS% -sDEVICE=jpeg -sOutputFile=!JPGFILE! -r%DPI% -dNOPAUSE -dFirstPage=%FIRSTPAGE% -dLastPage=%LASTPAGE% -dJPEGQ=%QUALITY% -dGraphicsAlphaBits=%ALPHABITS%  -dTextAlphaBits=%ALPHABITS%  -dNumRenderingThreads=4 -dBufferSpace=%MEMORY%000000  -dBandBufferSpace=%MEMORY%000000 -c %MEMORY%000000 setvmthreshold -f !PDFFILE! -c quit
	
	echo -----------------------
	echo -----------------------
	echo.
	echo.

)

echo Finished.
pause
