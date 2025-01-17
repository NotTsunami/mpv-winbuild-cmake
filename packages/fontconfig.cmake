ExternalProject_Add(fontconfig
    DEPENDS
        expat
        freetype2
        zlib
        libiconv
    GIT_REPOSITORY https://github.com/freedesktop/fontconfig.git
    SOURCE_DIR ${SOURCE_LOCATION}
    UPDATE_COMMAND ""
    GIT_REMOTE_NAME origin
    GIT_TAG main
    GIT_SHALLOW 1
    PATCH_COMMAND ${EXEC} git am --3way ${CMAKE_CURRENT_SOURCE_DIR}/fontconfig-*.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --enable-iconv
        --disable-shared
        --disable-docs
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(fontconfig)
autogen(fontconfig)
cleanup(fontconfig install)
