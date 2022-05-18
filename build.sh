#!/bin/bash

cd [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
./Sourcery/bin/sourcery


