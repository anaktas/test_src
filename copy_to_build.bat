@ECHO OFF
ECHO Copying files to build folder...
ECHO Copying .m files to build folder...
xcopy *.m K:\build_thesis /Y
ECHO Done.
ECHO Copying .fig files to build folder...
xcopy *.fig K:\build_thesis /Y
ECHO Done.
ECHO Copying .bat files to build folder...
xcopy *.bat K:\build_thesis /Y
ECHO Done.
pause