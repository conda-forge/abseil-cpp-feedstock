mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
	  -DCMAKE_PREFIX_PATH=${PREFIX} \
	  -DCMAKE_INSTALL_LIBDIR=lib \
	  -DCMAKE_BUILD_TYPE=Release \
	  # NOTE: -fPIC is needed in order for abseil's
	  # static libraries to play well with dynamically
	  # loaded plugins (e.g., python modules).
	  -DCMAKE_CXX_FLAGS=-fPIC \
	  ..
make -j${CPU_COUNT}
make install
