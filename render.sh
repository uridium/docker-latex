#!/bin/bash

docker run --rm --network none --name render-latex -u "$(id -u):$(id -g)" -v "$(pwd):/docs" uridium/latex $@
