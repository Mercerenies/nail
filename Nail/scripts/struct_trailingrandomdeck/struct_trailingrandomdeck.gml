
// This random generator produces the values in the list in a random
// order. Each value will be selected exactly once. It acts like a
// deck of cards, moving cards to a discard pile as they're selected.
// When we draw the last card, the discard pile is reshuffled
// (excluding the card we just drew) and flipped back over. The single
// card we just drew then becomes the new discard pile.
function TrailingRandomDeck(list) constructor {
  _list = list;
  _listindex = 0;
  _discard = [];

  Util.shuffle(_list);

  static _reshuffleDiscard = function() {
    _list = _discard;
    _listindex = 0;
    Util.shuffle(_list);
    _discard = [];
  }

  static sample = function() {
    var selection = _list[_listindex];
    _listindex++;
    if (_listindex >= array_length(_list)) {
      _reshuffleDiscard();
    }
    _discard[array_length(_discard)] = selection;
    return selection;
  }

}
