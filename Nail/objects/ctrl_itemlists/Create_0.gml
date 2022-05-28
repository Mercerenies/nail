
// Note: These lists make NO guarantees of uniqueness. Items can
// appear in multiple lists and there are some items that appear in
// none of these lists.

// Common list for items which don't belong to any particular
// character.
commonList = [
  new Penny(),
  new Candle(), // DEBUG CODE
  new Baseball(), // DEBUG CODE
  new DollarBill(),
]

professorList = [
  new MathTextbook(),
  new EnglishTextbook(),
  new HistoryTextbook(),
  new ScienceTextbook(),
  new Spider(), // DEBUG CODE
]

maidenList = [
  new Teapot(),
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
