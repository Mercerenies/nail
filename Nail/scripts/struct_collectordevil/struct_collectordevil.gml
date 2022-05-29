
function CollectorDevil(items) : Customer() constructor {

  _items = items

  _tradeRule = new _CollectorDevil_TradeRule();

  static getName = function() { return "Devil"; }

  static getSprite = function() { return spr_Devil; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("DO YOU HAVE SOULS FOR ME, MORTAL?", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    var traded = standardTradeAttempt(_tradeRule);
    if (traded) {
      var countSouls = 0;
      for (var i = 0; i < array_length(summary.playerTable); i++) {
        if (summary.playerTable[i].getId() == ItemId.SOUL) {
          countSouls += 1;
        }
      }
      ctrl_GameState.soulsDelivered += countSouls;
    }
  }

}

function _CollectorDevil_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "YOUR MORTAL HANDS CANNOT CARRY THAT MUCH."; }

  static customerOverflow = function() { return "I CANNOT CARRY THIS MANY SOULS."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DevilSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "NEXT TIME, MORTAL.";
    } else {
      return "VERY GOOD. VERY GOOD, MORTAL.";
    }
  }

  static badTradeMessage = function(summary) { return "THIS WILL NOT SUFFICE."; }

  static rejectionRule = function() {
    return new DevilRejectionRule();
  }

}
