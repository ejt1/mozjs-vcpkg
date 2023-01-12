
if(VCPKG_CRT_LINKAGE STREQUAL "static")
    set(MOZJS_STATIC_LIB ON)
    set(MOZJS_STATIC_RTL ON)
else()
    set(MOZJS_STATIC_LIB OFF)
    set(MOZJS_STATIC_RTL OFF)
endif()
    
set(MOZJS_ESR_VER "esr45")

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ejt1/spidermonkey-cmake
  REF c3913fed23c27114e698e83fea957b4277cd7cc4
  SHA512 bbaed7c55040dd8d3da43a0ed0b647ea30cfef888257e9909a5d8ae821cb788ffb900565811aeaa055c1a1be251c47459b11c88bb788f922fcfc58bdc1e2d3ae
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DMOZJS_ESR_VER=${MOZJS_ESR_VER}
    -DMOZJS_STATIC_LIB=${MOZJS_STATIC_LIB}
    -DMOZJS_STATIC_RTL=${MOZJS_STATIC_RTL}
)
vcpkg_cmake_install()