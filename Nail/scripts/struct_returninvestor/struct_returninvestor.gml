
function ReturnInvestor(items, investedItem) : Customer() constructor {

  _items = items
  _items[array_length(_items)] = investedItem;
  _investedItem = investedItem;
  introduceSoul(_items, "Investor's", SOUL_INVESTOR);

  _tradeRule = new _ReturnInvestor_TradeRule(investedItem);

  static getName = function() { return "Investor"; }

  static getSprite = function() { return spr_Investor; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    _suggestDeal();
    obj_DialogueBox.enqueue(new DiaText("Good news! Your investment came through! Here's your money.", true));
  }

  static _suggestDeal = function() {
    Inventory.suggestTrade([], [_investedItem.getId()]);
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    if (summary.isEmptyTrade()) {
      _suggestDeal();
      obj_DialogueBox.enqueue(new DiaText("I'm trying to give you your money, sir.", true));
      return;
    }
    standardTradeAttempt(_tradeRule);
  }

}

function _ReturnInvestor_TradeRule(investedItem) : TradeRule() constructor {
  _investedItem = investedItem;

  static playerOverflow = function() { return "You can't carry that."; }

  static customerOverflow = function() { return "I can't carry that."; }

  static playerValuation = function() { return new DefaultValuator(); }

  static customerValuation = function() { return new DefaultSellValuator(); }

  static departureMessage = function(summary) {
    return "Until next time, sir.";
  }

  static badTradeMessage = function(summary) { return "I fear that deal is not in my professional interests."; }

  static rejectionRule = function() {
    return new InvestorRejectionRule();
  }

  static getLeniency = function() {
    return _investedItem.getSellValue();
  }

}
