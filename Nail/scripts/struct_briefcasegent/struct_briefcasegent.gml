
function BriefcaseGent() : Customer() constructor {

  var common = Util.sample(ctrl_ItemLists.commonList);
  _items = [new SkullRing(), new Knife(), common, new Briefcase()]

  static getName = function() { return "Gent"; }

  static getSprite = function() { return spr_Gent; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaEvent(_BriefcaseGent_suggestTrade));
    obj_DialogueBox.enqueue(new DiaText("Hey, kid! Take this briefcase! Don't ask any questions! Just do it!", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();

    var traded = false;
    // Special case: If it's the briefcase for nothing, take the deal.
    // Otherwise, default trade rules.
    if ((array_length(summary.playerTable) == 0) && (array_length(summary.customerTable) == 1) && (summary.customerTable[0].getId() == ItemId.BRIEFCASE)) {
      traded = true;
      Inventory.doTrade();
      obj_DialogueBox.enqueue(new DiaText("Don't tell anyone you got that, kid! Especially not the cops! I'll be back for it later!", false));
      obj_DialogueBox.enqueue(customerExitEvent());
    } else {
      traded = standardTradeAttempt(new _BriefcaseGent_TradeRule());
    }

    if (traded) {
      summary = Inventory.getSummary();
      var gentHasBriefcase = false;
      for (var i = 0; i < array_length(summary.customerStash); i++) {
        if (summary.customerStash[i].getId() == ItemId.BRIEFCASE) {
          gentHasBriefcase = true;
        }
      }
      if (!gentHasBriefcase) {
        ctrl_GameState.briefcaseState = BriefcaseState.CARRYING;
      }
    }

  }

}

function _BriefcaseGent_suggestTrade() {
  Inventory.suggestTrade([], [ItemId.BRIEFCASE]);
}

function _BriefcaseGent_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You're not that strong, kid."; }

  static customerOverflow = function() { return "I don't want all that stuff on me, kid."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Bah! You'll regret this, kid!";
    } else {
      return "Make it quick! I gotta get outta here!";
    }
  }

  static badTradeMessage = function(summary) { return "Don't try to shortchange me, kid."; }

  static rejectionRule = function() {
    return new GentRejectionRule();
  }

  static keepRule = function() {
    return new GentKeepRule();
  }

}
