# harpman
A useful command line tool for harmonica players: shows the holes you have to blow/draw in order to play music in a specific scale on a given tone, using any harmonica you like. What else would you need?

## Usage:
```shell
./harpman [options]
```

## Options:

`-h, --harp` Harmonica tonality (default 'C')

`-s, --scale` A pentatonic, hexatonic or heptatonic scale (default 'heptatonic major natural')

`-t, --tonality` Scale tonality (defaults to harp's tonality)

`-o, --octaves` Octave range between 1 and 3 (default '1-3')

## Available scales

* pentatonic
  * minor
  * major
* hexatonic
    * blues
* heptatonic
  * diatonic
    * ionian
    * dorian
    * phrygian
    * lydian
    * mixolydian
    * aeolian
    * locrian
  * minor
    * natural
    * harmonic
    * melodic
      * ascending
      * descending
  * major
    * natural
  * blues
