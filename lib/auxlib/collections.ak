use auxlib/logics.{all_true, any_true}

/// Tells whether all of the `booleans` are `true`
pub fn list_and(bool_list: List<Bool>) -> Bool {
  bool_list |> all_true
}

/// Tells whether any of the `booleans` is `true`
pub fn list_or(bool_list: List<Bool>) -> Bool {
  bool_list |> any_true
}
