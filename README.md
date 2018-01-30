# xonotic-shell-utils

A collection of bash helper scripts for common xonotic-related shell functions.

## Setup

#### BASH

```
cd xonotic-shell-utils
echo -e "\nsource $(pwd)/xsu.sh" >> ~/.bashrc
```

#### zsh

```
cd xonotic-shell-utils
echo -e "\nsource $(pwd)/xsu.sh" >> ~/.zshrc
```


## Usage

### Map/Package helpers

These helpers are for common pk3, or map related functions 


#### pk3_cat <pattern> [directory|file]

The function will search a pk3 file, or iterate over a collection of files in a directory given an
`egrep` pattern expression, and will output the contents of that file using `cat`.  This commmand
will select current directory if no directory or file given.

```
# cat mapinfo from specific pk3
pk3_cat "maps/.*mapinfo" ~/.xonotic/data/dlcache/recratemini.pk3

# cat all mapinfos from all files in current directory
pk3_cat "(maps).*mapinfo"

# search all pk3s from a specific pattern
pk3_cat "(scripts).*shader" ~/.xonotic/data/dlcache | egrep "fern"
```


#### pk3_search <pattern> [directory|file]

The function will search a pk3 file, or iterate over a collection of files in a directory given an
`egrep` pattern expression on the files with the pk3(s).  Will select current directory if no directory or file given.

```
pk3_search "fern.tga"
```


#### pk3_cat_bsp <file>

This function will cat out the bsp contents of a bsp from a pk3... useful for searching strings in a
BSP.  Used by pk3_get_bsp_ent.

```
pk3_cat_bsp ~/.xonotic/data/dlcache/resist-desaturation.pk3
```


#### pk3_get_bsp_ent <file>

This function will export a .ent file from a bsp within a pk3.  Requires q3map2 in your path, or as
an alias.

```
pk3_get_bsp_ent z-pillar1.pk3 && cat z-pillar1.pk3.ent |grep player_race
```
                                                      
## Contributing

Hey, I'd love to add your contributions!  Reach out to me on IRC in #xonotic on quakenet/freenode,
or shoot me an email z@xnz.me.

## License

MIT
