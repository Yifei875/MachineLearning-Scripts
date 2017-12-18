REM cleanup_win.cmd
REM Copyright (c) Microsoft. All rights reserved.

REM kill python and dotnet processes
taskkill /F /IM python.exe /T
taskkill /F /IM dotnet.exe /T

REM close Vienna and any remnants of old installer running
taskkill /F /IM AmlWorkbench.exe /T
taskkill /F /IM installer.windows.exe /T 

REM sleep and wait till the process dies
timeout 5

REM delete local folders
del /F "%HOMEPATH%\Desktop\Azure Machine Learning Workbench.lnk"
rmdir /S /Q %LOCALAPPDATA%\amlworkbench
rmdir /S /Q %LOCALAPPDATA%\amlinstaller
rmdir /S /Q %APPDATA%\AmlWorkbench
