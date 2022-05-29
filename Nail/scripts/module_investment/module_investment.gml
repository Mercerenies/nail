
#macro Investment global.__module_Investment

Investment = {};

Investment.itemToLevel = function(itemData) {
  switch (itemData.getId()) {
  case ItemId.PENNY:
    return 1;
  case ItemId.DOLLAR_BILL:
    return 2;
  case ItemId.BRIEFCASE:
    return 3;
  case ItemId.GOLD_BAR:
    return 4;
  case ItemId.GOLD_STACK:
    return 5;
  case ItemId.CHEST:
    return 6;
  }
  return -1;
}

Investment.levelToItem = function(lvl) {
  switch (lvl) {
  case 1:
    return new Penny();
  case 2:
    return new DollarBill();
  case 3:
    return new Briefcase();
  case 4:
    return new GoldBar();
  case 5:
    return new GoldStack();
  case 6:
  case 7: // Fall-through for upgrades to chest (chest++ is also chest)
    return new TreasureChest();
  }
  return new Penny();
}
