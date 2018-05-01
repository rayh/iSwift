iSwift is the kernel IPython/Notebook implementation for Swift programming language.

It can:
  + Execute swift code on the Jupyter Notebook web editor, Jupyter console as well as Jupyter qtconsole.
  + Import Foundatation/Dispatch and other Buildin libraries.
  + Autocomplete swift code by pressing tab ↹.
  + Support encryption.
  + Support Linux/macOS

This project is based off [KelvinJin/iSwift](https://github.com/KelvinJin/iSwift) but makes a few changes:
  + Updates to support Swift 4.1
  + Base the docker image off jupyter/minimal-notebook

Note: This is rough work-in-progress. What you're looking at is
unlikely to be the latest and greatest. I'd suggest checking the
[Swift for TensorFlow google
group](https://groups.google.com/a/tensorflow.org/forum/?utm_source=digest&utm_medium=email/#!topic/swift/5fr5h1SWzzE),
and the [fork tree](https://github.com/KelvinJin/iSwift/network) from
KelvinJin's original verison, to understand what is the best version of this.

## Quick Start

The easiest way of using this is via the [docker image](https://hub.docker.com/r/algalgal/swift-notebook/), either locally or in jupyterhub/binderhub

```bash
$ docker run -t -i -p 8888:8888 --privileged algalgal/swift-notebook
```

And open the link you see in the console, which will start Jupyter, from there you can select `New` -> `Swift`


## Requirements

  + macOS/Linux
  + Swift 4.1
  + ZMQ
  + Jupyter 5.0

## macOS Installation

Clone this repo locally. And:

1. Follow [this](https://github.com/Zewo/ZeroMQ/blob/master/setup_env.sh) script to install the libzmq on your machine.

2. Build the project.

```
swift build
```

3. Currently, in order to run swift kernel locally, you need to create a file named
`kernel.json`. Put the following content to the file and replace the `Path/to/iSwift`
with your local clone path.

```json
{
 "argv": ["Path/to/iSwift/.build/debug/iSwift", "-f", "{connection_file}"],
 "display_name": "Swift",
 "language": "swift"
}
```

4. Install Jupyter kernel: (replace the `Folder/that/has/kernel/json` with
  the path of the folder that contains the `kernel.json` file)

```
jupyter-kernelspec install Folder/that/has/kernel.json
```

5. Run Jupyter Notebook (token needs to be empty):
```
jupyter notebook --NotebookApp.token=
```

## Linux Installation

1. Install Swift 3.0.
2. Check if you have libzmq installed.
3. Continue from step 2 in the section above.

## Docker Installation

Simply clone this repo and run `docker build -t iswift .`. It will build the docker image.

## Author

[Jin Wang](https://twitter.com/jinw1990)

## Contribution

Contributions are welcome. Simply create an issue if you have ideas on how we
can improve iSwift.

## License
MIT
