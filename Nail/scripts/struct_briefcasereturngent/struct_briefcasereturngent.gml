
function BriefcaseReturnGent() : Customer() constructor {

  var common = Util.sample(ctrl_ItemLists.commonList);
  _items = [new SkullRing(), new Knife(), common]
  introduceSoul(_items, "Gent's", SOUL_GENT);

  static getName = function() { return "Gent"; }

  static getSprite = function() { return spr_Gent; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hey, kid, I need my briefcase back now.", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();

    var traded = false;
    traded = standardTradeAttempt(new _BriefcaseReturnGent_TradeRule());

    if (traded) {
      summary = Inventory.getSummary();
      var gentHasBriefcase = false;
      for (var i = 0; i < array_length(summary.customerStash); i++) {
        if (summary.customerStash[i].getId() == ItemId.BRIEFCASE) {
          gentHasBriefcase = true;
        }
      }
      if (gentHasBriefcase) {
        ctrl_GameState.briefcaseState = BriefcaseState.UNTOUCHED;
        ctrl_GameState.mobFavor = max(ctrl_GameState.mobFavor + 1, 0);
      } else {
        ctrl_GameState.briefcaseState = BriefcaseState.REFUSED;
        ctrl_GameState.mobFavor = max(ctrl_GameState.mobFavor - 1, 0);
      }
    }

  }

}

function _BriefcaseReturnGent_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You're not that strong, kid."; }

  static customerOverflow = function() { return "I don't want all that stuff on me, kid."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Bah! You'll regret this, kid!";
    } else {
      return "Thanks, kid!";
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
