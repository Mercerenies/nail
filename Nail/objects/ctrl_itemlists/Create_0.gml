
// Note: These lists make NO guarantees of uniqueness. Items can
// appear in multiple lists and there are some items that appear in
// none of these lists.

// Common list for items which don't belong to any particular
// character.
commonList = [
  new Penny(),
  new DollarBill(),
]

professorList = [
  new MathTextbook(),
  new EnglishTextbook(),
  new HistoryTextbook(),
  new ScienceTextbook(),
]

maidenList = [
  new Teapot(),
]

bakerList = [
  new Plate(),
  new Spoon(),
]

farmerList = [
  new Horseshoe(),
]

oldMaidList = [
  new Spoon(),
  new Plate(),
  new Teapot(),
  new Candle(),
]

broSisList = [
  new Spider(),
  new Baseball(),
]

fairyGodmotherList = [
  new Candle(),
  new Penny(),
  new Baseball(),
  new MathTextbook(),
  new EnglishTextbook(),
  new ScienceTextbook(),
  new HistoryTextbook(),
  new Teapot(),
  new Spider(),
  new DollarBill(),
  new Plate(),
  new Spoon(),
  new Horseshoe(),
]

devilList = [
  new Candle(),
  new Penny(),
  new Baseball(),
  new MathTextbook(),
  new EnglishTextbook(),
  new ScienceTextbook(),
  new HistoryTextbook(),
  new Teapot(),
  new Spider(),
  new DollarBill(),
  new Plate(),
  new Spoon(),
  new Horseshoe(),
]

investorList = [
  new Penny(),
  new DollarBill(),
  new Briefcase(),
]

// For efficient lookup.
_commonIndex = ds_map_create();
for (var i = 0; i < array_length(commonList); i++) {
  _commonIndex[? commonList[i].getId()] = 1;
}

countCommonItems = function(list) {
  var total = 0;
  for (var i = 0; i < array_length(list); i++) {
    if (ds_map_exists(_commonIndex, list[i].getId())) {
      total += 1;
    }
  }
  return total;
}
