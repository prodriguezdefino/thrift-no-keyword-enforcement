# Modified Thrift Compiler Docker Image

This Docker image contains the modified Thrift compiler hosted [here](https://github.com/guardian/french-thrift.git). It basically runs a version of Thrift that do not enforces reserved keyword usage, very useful when working with thrift object definitions based on older library versions. The output python files of the process are not compatible with Python 3, running `2to3` to those files may solve the problem.

## Requirements

Docker should be installed on the host machine.

## Build the image

Execute this command on the current directory:
```
$> docker build -t french-thrift .
```

## Execute the compiler

In order to compile one can mount local directory containing `.thrift` with docker's `-v` option on the `/data` directory inside the container, for example:
```
$> docker run -it -v /some/absolute/path/to/dir:/data french-thrift thrift -r --gen cpp some_thrift_file.thrift
```
The compiler includes the common generators and was tested for with `java`, `py` and `cpp` generators.
