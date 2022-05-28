/// DEBUG CODE

/*
var lst = [1, 6, 3, 2, 5, 4];
Util.sort(lst, function(a, b) { return a < b; });
show_message(lst);
*/

Inventory.addItem(new Nail(), Side.PLAYER);
Inventory.addItem(new Candle(), Side.PLAYER);
Inventory.addItem(new Baseball(), Side.PLAYER);

var a = {
  next: undefined,
  call: function() {
    Customers.summon(new DebugCustomer(), next);
  },
};
var b = {
  next: undefined,
  call: function() {
    Customers.summon(new Professor(), next);
  },
};
a.next = b;
b.next = a;
a.call();
