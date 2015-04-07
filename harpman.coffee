CSON = require 'cson'
steps = CSON.requireFile './data/steps.cson'
notes = CSON.requireFile './data/notes.cson'
harp = CSON.requireFile './data/harp.cson'
keys = CSON.requireFile './data/keys.cson'

harpman = {}

harpman.getIntervals = (progression, octave, octaves) ->
  intervals = []
  for o in [octave...octaves]
    for i in [1...progression.length]
      intervals.push (progression[i] - progression[i - 1]) / 2
    intervals.push (progression[0] + 12 - progression[progression.length - 1]) / 2
  return intervals

harpman.getSteps = (progression, octave, octaves) ->
  theSteps = []
  for o in [octave...octaves]
    for semitone in progression
      theSteps.push steps[semitone]
  theSteps.push steps[0]
  return theSteps

harpman.getNotes = (progression, tonality, octave, octaves) ->
  theNotes = []
  for o in [octave...octaves]
    for semitone in progression
      theNotes.push notes[(semitone + keys[tonality]) % 12] or ' X'
  theNotes.push notes[(progression[0] + keys[tonality]) % 12] or ' X'
  return theNotes

harpman.getHoles = (harpkey, progression, key, octave, octaves) ->
  holes = []
  for o in [octave...octaves]
    for semitone in progression
      holes.push harp[semitone + keys[key] - keys[harpkey] + 12 * o] or ' X'
  holes.push harp[progression[0] + keys[key] - keys[harpkey] + 12 * octaves] or ' X'
  return holes

module.exports = harpman
