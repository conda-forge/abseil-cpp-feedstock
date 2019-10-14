mkdir -p build
cd build

# NOTE: -fPIC is needed in order for abseil's
# static libraries to play well with dynamically
# loaded plugins (e.g., python modules).
export CXXFLAGS="$CXXFLAGS -fPIC"

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
	  -DCMAKE_PREFIX_PATH=${PREFIX} \
	  -DCMAKE_INSTALL_LIBDIR=lib \
	  -DCMAKE_BUILD_TYPE=Release \
	  ..

make -j${CPU_COUNT} VERBOSE=1

make install
