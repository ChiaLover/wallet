CMAKE_MINIMUM_REQUIRED(VERSION 3.14 FATAL_ERROR)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)

project(bls VERSION 1.0.0)

# include headers
include_directories(
        ../../../ios/relic_s/Headers
        ../../../ios/relic_s/Headers/low
        ../../../ios/bls/Headers
)

file(GLOB RELIC_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/relic_s/Headers/*.h)
file(GLOB RELIC_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/relic_s/Sources/*.c)
file(GLOB RELIC_SOURCES_E ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/relic_s/Sources/*.inc)


add_library(
        relic_s
        ${RELIC_HEADERS}
        ${RELIC_SOURCES_E}
        ${RELIC_SOURCES}
)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/)

#include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/)
#find_library(GMP_NAME NAMES libgmp.a gmp)
#find_library(SODIUM_NAME NAMES libsodium.a sodium)

add_library(gmp SHARED IMPORTED)
set_property(TARGET gmp PROPERTY IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/libgmp.so)

add_library(sodium SHARED IMPORTED)
set_property(TARGET sodium PROPERTY IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/libsodium.so)

target_link_libraries(relic_s gmp)

#set_target_properties(
#        relic_s
#        PROPERTIES
#        IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/libgmp.so
#)

file(GLOB BLS_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/bls/Headers/*.hpp)
file(GLOB BLS_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/bls/Source/*.cpp)
file(GLOB WRAPPER_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../../../ios/Runner/wrapper.cpp)
add_library(
        bls
        SHARED
        ${BLS_HEADERS}
        ${BLS_SOURCES}
        ${WRAPPER_SOURCES}
)

target_link_libraries(bls relic_s gmp sodium)

#set_target_properties(
#        bls
#        PROPERTIES
#        IMPORTED_LOCATION
#        ${CMAKE_CURRENT_SOURCE_DIR}/../jniLibs/${CMAKE_ANDROID_ARCH_ABI}/libsodium.so
#)