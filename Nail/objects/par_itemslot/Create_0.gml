
// A standard item slot is one of the ones to the far left or right
// which stores the character's inventory. Table slots are not
// standard.
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

eraseContents = function() {
  var contents = getContents();
  if (!is_undefined(contents)) {
    with (contents) {
      instance_destroy();
    }
  }
}

side = Side.PLAYER;
if (x >= room_width / 2) {
  side = Side.CUSTOMER;
}
