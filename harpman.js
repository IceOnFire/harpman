var steps = require('./data/steps.json');
var notes = require('./data/notes.json');
var harp = require('./data/harp.json');
var keys = require('./data/keys.json');

var harpman = {};

harpman.getIntervals = function(progression, octave, octaves) {
  var o, i, intervals = [];
  for (o = octave; o < octaves; o += 1) {
    for (i = 0; i < progression.length - 1; i += 1) {
      intervals.push((progression[i + 1] - progression[i]) / 2);
    }
    intervals.push((progression[0] + 12 - progression[progression.length - 1]) / 2);
  }
  return intervals;
}

harpman.getSteps = function(progression, octave, octaves) {
  var o, i, theSteps = [];
  for (o = octave; o < octaves; o += 1) {
    for (i = 0; i < progression.length; i += 1) {
      theSteps.push(steps[progression[i]]);
    }
  }
  theSteps.push(steps[0]);
  return theSteps;
}

harpman.getNotes = function(progression, tonality, octave, octaves) {
  var o, i, theNotes = [];
  for (o = octave; o < octaves; o += 1) {
    for (i = 0; i < progression.length; i += 1) {
      theNotes.push(notes[(progression[i] + keys[tonality]) % 12] || ' X');
    }
  }
  theNotes.push(notes[(progression[0] + keys[tonality]) % 12] || ' X');
  return theNotes;
}

harpman.getHoles = function(harpkey, progression, key, octave, octaves) {
  var o, i, holes = [];
  for (o = octave; o < octaves; o += 1) {
    for (i = 0; i < progression.length; i += 1) {
      holes.push(harp[progression[i] + keys[key] - keys[harpkey] + 12 * o] || ' X');
    }
  }
  holes.push(harp[progression[0] + keys[key] - keys[harpkey] + 12 * octaves] || ' X');
  return holes;
}

module.exports = harpman;
