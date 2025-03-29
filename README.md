# Godot Shader Wallpaper Template
A template for a Godot fragment shader to be used as an optimized live wallpaper for [Lively](https://www.rocksdanister.com/lively/) or [Wallpaper Engine](https://www.wallpaperengine.io/en).

As long as you keep the shader optimized, this is one of the best way to keep performance otpimization to a maximum
while being easy to embrace.

The final size of the executable may be ~ 100 MB, but the GPU runtime consumption is extremely low compared to other methods.
In case you may want to shrink down the executable size further, [there are advanced steps you may take](https://docs.godotengine.org/en/latest/contributing/development/compiling/optimizing_for_size.html).


The wallpaper attached to this project as an example is [Basic Warped 2D Noise KurganCPC](https://www.shadertoy.com/view/wljfWz) by Kurganpsp.


## Requirements

- [Godot 4.4](https://godotengine.org/download/archive/#4.4) or above
- [`rcedit.exe`](https://github.com/electron/rcedit/releases/latest) (for `.exe` manipulation during export)
- [ImageMagick CLI](https://imagemagick.org/script/command-line-tools.php) (optional, for `.ico` generation)

	`choco install imagemagick`

## How to use it
- Fork or clone this project
- Customize your icon and save it under `./icon.png`
- If you have the ImageMagick CLI installed, run the `./make_ico.ps1`. This will generate a proper icon for the final executable
- Open the project with Godot
- Change the `./main_shader.gdshader` to your liking
- Change settings to your liking
	- Project settings
	- Editor settings (Export related, like the `rcedit.exe` location)
	- Export settings
- Export the project to an `.exe` file
- Create an executable type live wallpaper in Lively or Wallpaper Engine
