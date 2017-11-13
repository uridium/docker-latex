Docker LaTeX
--

Container for building PDF files from LaTeX documents, based on [TeX Live](https://www.tug.org/texlive/).

It's a trimmed down version of texlive-full, made of only few texlive packages.

### Requirements

* docker-engine
* make

### Install

Pull an image from a registry:

    make pull

or build an image from a Dockerfile:

    make build

### Usage

Simply copy this repository to directory with tex files and run:

    ./docker-latex/render.sh xelatex filename.tex

Also, you might be tempted to add it as git submodule:

    git submodule add git@github.com:uridium/docker-latex.git docker-latex
