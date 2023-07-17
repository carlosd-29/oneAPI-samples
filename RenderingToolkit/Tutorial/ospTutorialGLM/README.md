# `Getting Started` CPU Sample for Intel&reg; oneAPI Rendering Toolkit (Render Kit): Intel&reg; Embree

This sample program is an example of how to use OSPRay in an application using GLM instead of rkcommon for math types.

| Area                 | Description
|:---                  |:---
| What you will learn  | How to build and run a basic sample program for CPU using the Intel OSPRay API from the Render Kit.
| Time to complete     | 5 minutes

## Prerequisites

| Minimum Requirements              | Description
|:---                               |:---
| OS                                | Windows* 10 or higher
| Hardware                          | Intel 64 Penryn or newer with SSE4.1 extensions; ARM64 with NEON extensions <br>(Optimized requirements: Intel 64 Skylake or newer with AVX512 extentions, ARM64 with NEON extensions)
| Compiler Toolchain                | **Windows\***: MSVS 2019 or higher with Windows* SDK and CMake*; Other platforms: C++11 compiler, a C99 compiler (for example gcc/c++/clang), and CMake*
| Libraries                         | Install Intel&reg; oneAPI Rendering Toolkit (Render Kit), includes Embree and OSPRay

## Build and Run the `Getting Started` Sample Program

### Set Environment Variables

When working with the command-line interface (CLI), you should configure the oneAPI toolkits using environment variables. Set up your CLI environment by sourcing the `setvars` script every time you open a new terminal window. This practice ensures that your compiler, libraries, and tools are ready for development.

> **Note**: If you have not already done so, set up your CLI
> environment by sourcing  the `setvars` script in the root of your oneAPI installation.
>
> Windows*:
> - `C:\Program Files (x86)\Intel\oneAPI\setvars.bat`
> - Windows PowerShell*, use the following command: `cmd.exe "/K" '"C:\Program Files (x86)\Intel\oneAPI\setvars.bat" && powershell'`
>
> For more information on configuring environment variables, see *[Use the setvars Script with Linux* or macOS*](https://www.intel.com/content/www/us/en/develop/documentation/oneapi-programming-guide/top/oneapi-development-environment-setup/use-the-setvars-script-with-linux-or-macos.html)* or *[Use the setvars Script with Windows*](https://www.intel.com/content/www/us/en/develop/documentation/oneapi-programming-guide/top/oneapi-development-environment-setup/use-the-setvars-script-with-windows.html)*.

### On Windows*

1. Open a new **x64 Native Tools Command Prompt for MSVS 2022** (or MSVS 2019). Ensure environment variables are set.
2. Change to CPU sample program directory:
```
cd <path-to-oneAPI-samples>\RenderingToolkit\Tutorial\ospTutorialGLM
```
3. Build and run the `Getting Started` program:
```
mkdir build
cd build
cmake ..
cmake --build . 
cd Debug
ospTutorialGLM.exe
```

4. Review the terminal output (stdout).

```
Picked geometry [inst: 0000023D452B2FD0, model: 0000023D452A1960, prim: 1]
```

## License

This code sample is licensed under the Apache 2.0 license. See
[LICENSE.txt](LICENSE.txt) for details.

Third party program Licenses can be found here:
[third-party-programs.txt](https://github.com/oneapi-src/oneAPI-samples/blob/master/third-party-programs.txt).
