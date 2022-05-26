
#macro Util global.__module_Util

Util = {};

// In-place sort
Util.sort = function(list, lt) {
  _Util_quicksort(list, lt, 0, array_length(list));
}

function _Util_quicksort(list, lt, begin_, end_) {
  if (begin_ >= end_) {
    return;
  }
  var pivot = begin_;
  for (var i = begin_ + 1; i < end_; i++) {
    if (lt(list[i], list[begin_])) {
      if (pivot + 1 != i) {
        var tmp = list[i];
        list[i] = list[pivot + 1];
        list[pivot + 1] = tmp;
        pivot++;
      }
    }
  }
  var tmp_begin_ = list[begin_];
  list[begin_] = list[pivot];
  list[pivot] = tmp_begin_;
  _Util_quicksort(list, lt, begin_, pivot);
  _Util_quicksort(list, lt, pivot + 1, end_);
}
