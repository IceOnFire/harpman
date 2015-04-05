CSON = require 'cson'
steps = CSON.requireFile './data/steps.cson'
notes = CSON.requireFile './data/notes.cson'
harp = CSON.requireFile './data/harp.cson'
keys = CSON.requireFile './data/keys.cson'

harpman = {}

harpman.getIntervals = (progression, octave, octaves) ->
  o = octave
  intervals = []
  while o < octaves
    i = 0
    while i < progression.length - 1
      intervals.push (progression[i + 1] - progression[i]) / 2
      i += 1
    intervals.push (progression[0] + 12 - progression[progression.length - 1]) / 2
    o += 1
  return intervals

harpman.getSteps = (progression, octave, octaves) ->
  o = octave
  theSteps = []
  while o < octaves
    for semitone in progression
      theSteps.push steps[semitone]
    o += 1
  theSteps.push steps[0]
  return theSteps

harpman.getNotes = (progression, tonality, octave, octaves) ->
  o = octave
  theNotes = []
  while o < octaves
    for semitone in progression
      theNotes.push notes[(semitone + keys[tonality]) % 12] || ' X'
    o += 1
  theNotes.push notes[(progression[0] + keys[tonality]) % 12] || ' X'
  return theNotes

harpman.getHoles = (harpkey, progression, key, octave, octaves) ->
  o = octave
  holes = []
  while o < octaves
    for semitone in progression
      holes.push harp[semitone + keys[key] - keys[harpkey] + 12 * o] || ' X'
    o += 1
  holes.push harp[progression[0] + keys[key] - keys[harpkey] + 12 * octaves] || ' X'
  return holes

module.exports = harpman
