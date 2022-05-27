
// Note: obj_DrawDraggingItem is a friend class :)

#macro OBJ_ITEM_MAX_TARGET_DISTANCE 64

_itemData = NoItem();
_previousOwnerSlot = undefined;
_ownerSlot = undefined;

_dragging = false;
_anchorX = 0;
_anchorY = 0;

getData = function() {
  return _itemData;
}

setData = function(data) {
  _itemData = data;
  sprite_index = _itemData.getSprite();
}

isDragging = function() {
  return _dragging;
}

getOwnerSlot = function() {
  return _ownerSlot;
}

assignToSlot = function(item_slot) {
  _previousOwnerSlot = undefined;
  _ownerSlot = item_slot;
  _normalizeXY();
}

_normalizeXY = function() {
  if (instance_exists(_ownerSlot)) {
    x = mean(_ownerSlot.bbox_left, _ownerSlot.bbox_right);
    y = mean(_ownerSlot.bbox_top, _ownerSlot.bbox_bottom);
  }
}

_targetingSlot = function() {
  if (!is_undefined(_ownerSlot)) {
    return _ownerSlot;
  }
  var otherSlotSide = (is_undefined(_previousOwnerSlot) ? -1 : _previousOwnerSlot.side);
  var slots = [];
  var j = 0;
  with (par_ItemSlot) {
    if ((is_undefined(getContents())) && (self != other._previousOwnerSlot) && (side == otherSlotSide)) {
      slots[j++] = self;
    }
  }
  if (array_length(slots) > 0) {
    var criterion = new NearestTo(self);
    Util.sort(slots, criterion);
    if (criterion.distanceTo(slots[0]) < OBJ_ITEM_MAX_TARGET_DISTANCE) {
      return slots[0];
    }
  }
  return undefined;
}
