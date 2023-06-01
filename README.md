# SGL (Simple GL)
SGL for PureBasic.<br>
SGL is a module built on top of GLFW, and it is intended to take care of all the recurring tasks required when writing with OpenGL code.<br>
It works on Windows and Linux.<br>
<br>
You can have a quick idea of the API by looking at the declares contained [here](https://github.com/spettroscopio/SGL/blob/main/sgl.pbi).

The repository is organized this way:

| directory | contents |
| ------ | ------ |
| glfw | The wrapper of the GLFW library (3.3.8)|
| gl | A module with the definitions of the OpenGL functions and constants up to version 4.6. |
| glLoad | A module used to dynamically import all the OpenGL functions up to version 4.6.  |
| extras | Extra code out of the scope of the library but instructive and/or useful. |
| extensions | A template to show how to implement specific extensions support. |
| examples | Short examples to demonstrates the use of SGL commands in practice. |
| demos | Longer and more complex examples, to experiment with specific OpenGL features. |
| inc | Supporting includes of various nature, for example debugging, matrices, vectors, etc. |

Keep in mind this is a work in progress even if it has all the features I seem to require at the moment.<br>
I count on keep adding examples and demos in time.<br>
You can ask questions, make suggestions or just telling me if this helped you in some way [here](https://).
