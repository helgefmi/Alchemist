#!/bin/sh

set -e
set -x

PROJECT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$PROJECT_DIR"
pwd

rm -rf build/
mkdir build/Alchemist/Alchemist -p

cp -ar $(egrep '^Alchemist' Alchemist.txt.release) build/Alchemist/
cp -ar Alchemist.txt.release build/Alchemist/Alchemist.txt
cp -ar *.md MIT-LICENSE build/Alchemist/

mkdir build/Alchemist/lib
cd ../Unicorn && ./build.sh && cd -
cp -ar ../Unicorn/build/Unicorn build/Alchemist/lib/
