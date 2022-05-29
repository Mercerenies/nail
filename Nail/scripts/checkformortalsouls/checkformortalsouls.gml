
function checkForMortalSouls() {
  var summary = Inventory.getSummary();
  for (var i = 0; i < array_length(summary.playerStash); i++) {
    var curr = summary.playerStash[i];
    if (curr.getId() == ItemId.SOUL) {
      var soulId = curr.getSoulId();
      ctrl_GameState.takeCharSoul(soulId);
    }
  }
}
