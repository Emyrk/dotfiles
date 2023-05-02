#!/bin/sh

export DOCS_ROOT=$GOPATH/src/github.com/cdr/coder
cd $GOPATH/src/github.com/cdr/coder.com
yarn dev
