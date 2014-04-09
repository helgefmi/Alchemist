#!/bin/sh

set -e
set -x

PROJECT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$PROJECT_DIR"
pwd

rm -rf build/
mkdir build/Alchemist/ -p

# root files
cp -ar *.lua *.xml *.md MIT-LICENSE build/Alchemist/
# directories
cp -ar Alchemist/ localization/ build/Alchemist/
# Alchemist.txt
cp -ar Alchemist.txt.release build/Alchemist/Alchemist.txt

mkdir build/Alchemist/lib
cd ../Unicorn && ./build.sh && cd -
cp -ar ../Unicorn/build/Unicorn build/Alchemist/lib/
