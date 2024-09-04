use aiken/collection/list.{foldr, map3, push}
use auxlib/logics.{all_true, any_true}

// ## List

/// Tells whether all of the `booleans` are `true`
pub fn list_and(bool_list: List<Bool>) -> Bool {
  bool_list |> all_true
}

/// Tells whether any of the `booleans` is `true`
pub fn list_or(bool_list: List<Bool>) -> Bool {
  bool_list |> any_true
}

// ## Zip

/// Combine 3 lists together into a list of 3-tuple
pub fn zip3(az: List<a>, bz: List<b>, cz: List<c>) -> List<(a, b, c)> {
  map3(az, bz, cz, fn(a, b, c) { (a, b, c) })
}

/// Decompose a list of 3-tuple into a tuple of 3 lists
pub fn unzip3(abc: List<(a, b, c)>) -> (List<a>, List<b>, List<c>) {
  foldr(
    abc,
    ([], [], []),
    fn(a, z) {
      let (a, b, c) = a
      let (az, bz, cz) = z
      (az |> push(a), bz |> push(b), cz |> push(c))
    },
  )
}
