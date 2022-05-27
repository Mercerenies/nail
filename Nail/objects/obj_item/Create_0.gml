
_itemData = NoItem();
_ownerSlot = undefined;

setData = function(data) {
  _itemData = data;
  sprite_index = _itemData.getSprite();
}

getOwnerSlot = function() {
  return _ownerSlot;
}

assignToSlot = function(item_slot) {
  _ownerSlot = item_slot;
  _normalizeXY();
}

_normalizeXY = function() {
  if (instance_exists(_ownerSlot)) {
    x = mean(_ownerSlot.bbox_left, _ownerSlot.bbox_right);
    y = mean(_ownerSlot.bbox_top, _ownerSlot.bbox_bottom);
  }
}
