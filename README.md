Docker LaTeX
--

Container for building PDF files from LaTeX documents, based on [TeX Live]([https://www.tug.org/texlive/].

It's a trimmed down version of texlive-full, made of only few texlive packages.

# Requirements

* docker-engine
* make

### Install

To pull an image from a registry:

    make pull

or, to build an image from a Dockerfile:

    make build

### Usage

    ./render.sh xelatex filename.tex
