
_data = undefined;

_entered_completely = false;

target_x = room_width - obj_Player.x;
y = obj_Player.y;
x = target_x + 200;

_callback = new Function0(function() {});

setCustomerData = function(data) {
  _data = data;
  sprite_index = _data.getSprite();
}

setCallback = function(cb) {
  _callback = cb;
}

modalIsBlocking = function() {
  return x > target_x;
}
