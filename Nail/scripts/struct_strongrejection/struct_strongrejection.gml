
function StrongRejection(message_) constructor {
  _message = message_;

  static call = function() {
    obj_DialogueBox.enqueue(new DiaText(_message, false));
    obj_DialogueBox.enqueue(customerExitEvent());
  }

}
