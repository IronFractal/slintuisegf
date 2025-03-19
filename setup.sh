#!/usr/bin/env bash

mkdir -pv ./build/native/
mkdir -pv ./build/fluent_dark/
mkdir -pv ./build/fluent_dark_clang/

cmake -S . -B ./build/native -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_EXPORT_COMPILE_COMMANDS="ON"
cmake -S . -B ./build/fluent_dark -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_EXPORT_COMPILE_COMMANDS="ON" -DSLINT_STYLE="fluent-dark"
cmake -S . -B ./build/fluent_dark_clang -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_EXPORT_COMPILE_COMMANDS="ON" -DSLINT_STYLE="fluent-dark"
