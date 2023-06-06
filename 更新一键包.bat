@echo off
title 更新 Mirai 版本

:: maven仓库地址，请不要以斜杠结尾
set maven=https://maven.aliyun.com/repository/central

:main
cls
echo.
echo.  Mirai 摸鱼＆开发交流群: 1047497524
echo.  该脚本由「人间工作P(MrXiaoM)」编写，勿更改版权信息
echo.  请将该脚本置于 Mirai 一键包所在目录下使用
echo.
echo.  你要做什么?
echo.
echo.  [1] 更新 mirai 版本       [2] 打开加群链接
echo.  [3] 退出
echo.
set select = 0
set /p select=输入操作: 
if %select% == 1 goto update
if %select% == 2 start https://jq.qq.com/?_wv=1027^&k=sKJD1F1J
if %select% == 3 exit
goto main

:update
cls
echo.
echo.  ! 更新 mirai 版本
echo.
echo.  你可以在以下网址查看可用版本列表
echo.  https://search.maven.org/artifact/net.mamoe/mirai-core
echo.
echo.  [1] 返回主菜单         [2] 打开该网址
echo.  [其他值] 更新版本
echo.
set miraiVersion = 2
set /p miraiVersion=输入操作: 
if %miraiVersion% == 1 goto main
if %miraiVersion% == 2 start https://search.maven.org/artifact/net.mamoe/mirai-core & goto update
echo.
echo.  确定要更新到 %miraiVersion% 吗?
echo.  脚本将不会检查版本的可用性
echo.
echo.  [1] 确定          [2] 取消
echo.  [3] 返回主菜单
echo.
:update_confirm
set confirm = 0
set /p confirm=输入操作: 
if %confirm% == 1 goto update_process
if %confirm% == 2 goto update
if %confirm% == 3 goto main
goto update_confirm

:update_process
cls
echo.
echo.  正在更新到 %miraiVersion%
echo.
del /F /S onekey-libraries\mirai-*
echo.
set coreUrl=%maven%/net/mamoe/mirai-core-all/%miraiVersion%/mirai-core-all-%miraiVersion%-all.jar
set consoleUrl=%maven%/net/mamoe/mirai-console/%miraiVersion%/mirai-console-%miraiVersion%-all.jar
set terminalUrl=%maven%/net/mamoe/mirai-console-terminal/%miraiVersion%/mirai-console-terminal-%miraiVersion%-all.jar
echo.  下载文件 %coreUrl%
curl --location --output onekey-libraries/mirai-core-all-%miraiVersion%-all.jar %coreUrl%
echo.
echo.  下载文件 %consoleUrl%
curl --location --output onekey-libraries/mirai-console-%miraiVersion%-all.jar %consoleUrl%
echo.
echo.  下载文件 %terminalUrl%
curl --location --output onekey-libraries/mirai-console-terminal-%miraiVersion%-all.jar %terminalUrl%
echo.
echo.  更新执行完成，按任意键返回主菜单
echo.
pause>nul
goto main
