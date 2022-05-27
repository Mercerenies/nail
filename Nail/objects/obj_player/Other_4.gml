/// DEBUG CODE

// Nothing here right now :)

/*
var lst = [1, 6, 3, 2, 5, 4];
Util.sort(lst, function(a, b) { return a < b; });
show_message(lst);
*/

Inventory.addItem(new Nail(), Side.PLAYER);
Inventory.addItem(new Candle(), Side.PLAYER);

Customers.summon(new DebugCustomer(), function() {});
