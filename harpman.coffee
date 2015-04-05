CSON = require 'cson'
steps = CSON.requireFile './data/steps.cson'
notes = CSON.requireFile './data/notes.cson'
harp = CSON.requireFile './data/harp.cson'
keys = CSON.requireFile './data/keys.cson'

harpman = {}

harpman.getIntervals = (progression, octave, octaves) ->
  intervals = []
  for o in [octave..octaves - 1]
    for i in [1..progression.length - 1]
      intervals.push (progression[i] - progression[i - 1]) / 2
    intervals.push (progression[0] + 12 - progression[progression.length - 1]) / 2
  return intervals

harpman.getSteps = (progression, octave, octaves) ->
  theSteps = []
  for o in [octave..octaves - 1]
    for semitone in progression
      theSteps.push steps[semitone]
  theSteps.push steps[0]
  return theSteps

harpman.getNotes = (progression, tonality, octave, octaves) ->
  theNotes = []
  for o in [octave..octaves - 1]
    for semitone in progression
      theNotes.push notes[(semitone + keys[tonality]) % 12] || ' X'
  theNotes.push notes[(progression[0] + keys[tonality]) % 12] || ' X'
  return theNotes

harpman.getHoles = (harpkey, progression, key, octave, octaves) ->
  holes = []
  for o in [octave..octaves - 1]
    for semitone in progression
      holes.push harp[semitone + keys[key] - keys[harpkey] + 12 * o] || ' X'
  holes.push harp[progression[0] + keys[key] - keys[harpkey] + 12 * octaves] || ' X'
  return holes

module.exports = harpman
