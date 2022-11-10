# -*- mode: snippet -*-
# name: cmake_minimum_required
# key: cmr
# --
cmake_minimum_required(VERSION ${1:`cmake-mode-cmake-version`}${2: FATAL_ERROR})
$0
