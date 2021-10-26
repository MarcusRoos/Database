cmake_minimum_required(VERSION 3.15)
project(PostgreSQLTest)

set(CMAKE_CXX_STANDARD 14)

add_executable(PostgreSQLTest main.cpp)

set(PostgreSQL_INCLUDE_DIR "C:/Program Files (x86)/PostgreSQL/10/include")
set(PostgreSQL_LIBRARY_DIR "C:/Program Files (x86)/PostgreSQL/10/lib")
set(PostgreSQL_TYPE_INCLUDE_DIR "C:/Program Files (x86)/PostgreSQL/10/include/server/catalog")

# This command attempts to find the library, REQUIRED argument is optional
find_package(PostgreSQL REQUIRED)

# Add include directories to your target.
# PRIVATE is useful with multi-target projects - see documentation of target_include_directories for more info
target_include_directories(PostgreSQLTest PRIVATE ${PostgreSQL_INCLUDE_DIRS})

# Add libraries to link your target against.
# Again, PRIVATE is important for multi-target projects
target_link_libraries(PostgreSQLTest PRIVATE ${PostgreSQL_LIBRARIES})