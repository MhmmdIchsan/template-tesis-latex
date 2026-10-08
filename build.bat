@REM ==================================================================
@REM  Kompilasi naskah tesis FMIPA USK (Program Magister)
@REM  Penulis: Muhammad Ichsan (NPM 260820701100007)
@REM  (c) 2026 Muhammad Ichsan - hak cipta dilindungi undang-undang
@REM  Mengikuti Panduan TA/Tesis FMIPA USK tahun 2024
@REM  Terakhir diperbarui: 8 Oktober 2026
@REM ==================================================================
@REM
@REM  Pemakaian:
@REM    .\build.bat                -> tesis.pdf              (naskah finals)
@REM    .\build.bat sempro         -> seminar-proposal.pdf
@REM    .\build.bat semhas         -> seminar-hasil.pdf
@REM    .\build.bat finals         -> tesis.pdf
@REM    .\build.bat all            -> ketiganya
@REM    .\build.bat clean          -> hapus seluruh berkas hasil
@REM ------------------------------------------------------------------
@echo off
setlocal

set NAMA_SEMPRO=seminar-proposal
set NAMA_SEMHAS=seminar-hasil
set NAMA_SIDANG=tesis

set TAHAP=%~1
if "%TAHAP%"=="" set TAHAP=finals

if /I "%TAHAP%"=="clean" goto clean
if /I "%TAHAP%"=="all"   goto all
if /I "%TAHAP%"=="sempro" goto sempro
if /I "%TAHAP%"=="semhas" goto semhas
if /I "%TAHAP%"=="finals" goto finals
if /I "%TAHAP%"=="skripsi" goto finals
if /I "%TAHAP%"=="sidang" goto finals

echo Tahap tidak dikenal: %TAHAP%
echo Pilihan: sempro ^| semhas ^| finals ^| all ^| clean
exit /b 1

:bersih
del /q *.aux *.bbl *.blg *.log *.toc *.lot *.lof *.lol *.out *.fdb_latexmk *.fls 2>nul
del /q include\*.aux 2>nul
goto :eof

:kompil
@REM argumen: %1 = berkas .tex, %2 = nama PDF
echo.
echo ==============================================
echo  Kompilasi: %1.tex  -^>  %2.pdf
echo ==============================================
call :bersih
pdflatex -interaction=nonstopmode --shell-escape -jobname=%2 %1.tex >nul
bibtex %2 >nul 2>&1
pdflatex -interaction=nonstopmode --shell-escape -jobname=%2 %1.tex >nul
pdflatex -interaction=nonstopmode --shell-escape -jobname=%2 %1.tex
echo.
echo Selesai: %2.pdf
goto :eof

:sempro
call :kompil %NAMA_SEMPRO% %NAMA_SEMPRO%
goto :eof

:semhas
call :kompil %NAMA_SEMHAS% %NAMA_SEMHAS%
goto :eof

:finals
call :kompil %NAMA_SIDANG% %NAMA_SIDANG%
goto :eof

:all
call :kompil %NAMA_SEMPRO% %NAMA_SEMPRO%
call :kompil %NAMA_SEMHAS% %NAMA_SEMHAS%
call :kompil %NAMA_SIDANG% %NAMA_SIDANG%
goto :eof

:clean
call :bersih
del /q %NAMA_SIDANG%.pdf %NAMA_SEMPRO%.pdf %NAMA_SEMHAS%.pdf 2>nul
echo Berkas hasil kompilasi dihapus.
goto :eof