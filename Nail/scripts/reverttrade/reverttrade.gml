
// Pull the items off the table and back to their respective
// inventories.
function revertTrade(){
  var summary = Inventory.getSummary();

  // Delete all the items on the table.
  with (par_ItemSlot) {
    if (!isStandard()) {
      eraseContents();
    }
  }

  var i;
  for (i = 0; i < array_length(summary.playerTable); i++) {
    Inventory.addItem(summary.playerTable[i], Side.PLAYER);
  }
  for (i = 0; i < array_length(summary.customerTable); i++) {
    Inventory.addItem(summary.customerTable[i], Side.CUSTOMER);
  }

}
