
// Abstract base class.
function Valuator() constructor {

  static valueOf = function(itemData) {}

  // Provided method. (Takes a list of ItemData)
  static valueOfItems = function(arr) {
    var sum = 0;
    for (var i = 0; i < array_length(arr); i++) {
      sum += valueOf(arr[i]);
    }
    return sum;
  }

}
