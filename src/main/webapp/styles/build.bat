@echo off
set javac=javac
set java=java
set suffix=.java
set classpath=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar

set /p codePath=
cd /d %codePath%
set /p className=

%javac% %className%%suffix%
if errorlevel 1 goto error
if errorlevel 0 goto run

:run
%java% %className%

:error