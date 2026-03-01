@echo off
chcp 65001

set /p operator=(- + / * exit):
set /p number1=Первое число:
set /p number2=Второе число:

if "%operator%"=="+" (
     set /a result=number1+number2
) else if "%operator%"=="-" (
     set /a result=number1-number2
) else if "%operator%"=="/" (
     set /a result=number1/number2
) else if "%operator%"=="*" (
     set /a result=number1*number2
) else if "%operator%"=="exit" (
     goto exit
)

echo Ответ: %result%

pause

:exit
exit
