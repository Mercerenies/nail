
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
    ////
  }

}

function _BriefcaseGent_suggestTrade() {
  Inventory.suggestTrade([], [ItemId.BRIEFCASE]);
}
