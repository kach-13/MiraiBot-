@echo off
title ���� Mirai �汾

:: maven�ֿ��ַ���벻Ҫ��б�ܽ�β
set maven=https://maven.aliyun.com/repository/central

:main
cls
echo.
echo.  Mirai ���㣦��������Ⱥ: 1047497524
echo.  �ýű��ɡ��˼乤��P(MrXiaoM)����д������İ�Ȩ��Ϣ
echo.  �뽫�ýű����� Mirai һ��������Ŀ¼��ʹ��
echo.
echo.  ��Ҫ��ʲô?
echo.
echo.  [1] ���� mirai �汾       [2] �򿪼�Ⱥ����
echo.  [3] �˳�
echo.
set select = 0
set /p select=�������: 
if %select% == 1 goto update
if %select% == 2 start https://jq.qq.com/?_wv=1027^&k=sKJD1F1J
if %select% == 3 exit
goto main

:update
cls
echo.
echo.  ! ���� mirai �汾
echo.
echo.  �������������ַ�鿴���ð汾�б�
echo.  https://search.maven.org/artifact/net.mamoe/mirai-core
echo.
echo.  [1] �������˵�         [2] �򿪸���ַ
echo.  [����ֵ] ���°汾
echo.
set miraiVersion = 2
set /p miraiVersion=�������: 
if %miraiVersion% == 1 goto main
if %miraiVersion% == 2 start https://search.maven.org/artifact/net.mamoe/mirai-core & goto update
echo.
echo.  ȷ��Ҫ���µ� %miraiVersion% ��?
echo.  �ű���������汾�Ŀ�����
echo.
echo.  [1] ȷ��          [2] ȡ��
echo.  [3] �������˵�
echo.
:update_confirm
set confirm = 0
set /p confirm=�������: 
if %confirm% == 1 goto update_process
if %confirm% == 2 goto update
if %confirm% == 3 goto main
goto update_confirm

:update_process
cls
echo.
echo.  ���ڸ��µ� %miraiVersion%
echo.
del /F /S onekey-libraries\mirai-*
echo.
set coreUrl=%maven%/net/mamoe/mirai-core-all/%miraiVersion%/mirai-core-all-%miraiVersion%-all.jar
set consoleUrl=%maven%/net/mamoe/mirai-console/%miraiVersion%/mirai-console-%miraiVersion%-all.jar
set terminalUrl=%maven%/net/mamoe/mirai-console-terminal/%miraiVersion%/mirai-console-terminal-%miraiVersion%-all.jar
echo.  �����ļ� %coreUrl%
curl --location --output onekey-libraries/mirai-core-all-%miraiVersion%-all.jar %coreUrl%
echo.
echo.  �����ļ� %consoleUrl%
curl --location --output onekey-libraries/mirai-console-%miraiVersion%-all.jar %consoleUrl%
echo.
echo.  �����ļ� %terminalUrl%
curl --location --output onekey-libraries/mirai-console-terminal-%miraiVersion%-all.jar %terminalUrl%
echo.
echo.  ����ִ����ɣ���������������˵�
echo.
pause>nul
goto main
