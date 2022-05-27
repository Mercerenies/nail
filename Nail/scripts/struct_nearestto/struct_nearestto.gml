
function NearestTo(obj_) constructor {
  _obj = obj_;

  static distanceTo = function(a) {
    var x0 = mean(_obj.bbox_left, _obj.bbox_right);
    var y0 = mean(_obj.bbox_top, _obj.bbox_bottom);
    var x1 = mean(a.bbox_left, a.bbox_right);
    var y1 = mean(a.bbox_top, a.bbox_bottom);
    return point_distance(x0, y0, x1, y1);
  }

  static call = function(a, b) {
    return distanceTo(a) < distanceTo(b);
  }

}
