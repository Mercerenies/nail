
#macro Util global.__module_Util

Util = {};

// In-place sort
Util.sort = function(list, lt) {
  lt = wrap(lt, Function2);
  _Util_quicksort(list, lt, 0, array_length(list));
}

Util.filter = function(list, pred) {
  pred = wrap(pred, Function1);
  var newlist = [];
  var j = 0;
  for (var i = 0; i < array_length(list); i++) {
    if (pred.call(list[i])) {
      newlist[j++] = list[i];
    }
  }
  return newlist;
}

Util.sample = function(list) {
  if (array_length(list) == 0) {
    return undefined;
  }
  var idx = irandom(array_length(list) - 1)
  return list[idx];
}

function _Util_quicksort(list, lt, begin_, end_) {
  if (begin_ >= end_) {
    return;
  }
  var pivot = begin_;
  for (var i = begin_ + 1; i < end_; i++) {
    if (lt.call(list[i], list[begin_])) {
      var tmp = list[i];
      list[i] = list[pivot + 1];
      list[pivot + 1] = tmp;
      pivot++;
    }
  }
  var tmp_begin_ = list[begin_];
  list[begin_] = list[pivot];
  list[pivot] = tmp_begin_;
  _Util_quicksort(list, lt, begin_, pivot);
  _Util_quicksort(list, lt, pivot + 1, end_);
}
