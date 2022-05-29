
#macro Customers global.__module_Customers

Customers = {}

// Takes a Customer object and a unary callback which is invoked when
// the customer is completely offscreen.
Customers.summon = function(customer, cb) {
  cb = wrap(cb, Function1);
  var inst = instance_create_layer(-320, -320, "People", obj_Customer);
  inst.setCustomerData(customer);
  inst.setCallback(cb);
}

// Customers.summon but handles the standard character's inventory as
// well. customerType shall be a unary constructor which takes an item
// list.
Customers.summonStandard = function(customerType, pocketIndex, cb) {
  cb = wrap(cb, Function1);
  var items = ctrl_Pockets.getInv(pocketIndex);
  Customers.summon(new customerType(items), new _Customers_summonStandard_callback(pocketIndex, cb));
}

function _Customers_summonStandard_callback(pocketIndex, cb) constructor {
  _pocketIndex = pocketIndex;
  _cb = cb;
  static call = function(summary) {
    // Do not return the soul to the inventory.
    var items = Util.filter(summary.customerStash, function(item) { return item.getId() != ItemId.SOUL; });
    ctrl_Pockets.replaceInv(_pocketIndex, items);
    _cb.call(summary);
  }
}
