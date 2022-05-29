
// Miscellaneous helpers for random generation

itemStorage = ds_queue_create();

stdChars = new TrailingRandomDeck([
  new StdCharacterData(Baker, POCKET_BAKER),
  new StdCharacterData(Maiden, POCKET_MAIDEN),
  new StdCharacterData(OldMaid, POCKET_OLDMAID),
  new StdCharacterData(BroSis, POCKET_BROSIS),
  new StdCharacterData(Professor, POCKET_PROFESSOR),
  new StdCharacterData(Farmer, POCKET_FARMER),
]);

groupA = new TrailingRandomDeck([GroupA.BRIEFCASE, GroupA.OREGANO, GroupA.DAD_CHECK]);
groupB = new TrailingRandomDeck([GroupB.INVESTOR, GroupB.SATAN, GroupB.FAIRY_GODMOTHER, GroupB.GROUP_A]);

popStoredItem = function() {
  if (ds_queue_empty(itemStorage)) {
    return undefined;
  } else {
    return ds_queue_dequeue(itemStorage);
  }
}

storeItem = function(item) {
  ds_queue_enqueue(itemStorage, item);
}

storeItems = function(items) {
  for (var i = 0; i < array_length(items); i++) {
    storeItem(items[i]);
  }
}
