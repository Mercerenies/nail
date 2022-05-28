
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
