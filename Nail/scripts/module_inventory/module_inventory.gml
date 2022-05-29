
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

// Returns true if each participant has room to store all of the
// proposed items in their respective inventories.
Inventory.sizesMakeSense = function() {
  var summary = Inventory.getSummary();

  if (array_length(summary.playerStash) + array_length(summary.customerTable) > INVENTORY_SIZE) {
    return SizeError.PLAYER_CANNOT_CARRY;
  }

  if (array_length(summary.customerStash) + array_length(summary.playerTable) > INVENTORY_SIZE) {
    return SizeError.CUSTOMER_CANNOT_CARRY;
  }

  return SizeError.NONE
}

Inventory.getDraggedItem = function() {
  with (obj_Item) {
    if (isDragging()) {
      return self;
    }
  }
  return noone;
}

Inventory.toTable = function(side, itemId) {

  var matchingItem = undefined;
  with (par_ItemSlot) {
    var contents = getContents();
    if ((self.side == side) && (isStandard()) && (!is_undefined(contents))) {
      if (contents.getData().getId() == itemId) {
        matchingItem = contents;
        break;
      }
    }
  }

  var matchingSlot = undefined;
  with (par_ItemSlot) {
    if ((self.side == side) && (!isStandard()) && (is_undefined(getContents()))) {
      // Pick the one with the smallest Y coordinate :)
      if ((is_undefined(matchingSlot)) || (matchingSlot.y > self.y)) {
        matchingSlot = self;
      }
    }
  }

  if ((!is_undefined(matchingItem)) && (!is_undefined(matchingSlot))) {
    matchingItem.assignToSlot(matchingSlot);
  }
}

// Takes two lists of item IDs
Inventory.suggestTrade = function(playerSide, customerSide) {
  revertTrade();
  for (var i = 0; i < array_length(playerSide); i++) {
    Inventory.toTable(Side.PLAYER, playerSide[i]);
  }
  for (var i = 0; i < array_length(customerSide); i++) {
    Inventory.toTable(Side.CUSTOMER, customerSide[i]);
  }
}

Inventory.totalPlayerValue = function() {
  var summary = Inventory.getSummary();
  var playerValue = 0;
  for (var i = 0; i < array_length(summary.playerStash); i++) {
    playerValue += summary.playerStash[i].getValue();
  }
  return playerValue;
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
