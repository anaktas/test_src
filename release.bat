@ECHO OFF
ECHO Moving executable to bin folder...
xcopy final_thesis.exe bin
ECHO Creating release folders...
cd K:\thesis_versions
mkdir %1
cd %1
mkdir Resources
mkdir bin
mkdir src
ECHO Done.
cd %~dp0
ECHO Copying files to release folders...
ECHO Copying executable...
xcopy final_thesis.exe K:\thesis_versions\%1\bin
ECHO Done.
ECHO Copying Resources...
ECHO Copying .ico...
cd Resources
xcopy favicon.ico K:\thesis_versions\%1\Resources
ECHO Done.
ECHO Copying Shortcut...
xcopy final_thesis.lnk K:\thesis_versions\%1\Resources
ECHO Done.
ECHO Copying source code..
cd ..
xcopy *.m K:\thesis_versions\%1\src
xcopy *.fig K:\thesis_versions\%1\src
ECHO Done.
ECHO Copying installation batch file...
xcopy install.bat K:\thesis_versions\%1
ECHO Done.
ECHO Compressing release folder...
cd K:\thesis_versions
7z a -tzip %1.zip "%1"
ECHO Done.
cd %~dp0
