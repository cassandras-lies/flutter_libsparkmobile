:: Initialize submodules and copy CMakeLists.
:: 
:: Can be ran in a regular cmd.exe command prompt.
@echo on

:: Initialize submodules.
cd ..
git submodule update --init --recursive
git submodule foreach "git clean -fxd"
git submodule foreach "git reset --hard"

:: Copy CMakeLists.
copy src\deps\CMakeLists\sparkmobile\CMakeLists.txt src\deps\sparkmobile\
copy src\deps\CMakeLists\secp256k1\CMakeLists.txt src\deps\sparkmobile\secp256k1\

:: apply win specific patch
cd src\deps\sparkmobile
git apply ..\patches\windows\windows_patch.patch
cd ..\boost-cmake
git apply ..\patches\boost-patch.patch
cd ..\openssl-cmake
git apply ..\patches\openssl-cmake-patch.patch

:: Navigate back to scripts.
cd ..\..\..\scripts
