
function FairyGodmotherSellValuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.FAIRY_WAND) {
      return 4; // 4, but really 3 since Fairy Godmother has leniency of 1.
    }
    if (itemData.getId() == ItemId.SOUL) {
      return itemData.getValue(); // Soul is at full value
    }
    return min(itemData.getValue(), 1);
  }
}
