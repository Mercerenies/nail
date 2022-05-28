
if ((!_entered_completely) && (x > target_x)) {
  x -= 6;

  if (x <= target_x) {
    _entered_completely = true;
    Inventory.resetInv(Side.CUSTOMER);
    var items = _data.getItems();
    for (var i = 0; i < array_length(items); i++) {
      Inventory.addItem(items[i], Side.CUSTOMER);
    }
    var text = _data.getPossessiveName() + "\nItems";
    Inventory.setCustomerLabel(string_upper(text));
    _data.onIntroduce();
  }

}

if (_exiting) {
  x += 6;
  if (x >= xstart) {
    _callback.call(_finalSummary);
    instance_destroy();
  }
}
