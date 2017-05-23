:: lfree
:: 2017-5-17 16:03:39


@ECHO OFF

SET SelfFolder=%~dp0
SET BinFolder=%SelfFolder%windows\bin
SET NewPath=%BinFolder%;%PATH%

ECHO %PATH% | FINDSTR /C:"%BinFolder%" >NUL && (
    ECHO Already done, enjoy now!
    GOTO :End
) || (
    CALL :SetPath
    ECHO Setup successfully, enjoy! :)
    GOTO :End
)

:SetPath
SETX PATH "%NewPath%" >NUL
SET PATH=%NewPath%
GOTO :EOF
                
:End
ECHO.
@PAUSE
