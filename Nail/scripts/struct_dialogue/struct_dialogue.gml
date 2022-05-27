
// Abstract base class
function Dialogue() constructor {
  // Takes an obj_DialogueBox
  static trigger = function(box) {}
}

function DiaText(text, passive) : Dialogue() constructor {
  _text = text;
  _passive = passive;

  static trigger = function(box) {
    box.display_text = "";
    box.dia_text = _text;
    box.text_is_passive = _passive;
  }

}

function DiaEvent(callable) : Dialogue() constructor {
  _callable = wrap(callable, Function0);

  static trigger = function(box) {
    box.busy = true;
    _callable.call();
    box.busy = false;
    box.next();
  }

}
