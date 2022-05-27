
#macro UI global.__module_UI

UI = {};

UI.isShowingModal = function() {
  with (all) {
    if (variable_instance_exists(self, "modalIsBlocking") && self.modalIsBlocking()) {
      return true;
    }
  }
  return false;
}