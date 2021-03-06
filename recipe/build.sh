# Removes -std=c++XX from build ${CXXFLAGS}.
export CXXFLAGS=$(echo "${CXXFLAGS}" | sed -E 's@-std=c\+\+[^ ]+@@g')

./configure --prefix="${PREFIX}"
make -j"${CPU_COUNT}"
make -j"${CPU_COUNT}" install
