
function OreganoGent() : Customer() constructor {

  var common1 = Util.sample(ctrl_ItemLists.commonList);
  var common2 = Util.sample(ctrl_ItemLists.commonList);
  _items = [new SkullRing(), new Knife(), common1, common2, new Oregano()]
  introduceSoul(_items, "Gent's", SOUL_GENT);

  static getName = function() { return "Gent"; }

  static getSprite = function() { return spr_Gent; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    Inventory.suggestTrade([], [ItemId.OREGANO]);
    obj_DialogueBox.enqueue(new DiaText("Hey kid, you wanna... buy some... you know... oregano?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(new _OreganoGent_TradeRule());
  }

}

function _OreganoGent_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "You're not that strong, kid."; }

  static customerOverflow = function() { return "I don't want all that stuff on me, kid."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Later, kid.";
    } else {
      return "Pleasure doin' business, kid!";
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
