
// Appropriate default implementation of PocketLogic for most use
// cases.
function BasePocketLogic(specificList) : PocketLogic() constructor {
  _specificList = specificList;

  static updateInv = function(list, targetCount) {

    // Shuffle the list.
    Util.shuffle(list);

    // Now purge until we get down to the targetCount minus one.
    var shrunkenSize = min(array_length(list), targetCount - 1);
    array_resize(list, shrunkenSize);

    // Add elements back until we get up to targetCount.
    var commonItems = ctrl_ItemLists.countCommonItems(list);
    for (var i = shrunkenSize; i < targetCount; i++) {
      if (commonItems < 1) {
        // Take a common item if we don't have one.
        commonItems++;
        list[i] = Util.sample(ctrl_ItemLists.commonList);
      } else {
        var storedItem = popStoredItemFromDeck();
        if (!is_undefined(storedItem)) {
          // Take a stored item if one exists.
          list[i] = storedItem;
        } else {
          // Otherwise, sample from the character's own reserves.
          list[i] = Util.sample(_specificList);
        }
      }
    }

    // Shuffle the list again (so you can't tell which ones are new).
    Util.shuffle(list);

  }

}
