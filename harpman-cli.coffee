CSON = require 'cson'
colors = require 'colors'
harpman = require '../harpman'

harpmanCli = {}
theSteps = []

print = (string, step = string) ->
  steps = CSON.requireFile 'data/steps.cson'
  string = switch
    when step is steps[0] then colors.green.bold string # tonic
    when step in steps[3..4] then colors.yellow.dim string # mediant
    when step in steps[6..7] then colors.blue.bold string # dominant
    when step in steps[10..11] then colors.magenta.bold string # leading
    else string
  process.stdout.write "#{string}\t"

harpmanCli.progression = (string) ->
  progressions = CSON.requireFile 'data/progressions.cson'
  tokens = string.split ' '
  progression = progressions
  progression = progression[token] for token in tokens
  progression

harpmanCli.steps = (progression, octave, octaves) ->
  theSteps = harpman.getSteps progression, octave, octaves
  process.stdout.write "step\t"
  print step for step in theSteps
  process.stdout.write "\n"
  theSteps

harpmanCli.notes = (progression, tonality, octave, octaves) ->
  process.stdout.write "note\t"
  notes = harpman.getNotes progression, tonality, octave, octaves
  print note, theSteps[i] for note, i in notes
  process.stdout.write "\n"
  notes

harpmanCli.holes = (harpkey, progression, tonality, octave, octaves) ->
  process.stdout.write "hole\t"
  holes = harpman.getHoles harpkey, progression, tonality, octave, octaves
  print hole, theSteps[i] for hole, i in holes
  process.stdout.write "\n"
  holes

harpmanCli.intervals = (progression, octave, octaves) ->
  Fraction = (require 'fractional').Fraction
  pad = require 'node-string-pad'
  process.stdout.write "intv\t"
  intervals = harpman.getIntervals progression, octave, octaves
  for interval in intervals
    interval = (new Fraction interval).toString()
    process.stdout.write "#{pad interval, 7, 'LEFT'}\t"
  process.stdout.write "\n"
  intervals

module.exports = harpmanCli
