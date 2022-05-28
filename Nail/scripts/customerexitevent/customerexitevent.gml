
function customerExitEvent() {
  return new DiaEvent(_customerExitEvent_trigger);
}

function _customerExitEvent_trigger(box) {
  obj_Customer.doExit();
}
