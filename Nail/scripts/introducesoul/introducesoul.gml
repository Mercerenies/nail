
function introduceSoul(items, possessive, soulId) {

  if ((ctrl_GameState.playerWorksForSatan) && (ctrl_GameState.charHasSoul(soulId))) {
    items[array_length(items)] = new Soul(soulId, possessive);
  }

}