@echo on

mkdir build
cd build

REM regarding ABSL_PROPAGATE_CXX_STD:
REM enforce consuming libraries to compile using at least the same C++ standard, see
REM patches/0006-propagate-requirement-of-C-17-to-consumers.patch as well as
REM https://github.com/abseil/abseil-cpp/blob/20211102.0/CMake/AbseilHelpers.cmake#L257-L273
cmake -GNinja ^
    -DABSL_PROPAGATE_CXX_STD=ON ^
    -DBUILD_SHARED_LIBS=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install
if %ERRORLEVEL% neq 0 exit 1
