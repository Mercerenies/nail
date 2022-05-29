
function DevilSellValuator() : Valuator() constructor {
  // TODO Soul
  static valueOf = function(itemData) {
    return min(itemData.getValue(), 1);
  }
}
