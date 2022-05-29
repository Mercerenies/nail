
function loadGame() {
  ini_open("data.ini");
  for (var i = 0; i < 7; i++) {
    ctrl_PersistentState.gotEnding[i] = ini_read_real("endings", string(i), 0);
  }
  ini_close();
}
