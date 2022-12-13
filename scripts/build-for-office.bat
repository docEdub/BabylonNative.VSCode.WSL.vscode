pushd ..\..

if exist .\.install\ (
    rmdir /s /q .\.install
)


pushd Apps
start /wait cmd /c npm install
popd ..

if exist .\.build\Win32_x64_Napi-c-external_D3D11\Debug\ (
    rmdir /s /q .\.build\Win32_x64_Napi-c-external_D3D11\Debug
)

@REM v142 == Visual Studio 2019 toolchain.
@REM v143 == Visual Studio 2022 toolchain.
cmake -B .\.build\Win32_x64_Napi-c-external_D3D11\Debug -A x64 -T "v142" ^
    -DNAPI_JAVASCRIPT_ENGINE=Napi-c-external ^
    -DGRAPHICS_API=D3D11 ^
    -DCMAKE_CONFIGURATION_TYPES=Debug ^
    -DBABYLON_NATIVE_BUILD_APPS=Off ^
    -DCMAKE_INSTALL_PREFIX=.\.install\x64\Debug
if  %ERRORLEVEL% NEQ 0 (goto error)
cmake --build .\.build\Win32_x64_Napi-c-external_D3D11\Debug --config Debug --parallel 20
if  %ERRORLEVEL% NEQ 0 (goto error)
cmake --build .\.build\Win32_x64_Napi-c-external_D3D11\Debug --config Debug --target INSTALL
if  %ERRORLEVEL% NEQ 0 (goto error)

@REM if exist .\.build\Win32_x64_Napi-c-external_D3D11\Release\ (
    @REM rmdir /s /q .\.build\Win32_x64_Napi-c-external_D3D11\Release
@REM )
@REM cmake -B .\.build\Win32_x64_Napi-c-external_D3D11\Release -A x64 -T "v142" ^
    @REM -DNAPI_JAVASCRIPT_ENGINE=Napi-c-external ^
    @REM -DGRAPHICS_API=D3D11 ^
    @REM -DCMAKE_CONFIGURATION_TYPES=RelWithDebInfo ^
    @REM -DBABYLON_NATIVE_BUILD_APPS=Off ^
    @REM -DCMAKE_INSTALL_PREFIX=.\.install\x64\Release
@REM if  %ERRORLEVEL% NEQ 0 (goto error)
@REM cmake --build .\.build\Win32_x64_Napi-c-external_D3D11\Release --config RelWithDebInfo --parallel 20
@REM if  %ERRORLEVEL% NEQ 0 (goto error)
@REM cmake --build .\.build\Win32_x64_Napi-c-external_D3D11\Release --config RelWithDebInfo --target INSTALL
@REM if  %ERRORLEVEL% NEQ 0 (goto error)

if exist .\.office\include\ (
    rmdir /s /q .\.office\include
)
robocopy .\.install\x64\Debug\include .\.office\include /E

if exist .\.office\lib\x64\ (
    rmdir /s /q .\.office\lib\x64
)
robocopy .\.install\x64\Debug\lib .\.office\lib\x64\Debug /E
@REM robocopy .\.install\x64\Release\lib .\.office\lib\x64\Release /E

del .\.office\*.js
copy .\Apps\node_modules\babylonjs\babylon.max.js .\.office\
copy .\Apps\node_modules\babylonjs-loaders\babylonjs.loaders.js .\.office\
copy .\Apps\Playground\Scripts\experience.js .\.office\

popd
goto end

:error
popd
@echo;
@echo Error

:end
@echo;
pause
