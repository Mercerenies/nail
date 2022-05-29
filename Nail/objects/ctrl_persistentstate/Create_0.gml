
// NOTE: ALL FIELDS ARE READ-WRITE UNLESS OTHERWISE STATED!!!

// Shall be either -1 (for no ending) or an enum Ending constant.
lastEndgame = -1;

gotEnding = [0, 0, 0, 0, 0, 0, 0];

markEnding = function(endingId) {
  gotEnding[endingId] = 1;
  saveGame();
}