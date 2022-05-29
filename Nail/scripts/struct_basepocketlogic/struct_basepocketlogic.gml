
// Appropriate default implementation of PocketLogic for most use
// cases.
function BasePocketLogic(specificList, commonTarget) : PocketLogic() constructor {
  _specificList = specificList;
  _commonTarget = commonTarget;

  static updateInv = function(list, targetCount) {

    // Shuffle the list.
    Util.shuffle(list);

    // Protect the nail if present.
    for (var i = 1; i < array_length(list); i++) {
      if (list[i].getId() == ItemId.NAIL) {
        var tmp = list[0];
        list[0] = list[i];
        list[i] = tmp;
        break;
      }
    }

    // Now purge until we get down to the targetCount minus one.
    var shrunkenSize = min(array_length(list), targetCount - 1);
    array_resize(list, shrunkenSize);

    // Add elements back until we get up to targetCount.
    var commonItems = ctrl_ItemLists.countCommonItems(list);
    for (var i = shrunkenSize; i < targetCount; i++) {
      if (commonItems < _commonTarget) {
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
