
#macro Inventory global.__module_Inventory

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
