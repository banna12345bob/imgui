project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"backends/imgui_impl_sdl2.cpp",
		"backends/imgui_impl_sdl2.h",
		"backends/imgui_impl_sdlrenderer2.cpp",
		"backends/imgui_impl_sdlrenderer2.h"
	}

	includedirs
	{
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.SDL2}"
	}

	libdirs
	{
		"%{IncludeDir.SDL2}/../lib/x86/"
	}

	links {
		"SDL2",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"
		links {
			"SDL2main"
		}

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
