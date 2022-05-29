
// Abstract base class
function ItemData() constructor {
  static getId = function() {}
  static getName = function() {}
  static getSprite = function() {}
  static getValue = function() {}
  static getSellValue = function() { return getValue(); }
}

function NoItem() : ItemData() constructor {
  // Trivial implementation of a null object that satisfies ItemData. Should not
  // appear in actual gameplay.
  static getId = function() { return ItemId.NO_ITEM; }
  static getName = function() { return "MissingNo"; }
  static getSprite = function() { return spr_NoItem; }
  static getValue = function() { return 0; }
}

function Nail() : ItemData() constructor {
  static getId = function() { return ItemId.NAIL; }
  static getName = function() { return "Nail"; }
  static getSprite = function() { return spr_Nail; }
  static getValue = function() { return 2; }
  static getSellValue = function() { return 1; }
}

function Candle() : ItemData() constructor {
  static getId = function() { return ItemId.CANDLE; }
  static getName = function() { return "Candle"; }
  static getSprite = function() { return spr_Candle; }
  static getValue = function() { return 1; }
}

function Penny() : ItemData() constructor {
  static getId = function() { return ItemId.PENNY; }
  static getName = function() { return "Penny"; }
  static getSprite = function() { return spr_Penny; }
  static getValue = function() { return 0; }
}

function Baseball() : ItemData() constructor {
  static getId = function() { return ItemId.BASEBALL; }
  static getName = function() { return "Baseball"; }
  static getSprite = function() { return spr_Baseball; }
  static getValue = function() { return 1; }
}

function MathTextbook() : ItemData() constructor {
  static getId = function() { return ItemId.MATH_TEXTBOOK; }
  static getName = function() { return "Math Textbook"; }
  static getSprite = function() { return spr_MathBook; }
  static getValue = function() { return 1; }
}

function EnglishTextbook() : ItemData() constructor {
  static getId = function() { return ItemId.ENGLISH_TEXTBOOK; }
  static getName = function() { return "English Textbook"; }
  static getSprite = function() { return spr_EnglishBook; }
  static getValue = function() { return 1; }
}

function ScienceTextbook() : ItemData() constructor {
  static getId = function() { return ItemId.SCIENCE_TEXTBOOK; }
  static getName = function() { return "Science Textbook"; }
  static getSprite = function() { return spr_ScienceBook; }
  static getValue = function() { return 1; }
}

function HistoryTextbook() : ItemData() constructor {
  static getId = function() { return ItemId.HISTORY_TEXTBOOK; }
  static getName = function() { return "History Textbook"; }
  static getSprite = function() { return spr_HistoryBook; }
  static getValue = function() { return 1; }
}

function Teapot() : ItemData() constructor {
  static getId = function() { return ItemId.TEAPOT; }
  static getName = function() { return "Teapot"; }
  static getSprite = function() { return spr_Teapot; }
  static getValue = function() { return 1; }
}

function Spider() : ItemData() constructor {
  static getId = function() { return ItemId.SPIDER; }
  static getName = function() { return "Spider"; }
  static getSprite = function() { return spr_Spider; }
  static getValue = function() { return 0; }
  static getSellValue = function() { return 1; }
}

function DollarBill() : ItemData() constructor {
  static getId = function() { return ItemId.DOLLAR_BILL; }
  static getName = function() { return "Dollar Bill"; }
  static getSprite = function() { return spr_DollarBill; }
  static getValue = function() { return 1; }
  static getSellValue = function() { return 1; }
}

function Briefcase() : ItemData() constructor {
  static getId = function() { return ItemId.BRIEFCASE; }
  static getName = function() { return "Briefcase of Cash"; }
  static getSprite = function() { return spr_Briefcase; }
  static getValue = function() { return 2; }
}

function GoldBar() : ItemData() constructor {
  static getId = function() { return ItemId.GOLD_BAR; }
  static getName = function() { return "Gold Bar"; }
  static getSprite = function() { return spr_GoldBar; }
  static getValue = function() { return 2; }
}

function GoldStack() : ItemData() constructor {
  static getId = function() { return ItemId.GOLD_STACK; }
  static getName = function() { return "Stack of Gold Bars"; }
  static getSprite = function() { return spr_StackOfGoldBars; }
  static getValue = function() { return 3; }
}

function TreasureChest() : ItemData() constructor {
  static getId = function() { return ItemId.CHEST; }
  static getName = function() { return "Treasure Chest"; }
  static getSprite = function() { return spr_TreasureChest; }
  static getValue = function() { return 3; }
}

function Plate() : ItemData() constructor {
  static getId = function() { return ItemId.PLATE; }
  static getName = function() { return "Plate"; }
  static getSprite = function() { return spr_Plate; }
  static getValue = function() { return 1; }
}

function Spoon() : ItemData() constructor {
  static getId = function() { return ItemId.SPOON; }
  static getName = function() { return "Spoon"; }
  static getSprite = function() { return spr_Spoon; }
  static getValue = function() { return 1; }
}

function Horseshoe() : ItemData() constructor {
  static getId = function() { return ItemId.HORSESHOE; }
  static getName = function() { return "Horseshoe"; }
  static getSprite = function() { return spr_Horseshoe; }
  static getValue = function() { return 1; }
}

function Knife() : ItemData() constructor {
  static getId = function() { return ItemId.KNIFE; }
  static getName = function() { return "Knife"; }
  static getSprite = function() { return spr_Knife; }
  static getValue = function() { return 1; }
}

function SkullRing() : ItemData() constructor {
  static getId = function() { return ItemId.RING; }
  static getName = function() { return "Skull Ring"; }
  static getSprite = function() { return spr_Ring; }
  static getValue = function() { return 1; }
}

function FairyWand() : ItemData() constructor {
  static getId = function() { return ItemId.FAIRY_WAND; }
  static getName = function() { return "Fairy Wand"; }
  static getSprite = function() { return spr_FairyWand; }
  static getValue = function() { return 2; }
}
