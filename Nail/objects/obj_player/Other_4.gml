/// DEBUG CODE

// Nothing here right now :)

/*
var lst = [1, 6, 3, 2, 5, 4];
Util.sort(lst, function(a, b) { return a < b; });
show_message(lst);
*/

Inventory.addItem(new Nail(), Side.PLAYER);
Inventory.addItem(new Candle(), Side.PLAYER);
Inventory.addItem(new Baseball(), Side.PLAYER);

var repeat_ = {
  myself: undefined,
  call: function() {
    Customers.summon(new DebugCustomer(), myself);
  },
};
repeat_.myself = repeat_;
repeat_.call();
