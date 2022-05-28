
// TODO Will increase over the course of the game (max = 8)
_targetCount = 3;

_data = {};
_logic = {};

_data[$ POCKET_PROFESSOR] = [];

_logic[$ POCKET_PROFESSOR] = new BasePocketLogic(ctrl_ItemLists.professorList);

getInv = function(index) {
  return _data[$ index];
}

updateInv = function(index) {
  var logic = _logic[$ index];
  logic.updateInv(_data[$ index], _targetCount);
}
