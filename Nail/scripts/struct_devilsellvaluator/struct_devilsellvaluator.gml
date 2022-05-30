
function DevilSellValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    return min(itemData.getValue(), 1);
  }
}
