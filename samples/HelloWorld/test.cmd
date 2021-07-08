@echo off

::::::::::::::::
:: SCENARIO 1 ::
::::::::::::::::

call :Cleanup
%BFLAT% build %BFLAGS%
if ERRORLEVEL 1 goto :ErrExit

set ErrorCode=100
for /f "usebackq delims=;" %%F in (`HelloWorld`) do (
    if "%%F"=="Hello world!" set ErrorCode=0
)
IF NOT "%ErrorCode%"=="0" goto :ErrExit
echo Scenario 1 passed

::::::::::::::::
:: SCENARIO 2 ::
::::::::::::::::

call :Cleanup
%BFLAT% build %BFLAGS% -o:Hello.exe
if ERRORLEVEL 1 goto :ErrExit

set ErrorCode=100
for /f "usebackq delims=;" %%F in (`Hello Michal`) do (
    if "%%F"=="Hello Michal!" set ErrorCode=0
)
IF NOT "%ErrorCode%"=="0" goto :ErrExit
echo Scenario 2 passed



echo HelloWorld passed

:Cleanup
del *.exe 2>nul
del *.pdb 2>nul
exit /b

:ErrExit
echo Scenario failed!
exit /b 1
