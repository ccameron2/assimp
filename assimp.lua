project "assimp"
    kind "StaticLib"
    language "C++"
    staticruntime "on"

    targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    defines {
    }
  
    files {
        "code/**",
        "include/**",
    }
  
    includedirs {
        ".",
        "include",
        "code",
        "contrib",
        "contrib/pugixml/src",
        "contrib/zlib"
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