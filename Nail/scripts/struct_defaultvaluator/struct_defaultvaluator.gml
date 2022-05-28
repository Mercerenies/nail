
function DefaultValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    return itemData.getValue();
  }
}
