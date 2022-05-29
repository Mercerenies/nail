
function Devil(items) : Customer() constructor {

  _items = items

  _tradeRule = new _Devil_TradeRule();

  static getName = function() { return "Devil"; }

  static getSprite = function() { return spr_Devil; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    Inventory.addItem(new Soul("Your"), Side.PLAYER);
    Inventory.suggestTrade([ItemId.SOUL], []);
    obj_DialogueBox.enqueue(new DiaText("GREETINGS, MORTAL. I OFFER YOU MY TREASURES, AND ALL I REQUEST IN RETURN IS YOUR IMMORTAL SOUL.", true));
  }

  static onDepart = function(summary) {
    // If the player still has his soul, hide it.
    with (par_ItemSlot) {
      var contents = getContents();
      if (!is_undefined(contents)) {
        if ((contents.getData().getId() == ItemId.SOUL) && (contents.getData().getName() == "Your Soul")) {
          with (contents) {
            instance_destroy();
          }
        }
      }
    }
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    var traded = standardTradeAttempt(_tradeRule);
    if (traded) {
      var playerGaveSoul = false;
      for (var i = 0; i < array_length(summary.playerTable); i++) {
        if (summary.playerTable[i].getId() == ItemId.SOUL) {
          playerGaveSoul = true;
        }
      }
      if (playerGaveSoul) {
        ctrl_GameState.playerHasSoul = false;
      }
    }
  }

}

function _Devil_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "YOUR MORTAL HANDS CANNOT CARRY THAT MUCH."; }

  static customerOverflow = function() { return "I CANNOT CARRY THIS MANY SOULS."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DevilSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "VERY WELL, MORTAL.";
    } else {
      return "VERY GOOD. VERY GOOD, MORTAL.";
    }
  }

  static badTradeMessage = function(summary) { return "THIS WILL NOT SUFFICE."; }

  static rejectionRule = function() {
    return new DevilRejectionRule();
  }

}
