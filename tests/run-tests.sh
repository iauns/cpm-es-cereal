#!/bin/bash
cd "$(dirname "$0")"

if [ ! -d ./bin ]; then
  mkdir -p ./bin
fi

# Ensure we fail immediately if any command fails.
set -e

pushd ./bin > /dev/null
  if [[ ! "-n" == $1 ]]; then
    cmake -DCMAKE_BUILD_TYPE=Debug ..
  fi
  make -j1
  #./cereal_tests --gtest_filter=EntitySystem.BasicConstruction
  ./cereal_tests
popd

