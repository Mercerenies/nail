
// Abstract base class
function ItemData() constructor {
  static getId = function() {}
  static getName = function() {}
  static getSprite = function() {}
  static getValue = function() {}
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
  static getValue = function() { return 1; }
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
