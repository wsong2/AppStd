@echo off
REM *Make or Run Java Program (v1.0)
setlocal

if "%1" == "" (   
    echo Usage: %~n0 JavaFiles  or  %~n0 Class [Args]
    goto END
)

set currfldr=%CD%
set clsfldr="%currfldr%\classes"
if not exist %clsfldr% (
    echo Directory 'classes' not created yet.
    goto END
)

set MSJDBC=C:\MyProjects\user-libraries\sqljdbc_9.2\enu
set JDBCJAR=%MSJDBC%\mssql-jdbc-9.2.0.jre15.jar
set CLASSPATH=%clsfldr%;%JDBCJAR%

if /i "%~x1" == ".java" (
REM	javac -Xlint:unchecked -Xlint:deprecation -encoding UTF-8 -d %clsfldr% %*
	javac -cp %JDBCJAR% -Xlint:unchecked -Xlint:deprecation -encoding UTF-16 -d %clsfldr% %*
	goto END
)

REM --- separate 1st arguement and the rest
for /F "tokens=1,*" %%a in ("%*") do (
    set clsn=%%a
    set args=%%b
)

REM --- find full class name
for /F "tokens=1 delims=*" %%n in ('dir /s /b %clsn%.class') do set parent=%%~dpn
if "%parent%" == "" goto END

:LOOP
REM --- remove trailing '\'
set paren=%parent:~0,-1%
set parent="%paren%"
if %parent% == %clsfldr% goto RUN

REM --- find package name through relative subfolders
cd %parent%
for /D %%d in (%parent%) do (
	set elt=%%~nd
	set parent=%%~dpd
)
set pkgn=%elt%.%pkgn%
goto LOOP

:RUN

cd %currfldr%
java -Dfile.encoding=UTF-16 -Djava.library.path="%MSJDBC%\auth\x64" -cp %CLASSPATH%  %pkgn%%clsn% %args%

:END

