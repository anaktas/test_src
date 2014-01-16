@ECHO OFF
ECHO Installation procedure...
ECHO Creating the applications folder...
cd %systemdrive%
mkdir nav
cd nav
mkdir Resources
mkdir bin
mkdir src
ECHO Done.
ECHO Copying files...
cd %~dp0
ECHO Copying executable...
cd bin
xcopy final_thesis.exe %systemdrive%\nav\bin
ECHO Done.
ECHO Copying Resources...
ECHO Copying .ico file...
cd ../Resources
xcopy favicon.ico %systemdrive%\nav\Resources
ECHO Done.
ECHO Copying shortcut...
xcopy final_thesis.lnk %systemdrive%\nav\Resources
ECHO Done.
ECHO Copying source code..
cd ../src
xcopy *.m %systemdrive%\nav\src
xcopy *.fig %systemdrive%\nav\src
ECHO Making a shortcut into Desktop...
cd %systemdrive%\nav\Resources
xcopy final_thesis.lnk %systemdrive%\DOCUME~1\%USERNAME%\Desktop
ECHO Done.
cd %~dp0
pause
