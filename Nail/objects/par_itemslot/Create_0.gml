
isStandard = function() {
  return false;
}

getContents = function() {
  with (obj_Item) {
    if (getOwnerSlot() == other) {
      return self;
    }
  }
  return undefined;
}

side = Side.PLAYER;
if (x >= room_width / 2) {
  side = Side.CUSTOMER;
}
