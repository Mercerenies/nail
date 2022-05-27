
function wrap(f, wrapper) {
  // Note: Global scripts are still treated as reals, so this handles both.
  if ((is_method(f)) || (is_real(f))) {
    return new wrapper(f);
  }
  return f;
}
