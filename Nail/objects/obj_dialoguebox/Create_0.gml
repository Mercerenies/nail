
dia = ds_queue_create();
dia_text = "";
display_text = "";
text_is_passive = true;
busy = false;

next = function() {
  text_is_passive = true;
  dia_text = "";
  display_text = "";
  if (!ds_queue_empty(dia)) {
    var ev = ds_queue_dequeue(dia);
    ev.trigger(self);
  }
}

nextUnlessBusy = function() {
  if (busy) {
    return;
  }
  if ((display_text == dia_text) && (text_is_passive)) {
    next();
  }
}

enqueue = function(obj) {
  ds_queue_enqueue(dia, obj);
  nextUnlessBusy();
}

modalIsBlocking = function() {
  return (display_text != dia_text) || (!text_is_passive);
}
