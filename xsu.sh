#!/usr/bin/env bash
# xsu.sh - A collection of bash helper scripts for common xonotic-related shell functions.
# Setup: source this file in your ~/.bashrc or ~/.zshrc
# Usage: Call the functions by their names in your shell
# License: MIT 2017, Tyler "-z-" Mulligan

pk3_cat() {
    local pattern=${1}
    local pk3_path=${2:-.}
    for f in $(find "${pk3_path}" -name "*.pk3"); do unzip -p ${f} -c $(unzip -l ${f} |grep -E ${pattern}) 2>/dev/null; done
}

pk3_search() {
    local pattern=${1}
    local pk3_path=${2:-.}
    for f in $(find "${pk3_path}" -name "*.pk3"); do unzip -l ${f} |grep -E ${pattern} && echo "pattern matched in ${f}" 2>/dev/null; done
}
