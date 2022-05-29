
function Professor(items) : Customer() constructor {

  _items = items
  introduceSoul(_items, "Professor's", SOUL_PROFESSOR);

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

  static playerValuation = function() { return new _Professor_Valuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    if (summary.isEmptyTrade()) {
      return "Another time then, perhaps.";
    } else {
      return "Lovely! Let's do business again sometime.";
    }
  }

  static badTradeMessage = function(summary) { return "I'm afraid that wouldn't be in my interests."; }

  static rejectionRule = function() {
    return new ProfessorRejectionRule();
  }

}

function _Professor_Valuator() : Valuator() constructor {
  static valueOf = function(itemData) {
    if (itemData.getId() == ItemId.MATH_TEXTBOOK) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.SCIENCE_TEXTBOOK) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.HISTORY_TEXTBOOK) {
      return itemData.getValue() + 1;
    }
    if (itemData.getId() == ItemId.ENGLISH_TEXTBOOK) {
      return itemData.getValue() + 1;
    }
    return itemData.getValue();
  }
}
