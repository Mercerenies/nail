
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
