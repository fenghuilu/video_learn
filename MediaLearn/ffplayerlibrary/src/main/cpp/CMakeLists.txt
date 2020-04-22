# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.4.1)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.
#设定一个目录
#aux_source_directory(lame LAME_SRC_DIR)

#将前面目录下所有的文件都添加进去
#add_library(lame SHARED SimpleLame.cpp ${LAME_SRC_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/../../../libs/${ANDROID_ABI})

set(ffmpeg_lib_dir ${CMAKE_SOURCE_DIR}/../jniLibs)

aux_source_directory(. ffplayer_source_dir)

include_directories(${CMAKE_SOURCE_DIR}/include)

add_library(
        avcodec
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        avcodec
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libavcodec.so
)

add_library(
        avfilter
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        avfilter
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libavfilter.so
)

add_library(
        avformat
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        avformat
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libavformat.so
)

add_library(
        avutil
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        avutil
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libavutil.so
)

add_library(
        swresample
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        swresample
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libswresample.so
)

add_library(
        swscale
        SHARED
        IMPORTED
)

#指定库的位置
set_target_properties(
        swscale
        PROPERTIES IMPORTED_LOCATION
        ${ffmpeg_lib_dir}/${ANDROID_ABI}/libswscale.so
)


add_library( # Sets the name of the library.
        FFplayer
        #
        #             # Sets the library as a shared library.
        SHARED
        #
        #             # Provides a relative path to your source file(s).
        ${ffplayer_source_dir})

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
              log-lib
#               Specifies the name of the NDK library that
#               you want CMake to locate.
              log )

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
                       FFplayer
                       avcodec
                       avfilter
                       avformat
                       avutil
                       swresample
                       swscale
#                       # Links the target library to the log library
#                       # included in the NDK.
                       ${log-lib} )
