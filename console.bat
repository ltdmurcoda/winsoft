@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set "v=0.0.0"
set "b="
set "siteurl=ltdmurcoda.github.io/winsoft"

if "%1"=="admin" (
    goto first
) else (
    powershell -NoProfile -Command "Start-Process 'cmd.exe' -ArgumentList '/c \"\"%~f0\" admin\"' -Verb RunAs"
    exit
)

:first
if exist first (
  cls
  call :PrintWhite "Добро пожаловать в WinSoft!"
  echo:
  call :PrintWhite "Начинаю настройку..."
  del first
  if exist zapret-discord-youtube/service.bat (
    set "zapret-discord-youtube=yes"
    set "version-zapret-discord-youtube=1.9.7"
    set "beta-zapret-discord-youtube=no"
    ) else (
    set "zapret-discord-youtube=no"
    )
  call :PrintWhite "Настройка успешно выполнена!"
  timeout 1 > nul
  goto start
  ) else (
  goto start
)

:start
call :wifi
if "%wifi%"=="yes" (
  @rem Yandex Metrika
  powershell -Command "Invoke-WebRequest -Uri 'https://mc.yandex.ru/watch/107056008' -Method Get"
  ) else (
  cls
  call :PrintRed "[!] Отсутствует подключение к интернету!"
  call :PrintRed "Нажмите «ENTER» для обновления информации."
  set /p startnotwifi=""
  goto start
)

:menu

cls
set "choice=null"

call :PrintGreen "===================="
call :PrintGreen "   WinSoft v%v%%b%  "
call :PrintGreen "===================="
echo:
call :PrintWhite "Главное меню: "
echo:
echo 1. О программе
echo 0. Выход
echo:
set /p choice=Ваш выбор (0-1): 

if "%choice%"=="1" goto about
if "%choice%"=="0" goto exit
goto menu

:about

cls
set "choice=null"

call :PrintGreen "================="
call :PrintGreen "   О программе   "
call :PrintGreen "================="
echo:
call :PrintWhite "Информация: "
echo:
echo Версия: 1.0.0
echo Основной файл: console.bat
echo Copyright: © 2026 OOO «MurCoda»
echo Сайт: ltdmurcoda.github.io/winsoft
echo:
call :PrintWhite "Меню: "
echo:
echo 1. Оставить данные о том, как вы нашли WinSoft
echo 2. Наш сайт
echo 3. Посмотреть все версии (на сайте)
echo 4. Помочь нашей программе (небольшой спам просмотрами сайта и мы дадим вам 1000 CATS
echo 0. Назад
echo:
set /p choice=Ваш выбор (0-4): 

if "%choice%"=="1" goto onlinetestpad1
if "%choice%"=="2" goto homesite
if "%choice%"=="3" goto downloadsite
if "%choice%"=="4" goto watchyamspam
if "%choice%"=="0" goto menu
goto about

:onlinetestpad1
set "choice=null"
start "" "ltdmurcoda.github.io/winsoft/onlinetestpad1.html"
cls
call :PrintRed "Нажмите «ENTER» чтобы вернуться на главную."
set /p choice=""
goto menu

:homesite
set "choice=null"
start "" "ltdmurcoda.github.io/winsoft/"
cls
call :PrintRed "Нажмите «ENTER» чтобы вернуться на главную."
set /p choice=""
goto menu

:downloadsite
set "choice=null"
start "" "ltdmurcoda.github.io/winsoft/download.html"
cls
call :PrintRed "Нажмите «ENTER» чтобы вернуться на главную."
set /p choice=""
goto menu

:watchyamspam
cls
call :wifi
if "%wifi%"=="yes" (
  call :PrintRed "Начинаю..."
    powershell -Command "try { Invoke-WebRequest -Uri 'https://mc.yandex.ru/watch/107056008' -Method Get -TimeoutSec 5 } catch { }"
    cls
    call :PrintGreen "Выполнено! Напишите: moskowcat.t.me код: ADUWOXSOZ28#39&-46"
    set "choice=null"
    call :PrintRed "Нажмите «ENTER» чтобы вернуться на главную."
    set /p choice=""
    goto menu
    ) else (
    set "choice=null"
    cls
    call :PrintRed "[!] Отсутствует подключение к интернету!"
    call :PrintRed "Нажмите «ENTER» для обновления информации."
    set /p choice=""
    goto watchyamspam
)

:wifi
set "wifi=null"
ping -n 1 gov.ru > nul
if %errorlevel% equ 0 (
    set "wifi=yes"
) else (
    set "wifi=no"
)
exit /b

:exit
exit

:PrintGreen
powershell -NoProfile -Command "Write-Host \"%~1\" -ForegroundColor Green"
exit /b

:PrintRed
powershell -NoProfile -Command "Write-Host \"%~1\" -ForegroundColor Red"
exit /b

:PrintYellow
powershell -NoProfile -Command "Write-Host \"%~1\" -ForegroundColor Yellow"
exit /b

:PrintWhite
powershell -NoProfile -Command "Write-Host \"%~1\" -ForegroundColor White"
exit /b
