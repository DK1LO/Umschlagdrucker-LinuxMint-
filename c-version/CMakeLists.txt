cmake_minimum_required(VERSION 3.16)
project(dk1lo_umschlagdrucker C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED IMPORTED_TARGET gtk+-3.0)
pkg_check_modules(PANGOCAIRO REQUIRED IMPORTED_TARGET pangocairo)
pkg_check_modules(CAIROPDF REQUIRED IMPORTED_TARGET cairo-pdf)

add_executable(dk1lo-umschlagdrucker main.c)
target_link_libraries(dk1lo-umschlagdrucker PRIVATE PkgConfig::GTK3 PkgConfig::PANGOCAIRO PkgConfig::CAIROPDF m)
target_compile_options(dk1lo-umschlagdrucker PRIVATE -Wall -Wextra)
set_target_properties(dk1lo-umschlagdrucker PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
