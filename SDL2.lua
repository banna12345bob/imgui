project "ImGui SDL2"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"backends/imgui_impl_sdl2.cpp",
		"backends/imgui_impl_sdl2.h",
		"backends/imgui_impl_sdlrenderer2.cpp",
		"backends/imgui_impl_sdlrenderer2.h"
	}

	includedirs
	{
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.sdl2}"
	}

	links {
		"ImGui",
		"SDL2",
		"SDL2main"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
