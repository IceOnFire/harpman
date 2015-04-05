# harpman
A useful command line tool for harmonica players: shows the holes you have to blow/draw in order to play music in a specific scale on a given tone, using any harmonica you like. What else would you need?

## Usage:
```shell
./harpman [options]
```

## Options:

`-k, --key` Harmonica key (default 'C')

`-p, --progression` Scale or chord progression (default 'scale major', see `progressions.json`)

`-t, --tonality` Progression tonality (defaults to harp's key)

`-o, --octaves` Octave range between 1 and 3 (default '1-3')

`-h, --help` Show this help message

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
