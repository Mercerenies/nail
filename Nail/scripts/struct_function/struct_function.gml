
function Function() constructor {}

function Function0(scr) : Function() constructor {
  _script = scr;
  static call = function() { return _script() }
}

function Function1(scr) : Function() constructor {
  _script = scr;
  static call = function(a) { return _script(a) }
}

function Function2(scr) : Function() constructor {
  _script = scr;
  static call = function(a, b) { return _script(a, b) }
}
