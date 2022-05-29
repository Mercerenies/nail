
function OreganoGentValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.OREGANO) {
      return 4;
    }
    return itemData.getValue();
  }
}
