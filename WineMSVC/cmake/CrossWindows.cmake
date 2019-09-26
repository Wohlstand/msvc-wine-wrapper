set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 6.1.7601)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_CROSSCOMPILING 1)

set(CMAKE_C_COMPILER wx-cl)
set(CMAKE_CXX_COMPILER wx-cl)
set(CMAKE_LINKER wx-link)
set(CMAKE_MT wx-mt)
set(CMAKE_RC_COMPILER wx-rc)

# Don't try to run compiler check, otherwise, it may just stuck
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)

include(Platform/Windows)

