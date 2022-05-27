
#macro Inventory global.__module_Inventory

Inventory = {};

Inventory.addPlayerItem = function(item_data) {

  var slots = _Inventory_getAllItemSlotsCanonical();
  slots = Util.filter(slots, function(slot) { return slot.isStandard() && slot.side == Side.PLAYER && is_undefined(slot.getContents()) });
  if (array_length(slots) == 0) {
    return undefined;
  }
  var slot = slots[0];

  var item = instance_create_layer(0, 0, "Items", obj_Item);
  item.setData(item_data);
  item.assignToSlot(slot);
  return item;
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
