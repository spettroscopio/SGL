# SGL (Simple GL)
SGL for PureBasic.<br>
SGL is a module built on top of GLFW, and it is intended to take care of all the recurring tasks required when writing OpenGL code in PureBasic.<br>
It works on Windows (32/64 bits) and Linux (64 bits).<br>
<br>
You can have a quick idea of the API by looking at the declares [here](https://github.com/spettroscopio/SGL/blob/beb7aa3dd6062082b7eab222f0bf4f6c8c50558f/sgl.pbi#L444).

The repository is organized this way:

| directory | contents |
| ------ | ------ |
| glfw | The import of the GLFW library (3.3.8)|
| gl | A module with the definitions of the OpenGL functions and constants up to version 4.6. |
| glLoad | A module used to dynamically import all the OpenGL functions up to version 4.6.  |
| extras | Extra code beyond the scope of the library but instructive and/or useful. |
| extensions | A template to show how to implement specific extensions support. |
| examples | Short examples to demonstrates the use of SGL commands in practice. |
| demos | Longer examples, to experiment with specific OpenGL features. |
| inc | Supporting includes of various nature, for example debugging, matrices, vectors, etc. |

### What you need to run this ?
Just PureBasic. The only dependency is the GLFW library and it's included.<br>
All the test code should work without the need of altering paths, looking for libraries around, etc.<br>

### What you have to do to distribute something compiled with SGL ?
The binaries of the GLFW library are under ./glfw/lib.<br>
Static linking is supported only on Windows.<br>
If you build an executable and select dinamic linking in your configuration file (sgl.config.pbi) or in your private copy of it, then the correct dinamic library (glfw3.x86.dll, glfw3.x64.dll, glfw3.x64.so) must be copied to the same directory of the executable, or under ./lib or ./bin below that directory.<br>
The initialization of the library will look there.<br>

### That's all !
This is a work in progress even if it has all the features I seem to require at the moment.<br>
I will probably keep adding examples and demos to this repository when I need to experiment with some code or idea.<br>
For example at the moment this also contains simple implementations of font rendering, FPS and ArcBall cameras, a Batch Renderer for quads, a basic IMGUI, etc.<br>

My idea is now to start using this to build a simple 2D game engine, to learn something more about game programming while writing all the base functionalities myself.<br>
In the future even a 3D one perhaps, who knows !<br>

Maybe someone else will find this stuff useful or simply instructive so here it is.

For announcements, comments, questions please go [here](https://www.purebasic.fr/english/viewtopic.php?t=81764).

