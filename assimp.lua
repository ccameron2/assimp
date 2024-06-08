project "assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    buildoptions("/MP")

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    defines {
        "WIN32",
        "_WINDOWS",
        "OPENDDL_STATIC_LIBARY",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_EXPORTER",
        --"ASSIMP_BUILD_NO_GLTF2_IMPORTER",
       --"ASSIMP_BUILD_NO_GLTF2_EXPORTER",
        "ASSIMP_BUILD_NO_IFC_IMPORTER",
        "WIN32_LEAN_AND_MEAN",
        "UNICODE",
        "_UNICODE",
        "MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
        "ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
        "RAPIDJSON_HAS_STDSTRING=1",
        "RAPIDJSON_NOMEMBERITERATORCLASS",
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "RAPIDJSON_NOMEMBERITERATORCLASS",
        "_SCL_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_WARNINGS",
        "OPENDDLPARSER_BUILD",
        "assimp_EXPORTS"
    }
  
    files {
        "code/**.h",
        "code/**.cpp",
        "include/**.h",
        "include/**.cpp",
    }
  
    includedirs {
        ".",
        "include",
        "code",
        "contrib",
        "contrib/pugixml/src",
        "contrib/zlib",
        "contrib/unzip",
        "contrib/rapidjson/include",
        "contrib/openddlparser/include",
        "contrib/utf8cpp/source",
    }

    filter "system:windows"
        cppdialect "C++20"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"