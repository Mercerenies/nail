
function ContractDevil(items) : Customer() constructor {

  _items = items
  _items[array_length(_items)] = new Contract();

  static getName = function() { return "Devil"; }

  static getSprite = function() { return spr_Devil; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    _suggestDeal();
    obj_DialogueBox.enqueue(new DiaText("GREETINGS, MORTAL. I WOULD LIKE YOU TO COLLECT SOULS FOR ME.", false));
    obj_DialogueBox.enqueue(new DiaText("SIGN HERE AND I WILL TRADE MATERIAL POSSESSIONS FOR HUMAN SOULS YOU COLLECT.", true));
  }

  static _suggestDeal = function() {
    Inventory.suggestTrade([], [ItemId.CONTRACT]);
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    if (summary.isEmptyTrade()) {
      obj_DialogueBox.enqueue(new DiaText("VERY WELL, MORTAL.", false));
      obj_DialogueBox.enqueue(customerExitEvent());
      return;
    }

    if (array_length(summary.playerTable) > 0) {
      _suggestDeal();
      obj_DialogueBox.enqueue(new DiaText("I HAVE NO INTEREST IN YOUR POSSESSIONS, MORTAL.", false));
      return;
    }

    if ((array_length(summary.customerTable) != 1) || (summary.customerTable[0].getId() != ItemId.CONTRACT)) {
      _suggestDeal();
      obj_DialogueBox.enqueue(new DiaText("SIGN THE CONTRACT, MORTAL, AND ALL YOUR WISHES SHALL COME TRUE.", false));
      return;
    }

    Inventory.doTrade();
    ctrl_GameState.playerWorksForSatan = true;

    // Remove the contract.
    with (par_ItemSlot) {
      var contents = getContents();
      if (!is_undefined(contents)) {
        if (contents.getData().getId() == ItemId.CONTRACT) {
          with (contents) {
            instance_destroy();
          }
        }
      }
    }

    obj_DialogueBox.enqueue(new DiaText("BRING ME SOULS, MORTAL. AND I SHALL BRING YOU ALL YOU DESIRE.", false));
    obj_DialogueBox.enqueue(customerExitEvent());

  }

  static getTradeButtonIndex = function() {
    var summary = Inventory.getSummary();

    if (array_length(summary.playerTable) > 0) {
      return -1;
    }

    if ((array_length(summary.customerTable) != 1) || (summary.customerTable[0].getId() != ItemId.CONTRACT)) {
      return -1;
    }

    return TradeButtonIndex.SIGN;

  }

}
