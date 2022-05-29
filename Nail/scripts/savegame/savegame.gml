
function saveGame() {
  ini_open("data.ini");
  for (var i = 0; i < 7; i++) {
    ini_write_real("endings", string(i), ctrl_PersistentState.gotEnding[i]);
  }
  ini_close();
}
