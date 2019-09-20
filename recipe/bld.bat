mkdir build
cd build
cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	  ..

cmake --build . --config Release

cmake --build . --config Release --target install
