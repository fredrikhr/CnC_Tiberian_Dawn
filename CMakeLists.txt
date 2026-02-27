cmake_minimum_required(VERSION 3.30)
project(
    CnC_Tiberian_Dawn
    DESCRIPTION "Command & Conquer Tiberian Dawn"
    HOMEPAGE_URL "https://github.com/electronicarts/CnC_Tiberian_Dawn"
    LANGUAGES C CXX ASM_MASM
)
set(CACHE{CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_DEBUG_INFORMATION_FORMAT_ProgramDatabase}
  TYPE STRING
  VALUE "/Zd"
)
