Docker LaTeX
--
[![Docker Hub](https://img.shields.io/docker/cloud/build/uridium/latex.svg)](https://hub.docker.com/r/uridium/latex/)

A trimmed down container for converting LaTeX documents to PDF files. It doesn't use `texlive-full` package.

[TeX Live](https://www.tug.org/texlive/)

### Requirements

* docker
* make

### Install/Usage

To generate a pdf file, copy this repository to a directory with tex files and run:

    make f=filename.tex

You might be tempted to add it as git submodule:

    git submodule add git@github.com:uridium/docker-latex.git docker-latex

You can also download the image from a [registry](https://hub.docker.com/r/uridium/latex/):

    make pull

or just build the image from a Dockerfile:

    make build
