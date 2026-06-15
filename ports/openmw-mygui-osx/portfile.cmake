vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ssunday/mygui
  REF dd93031da72378024b32ee910bbc3eefa761333d
  SHA512 b605036166a25a438b9cd6196aac4aead8985a3cd24b8ba69fb73d66f94378bb80fe48ff5b0c65588e5f13592f1fdb55b8e87fc2bf145ea3241ce1cbc507b81e
)

set(CMAKE_BUILD_TYPE "Release")

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    -DMYGUI_RENDERSYSTEM=1
    -DMYGUI_BUILD_DEMOS=OFF
    -DMYGUI_BUILD_TOOLS=OFF
    -DMYGUI_BUILD_PLUGINS=OFF
    -DMYGUI_DONT_USE_OBSOLETE=ON
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.MIT")
