
function FairyGodmotherSellValuator() : Valuator() constructor {
  // TODO Soul
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.FAIRY_WAND) {
      return 4; // 4, but really 3 since Fairy Godmother has leniency of 1.
    }
    return min(itemData.getValue(), 1);
  }
}
