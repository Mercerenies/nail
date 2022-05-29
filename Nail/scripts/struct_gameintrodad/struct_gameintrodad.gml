
function GameIntroDad() : Customer() constructor {

  _items = [new Nail()]
  introduceSoul(_items, "Dad's", SOUL_DAD);

  static getName = function() { return "Dad"; }

  static getSprite = function() { return spr_Dad; }

  static getItems = function() {
    return _items;
  }

  static onIntroduce = function() {
    obj_DialogueBox.enqueue(new DiaText("Hiya, son. I'm so proud of you for starting up your own market.", false));
    obj_DialogueBox.enqueue(new DiaText("Nice table you've got here. I guess this is where you'll do the trading.", false));
    obj_DialogueBox.enqueue(new DiaText("Hey! You should trade with me, son. Take this nail out of my items and drag it to the table with the mouse.", false));
    obj_DialogueBox.enqueue(new DiaText("Then take the penny out of yours and put it on the table.", false));
    obj_DialogueBox.enqueue(new DiaText("Hit the 'Trade' button when everything is on the table.", true));
  }

  static onTradeAttempt = function() {
    var summary = Inventory.getSummary();
    if (array_length(summary.playerTable) < 1) {
      obj_DialogueBox.enqueue(new DiaText("No, son, I want you to trade me that penny. Put it on the table using the mouse.", true));
    } else if (array_length(summary.customerTable) < 1) {
      obj_DialogueBox.enqueue(new DiaText("No, son, I want to trade you this nail. Put it on the table using the mouse.", true));
    } else {
      Inventory.doTrade();
      obj_DialogueBox.enqueue(new DiaText("Great work, son! With that nail, I'm sure you'll do great things!", false));
      obj_DialogueBox.enqueue(new DiaText("Remember, different people want different things. If you offer someone something they like, they'll be willing to pay a king's ransom for it.", false));
      obj_DialogueBox.enqueue(new DiaText("I'll come by to check on you later, son. Good luck! Get rich and change the world!", false));
      obj_DialogueBox.enqueue(customerExitEvent());
    }
  }

}
