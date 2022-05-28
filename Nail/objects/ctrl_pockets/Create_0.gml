
// TODO Will increase over the course of the game (max = 8)
_targetCount = 3;

_data = {};
_logic = {};
_rejection = {};

_data[$ POCKET_PROFESSOR] = [];
_data[$ POCKET_MAIDEN] = [];
_data[$ POCKET_BAKER] = [];
_data[$ POCKET_FARMER] = [];

_logic[$ POCKET_PROFESSOR] = new BasePocketLogic(ctrl_ItemLists.professorList);
_logic[$ POCKET_MAIDEN] = new BasePocketLogic(ctrl_ItemLists.maidenList);
_logic[$ POCKET_BAKER] = new BasePocketLogic(ctrl_ItemLists.bakerList);
_logic[$ POCKET_FARMER] = new BasePocketLogic(ctrl_ItemLists.farmerList);

_rejection[$ POCKET_PROFESSOR] = new ProfessorRejectionRule();
_rejection[$ POCKET_MAIDEN] = new MaidenRejectionRule();
_rejection[$ POCKET_BAKER] = new BakerRejectionRule();
_rejection[$ POCKET_FARMER] = new FarmerRejectionRule();

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
  var tradeAttempts = 1;
  for (var i = 0; i < tradeAttempts; i++) {
    _attemptInternalTrade();
  }
}

_attemptInternalTrade = function() {
  var keys = variable_struct_get_names(_data);
  var target1 = Util.sample(keys);
  var target2 = Util.sample(keys);
  if (target1 != target2) {
    var inv1 = _data[$ target1];
    var inv2 = _data[$ target2];
    if ((array_length(inv1) > 0) && (array_length(inv2) > 0)) {
      var i = irandom(array_length(inv1) - 1);
      var j = irandom(array_length(inv2) - 1);
      var item1 = inv1[i];
      var item2 = inv2[j];
      // If neither character has an objection to the trade, make it
      // happen.
      if (is_undefined(_rejection[$ target1].getReaction(item2)) && is_undefined(_rejection[$ target2].getReaction(item1))) {
        inv1[i] = item2;
        inv2[j] = item1;
      }
    }
  }
}
