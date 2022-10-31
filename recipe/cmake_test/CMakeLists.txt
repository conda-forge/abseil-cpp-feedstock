project(cf_dummy LANGUAGES CXX)
cmake_minimum_required(VERSION 3.12)
find_package(absl REQUIRED CONFIG)

add_executable(flags_example flags_example.cpp)
target_link_libraries(flags_example absl::flags absl::strings)
