#!/usr/bin/env bash
# xsu.sh - A collection of bash helper scripts for common xonotic-related shell functions.
# Setup: source this file in your ~/.bashrc or ~/.zshrc
# Usage: Call the functions by their names in your shell
# License: MIT 2017, Tyler "-z-" Mulligan

# pk3_cat "(maps).*mapinfo" |grep "settemp"
pk3_cat() {
    local pattern=${1}
    local pk3_path=${2:-.}
    for f in $(find "${pk3_path}" -name "*.pk3"); do unzip -p ${f} -c $(unzip -l ${f} |grep -E ${pattern}) 2>/dev/null; done
}

# pk3_search "fern.tga"
pk3_search() {
    local pattern=${1}
    local pk3_path=${2:-.}
    for f in $(find "${pk3_path}" -name "*.pk3"); do unzip -l ${f} |grep -E ${pattern} && echo "pattern matched in ${f}" 2>/dev/null; done
}

# cat_bsp ~/.xonotic/data/dlcache/resist-desaturation.pk3
cat_bsp() {
    local pk3_name=${1}
    unzip -p ${pk3_name} $(unzip -l ${pk3_name} |grep "\.bsp" |awk '{ print $4 }' |head -n1)
}

# assumes q3map2 as an alias in your ~/.zshrc or ~/.bashrc, or available in your $PATH
# pk3_get_bsp_ent z-pillar1.pk3 && cat z-pillar1.pk3.ent |grep player_race
pk3_get_bsp_ent() {
    local pk3_name=${1}
    local ent_name=${2:-${pk3_name}.ent}
    local tmp_bsp=${3:-/tmp/tmp.bsp}
    cat_bsp ${pk3_name} > ${tmp_bsp} && q3map2 -exportents -onlyents ${tmp_bsp}
    local tmp_ent=${tmp_bsp%.bsp}.ent
    mv -v ${tmp_ent} ${ent_name}
}
