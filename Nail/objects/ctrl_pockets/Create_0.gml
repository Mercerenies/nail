
// TODO Will increase over the course of the game (max = 8)
_targetCount = 3;

_data = {};
_logic = {};

_data[$ POCKET_PROFESSOR] = [];
_data[$ POCKET_MAIDEN] = [];

_logic[$ POCKET_PROFESSOR] = new BasePocketLogic(ctrl_ItemLists.professorList);
_logic[$ POCKET_MAIDEN] = new BasePocketLogic(ctrl_ItemLists.maidenList);

// Seed all inventories
var keys = variable_struct_get_names(_data);
for (var i = 0; i < array_length(keys); i++) {
  _logic[$ keys[i]].updateInv(_data[$ keys[i] ], _targetCount);
}

getAllPocketNames = function() {
  return variable_struct_get_names(_data);
}

getInv = function(index) {
  return _data[$ index];
}

updateInv = function(index) {
  var logic = _logic[$ index];
  logic.updateInv(_data[$ index], _targetCount);
}

replaceInv = function(index, items) {
  _data[$ index] = items;
}

onTurnTransition = function() {
  // Nothing here yet (TODO Internal trading)
}
