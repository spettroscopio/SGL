# SGL (Simple GL)
SGL for PureBasic.<br>
SGL is a module built on top of GLFW, and it is intended to take care of all the recurring tasks required when writing OpenGL code.<br>
It works on Windows (32/64 bits) and Linux (64 bits).<br>
<br>
You can have a quick idea of the API by looking at the declares [here](https://github.com/spettroscopio/SGL/blob/main/sgl.pbi).

The repository is organized this way:

| directory | contents |
| ------ | ------ |
| glfw | The wrapper of the GLFW library (3.3.8)|
| gl | A module with the definitions of the OpenGL functions and constants up to version 4.6. |
| glLoad | A module used to dynamically import all the OpenGL functions up to version 4.6.  |
| extras | Extra code beyond the scope of the library but instructive and/or useful. |
| extensions | A template to show how to implement specific extensions support. |
| examples | Short examples to demonstrates the use of SGL commands in practice. |
| demos | Longer and more complex examples, to experiment with specific OpenGL features. |
| inc | Supporting includes of various nature, for example debugging, matrices, vectors, etc. |

### GLFW library
The binaries of the GLFW library are under ./glfw/lib.<br>
Static linking is supported only on Windows.<br>
If you build an executable and select dinamic linking in your configuration file (sgl.config.pbi) or in your private copy of it, then the correct dinamic library (glfw3.x86.dll, glfw3.x64.dll, glfw3.x64.so) must be copied to the same directory of the executable, or under ./lib or ./bin below that directory.<br>
The initialization of the library will look there.<br>

This is a work in progress even if it has all the features I seem to require at the moment.<br>
My idea is now to start using this to build a simple 2D game engine, just to learn something more about game programming while writing all the base functionalities myself.<br>
In the future even a 3D one perhaps, who knows !<br>
I would probably keep adding examples and demos to this repository when I need to experiment with some code or idea.<br>

Maybe someone else will find this useful as a starting point or simply instructive so here it is.

Announcements and info [here](https://www.purebasic.fr/english/viewtopic.php?t=81764).

