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
  call: function(summary) {
    Customers.summon(new DebugCustomer(), next);
  },
};
var b = {
  next: undefined,
  call: function(summary) {
    ctrl_Pockets.updateInv(POCKET_PROFESSOR);
    var items = ctrl_Pockets.getInv(POCKET_PROFESSOR);
    Customers.summon(new Professor(items), next);
  },
};
a.next = b;
b.next = a;
a.call(new InventorySummary([], [], [], []));
