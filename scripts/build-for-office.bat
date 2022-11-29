cd ..\..

if exist .\.install\ (rmdir /s /q .\.install)



if exist .\.build\Win32_x64_Chakra_D3D11\Debug\ (rmdir /s /q .\.build\Win32_x64_Chakra_D3D11\Debug)
cmake -B .\.build\Win32_x64_Chakra_D3D11\Debug -A x64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=Debug -D CMAKE_INSTALL_PREFIX=.\.install\x64\Debug
cmake --build .\.build\Win32_x64_Chakra_D3D11\Debug --config Debug --parallel 20
cmake --build .\.build\Win32_x64_Chakra_D3D11\Debug --config Debug --target INSTALL

if exist .\.build\Win32_x64_Chakra_D3D11\Release\ (rmdir /s /q .\.build\Win32_x64_Chakra_D3D11\Release)
cmake -B .\.build\Win32_x64_Chakra_D3D11\Release -A x64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=RelWithDebInfo -D CMAKE_INSTALL_PREFIX=.\.install\x64\Release
cmake --build .\.build\Win32_x64_Chakra_D3D11\Release --config RelWithDebInfo --parallel 20
cmake --build .\.build\Win32_x64_Chakra_D3D11\Release --config RelWithDebInfo --target INSTALL



@REM The x86 builds are not needed for Office development right now.

@REM if exist .\.build\Win32_x86_Chakra_D3D11\Debug\ (rmdir /s /q .\.build\Win32_x86_Chakra_D3D11\Debug)
@REM cmake -B .\.build\Win32_x86_Chakra_D3D11\Debug -A Win32 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=Debug -D CMAKE_INSTALL_PREFIX=.\.install\Win32\Debug
@REM cmake --build .\.build\Win32_x86_Chakra_D3D11\Debug --config Debug --parallel 20
@REM cmake --build .\.build\Win32_x86_Chakra_D3D11\Debug --config Debug --target INSTALL

@REM if exist .\.build\Win32_x86_Chakra_D3D11\Release\ (rmdir /s /q .\.build\Win32_x86_Chakra_D3D11\Release)
@REM cmake -B .\.build\Win32_x86_Chakra_D3D11\Release -A Win32 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=RelWithDebInfo -D CMAKE_INSTALL_PREFIX=.\.install\Win32\Release
@REM cmake --build .\.build\Win32_x86_Chakra_D3D11\Release --config RelWithDebInfo --parallel 20
@REM cmake --build .\.build\Win32_x86_Chakra_D3D11\Release --config RelWithDebInfo --target INSTALL



@REM The UWP builds are not needed for Office development right now.
@REM I haven't gotten the UWP builds to work on the command line, yet. There are issues with certificates that get resolved when opening the solution in Visual Studio.
@REM There may be some clues on how to get the certificates working on the command line only here: https://stackoverflow.com/questions/48509114/how-to-create-a-working-trusted-and-or-self-signed-certificate-for-a-windows-10

@REM if exist .\.build\UWP_arm64_Chakra_D3D11\Debug\ (rmdir /s /q .\.build\UWP_arm64_Chakra_D3D11\Debug)
@REM cmake -B .\.build\UWP_arm64_Chakra_D3D11\Debug -A arm64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=Debug -D CMAKE_INSTALL_PREFIX=.\.install\ARM64\Debug -D CMAKE_SYSTEM_NAME=WindowsStore -D CMAKE_SYSTEM_VERSION=10.0
@REM cmake --build .\.build\UWP_arm64_Chakra_D3D11\Debug --config Debug --parallel 20
@REM cmake --build .\.build\UWP_arm64_Chakra_D3D11\Debug --config Debug --target INSTALL

@REM if exist .\.build\UWP_arm64_Chakra_D3D11\Release\ (rmdir /s /q .\.build\UWP_arm64_Chakra_D3D11\Release)
@REM cmake -B .\.build\UWP_arm64_Chakra_D3D11\Release -A arm64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=RelWithDebInfo -D CMAKE_INSTALL_PREFIX=.\.install\ARM64\Release -D CMAKE_SYSTEM_NAME=WindowsStore -D CMAKE_SYSTEM_VERSION=10.0
@REM cmake --build .\.build\UWP_arm64_Chakra_D3D11\Release --config RelWithDebInfo --parallel 20
@REM cmake --build .\.build\UWP_arm64_Chakra_D3D11\Release --config RelWithDebInfo --target INSTALL



@REM The arm64 builds are not needed for Office development right now.

@REM if exist .\.build\Win32_arm64_Chakra_D3D11\Debug\ (rmdir /s /q .\.build\Win32_arm64_Chakra_D3D11\Debug)
@REM cmake -B .\.build\Win32_arm64_Chakra_D3D11\Debug -A arm64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=Debug -D CMAKE_INSTALL_PREFIX=.\.install\ARM64\Debug
@REM cmake --build .\.build\Win32_arm64_Chakra_D3D11\Debug --config Debug --parallel 20
@REM cmake --build .\.build\Win32_arm64_Chakra_D3D11\Debug --config Debug --target INSTALL

@REM if exist .\.build\Win32_arm64_Chakra_D3D11\Release\ (rmdir /s /q .\.build\Win32_arm64_Chakra_D3D11\Release)
@REM cmake -B .\.build\Win32_arm64_Chakra_D3D11\Release -A arm64 -D NAPI_JAVASCRIPT_ENGINE=Chakra -D GRAPHICS_API=D3D11 -D CMAKE_CONFIGURATION_TYPES=RelWithDebInfo -D CMAKE_INSTALL_PREFIX=.\.install\ARM64\Release
@REM cmake --build .\.build\Win32_arm64_Chakra_D3D11\Release --config RelWithDebInfo --parallel 20
@REM cmake --build .\.build\Win32_arm64_Chakra_D3D11\Release --config RelWithDebInfo --target INSTALL



if exist .\.office\lib\x64 (rmdir /s /q .\.office\lib\x64)
robocopy .\.install\x64\Debug\lib .\.office\lib\x64\Debug /E
robocopy .\.install\x64\Release\lib .\.office\lib\x64\Release /E



@echo;
pause
