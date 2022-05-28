
_data = undefined;

_entered_completely = false;
_exiting = false;

_finalSummary = undefined;

target_x = room_width - obj_Player.x;
y = obj_Player.y;
x = target_x + 200;
xstart = x;

_callback = new Function1(function(summary) {});

setCustomerData = function(data) {
  _data = data;
  sprite_index = _data.getSprite();
}

setCallback = function(cb) {
  _callback = cb;
}

performTrade = function() {
  _data.onTradeAttempt();
}

doExit = function() {
  _exiting = true;
  _finalSummary = Inventory.getSummary();
  Inventory.resetInv(Side.CUSTOMER);
  Inventory.setCustomerLabel("");
}

modalIsBlocking = function() {
  return (x > target_x) || (_exiting);
}
