# Removes -std=c++XX from build ${CXXFLAGS}.
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
# Ignores irrelevant Clang availability annotations on MacOS: 
# https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
export CXXFLAGS="$(echo "${CXXFLAGS}" | sed -E 's@-std=c\+\+[^ ]+@@g') -D_LIBCPP_DISABLE_AVAILABILITY"

./configure --prefix="${PREFIX}"
make -j"${CPU_COUNT}"
make -j"${CPU_COUNT}" install
