:: lfree
:: 2017-5-16 14:59:04


@ECHO OFF

:: configurations
SET DB_Host=127.0.0.1
SET DB_Port=3306
SET DB_User=root
SET DB_Pass=ay2016jiayoukeji
SET DB_Name=healthy_id
SET OutputFolder=.\

:: run clean.sql
IF EXIST ".\clean.sql" (
    CALL :Clean
) ELSE (
    ECHO no clean needed
)

:: dump the who db
CALL :Dump

:: remove the 'auto_increment' spec
CALL :RemoveAutoIncrement

:: logic end
GOTO :EOF

:: function: run clean.sql if it exists
:Clean
mysql^
    --host=%DB_Host%^
    --port=%DB_Port%^
    --user=%DB_User%^
    --password=%DB_Pass%^
    --show-warnings=FALSE^
    %DB_Name% < clean.sql
ECHO clean finish
GOTO :EOF

:: function: dump the whole db
:Dump
FOR /F %%x in ('wmic PATH Win32_LocalTime GET /FORMAT:list ^| FINDSTR "="') DO SET %%x
SET Today=%Year%%Month%%Day%
SET FileName=%Today%_full.sql
mysqldump^
    --host=%DB_Host%^
    --port=%DB_Port%^
    --user=%DB_User%^
    --password=%DB_Pass%^
    --result-file=%OutputFolder%\%FileName%^
    %DB_Name%
ECHO dump finish
GOTO :EOF

:: function: remove the 'auto_increment' spec
:RemoveAutoIncrement
ECHO remove auto_increment finish
GOTO :EOF
