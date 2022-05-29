
// ctrl_Decks.popStoredItem might need to be called before ctrl_Decks'
// create event has run. If this happens, we will just return
// undefined instead. (If the deck hasn't initialized yet, then
// clearly it doesn't have anything in it yet)
function popStoredItemFromDeck() {
  if ((instance_exists(ctrl_Decks)) && (variable_instance_exists(ctrl_Decks, "popStoredItem"))) {
    return ctrl_Decks.popStoredItem();
  } else {
    return undefined;
  }
}
