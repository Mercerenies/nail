
function Professor(items) : Customer() constructor {

  _items = items

  _tradeRule = new _Professor_TradeRule();

  static getName = function() { return "Professor"; }

  static getSprite = function() { return spr_Professor; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Good afternoon. Are you interested in making a trade, young man?", true));
  }

  static onTradeAttempt = function() {
    standardTradeAttempt(_tradeRule);
  }

}

function _Professor_TradeRule() : TradeRule() constructor {

  static playerOverflow = function() { return "Goodness me, you'll never be able to carry that!"; }

  static customerOverflow = function() { return "Goodness me, I'll never be able to carry that!"; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultValuator(); }

  static departureMessage = function() { return "Lovely! Let's do business again sometime."; }

  static badTradeMessage = function() { return "I'm afraid that wouldn't be in my interests."; }

  static hatesItem = function(itemData) {
    return undefined;
  }
}
