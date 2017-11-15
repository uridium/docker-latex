Docker LaTeX
--

A trimmed down container for converting LaTeX documents to PDF files. It doesn't use `texlive-full` package.

[TeX Live](https://www.tug.org/texlive/)

### Requirements

* docker-engine
* make

### Install

Run `./docker-latex/render.sh` and an image will be pulled automatically,

or download an image from a [registry](https://hub.docker.com/r/uridium/latex/):

    make pull

You can also build an image from a Dockerfile:

    make build

### Usage

Simply copy this repository to a directory with tex files and run:

    ./docker-latex/render.sh filename.tex

Also, you might be tempted to add it as git submodule:

    git submodule add git@github.com:uridium/docker-latex.git docker-latex
