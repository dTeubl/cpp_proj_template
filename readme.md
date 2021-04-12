C++ project template 
=====================

This is a simple Makefile based C++ project template, with google test integration.

To build you application:
> make

To build and run unit tests:
> make test

Remarks
-------

+ The makefile will assume that you have the necessery libraries installed. It does not check for those yet. 
+ Place your source files to _./src_, header files to _./inc_ and test source files to _./test_ folder. In these folders, these files will be automatically compiled together in the right way.
+ You can change the project name, and compiler setups in the Makefile
+ Feel free to suggest/add improvement

Known errors
------------

When used in a fresh project, I faced the problem, that is did not compiled the tests, only after all the currently existing files was in the new project folder. Before that, adding new tests and test files was not possible.

