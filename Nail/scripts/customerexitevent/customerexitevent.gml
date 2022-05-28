
function customerExitEvent() {
  return new DiaEvent(_customerExitEvent_trigger);
}

function _customerExitEvent_trigger(box) {
  revertTrade();
  obj_Customer.doExit();
}
