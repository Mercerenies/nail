
#macro Inventory global.__module_Inventory

Inventory = {};

Inventory.resetInv = function(target_side) {
  with (par_ItemSlot) {
    if (side == target_side) {
      var contents = getContents();
      if (!is_undefined(contents)) {
        with (contents) {
          instance_destroy();
        }
      }
    }
  }
}

Inventory.addItem = function(item_data, side) {

  var slots = _Inventory_getAllItemSlotsCanonical();
  slots = Util.filter(slots, new _Inventory_IsEmptyAndOnSide(side));
  if (array_length(slots) == 0) {
    return undefined;
  }
  var slot = slots[0];

  var item = instance_create_layer(0, 0, "Items", obj_Item);
  item.setData(item_data);
  item.assignToSlot(slot);
  return item;
}

Inventory.setCustomerLabel = function(text) {
  with (obj_InventoryLabel) {
    if (x > room_width / 2) {
      self.text = text;
      break;
    }
  }
}

Inventory.getSummary = function() {
  var playerStash = [];
  var playerStashI = 0;
  var playerTable = [];
  var playerTableI = 0;
  var customerTable = [];
  var customerTableI = 0;
  var customerStash = [];
  var customerStashI = 0;
  with (par_ItemSlot) {
    var contents = getContents();
    if (!is_undefined(contents)) {
      var data = contents.getData();
      if (side == Side.PLAYER) {
        if (isStandard()) {
          playerStash[playerStashI++] = data;
        } else {
          playerTable[playerTableI++] = data;
        }
      } else {
        if (isStandard()) {
          customerStash[customerStashI++] = data;
        } else {
          customerTable[customerTableI++] = data;
        }
      }
    }
  }
  return new InventorySummary(playerStash, playerTable, customerTable, customerStash);
}

// Perform whatever trade is actively on the table.
Inventory.doTrade = function() {
  var summary = Inventory.getSummary();

  // Delete all the items on the table.
  with (par_ItemSlot) {
    if (!isStandard()) {
      eraseContents();
    }
  }

  // Do the actual inventory updates. (Note: This does not check for
  // overflow and will silently discard items if there's no space. The
  // trade should be rejected by the character if overflow would
  // occur.)
  var i;
  for (i = 0; i < array_length(summary.playerTable); i++) {
    Inventory.addItem(summary.playerTable[i], Side.CUSTOMER);
  }
  for (i = 0; i < array_length(summary.customerTable); i++) {
    Inventory.addItem(summary.customerTable[i], Side.PLAYER);
  }

}

function _Inventory_IsEmptyAndOnSide(side) constructor {
  _side = side;

  static call = function(slot) {
    return slot.isStandard() && slot.side == _side && is_undefined(slot.getContents());
  }

}

function _Inventory_getAllItemSlots() {
  var items = [];
  var idx = 0;
  with (par_ItemSlot) {
    items[idx++] = self;
  }
  return items;
}

function _Inventory_getAllItemSlotsCanonical() {
  var items = _Inventory_getAllItemSlots();
  Util.sort(items, function(a, b) {
    if (a.y < b.y) {
      return true;
    } else {
      return (a.y == b.y) && (a.x < b.x);
    }
  });
  return items;
}
