
// Used by default for the things a person is selling *to* you.
function DefaultSellValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    return itemData.getSellValue();
  }
}
