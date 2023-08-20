//// ```
//// ┍━ test_collections ━━━━━━━━━━━━━━━━━━━━━━━
//// │ PASS [mem: 30677, cpu: 10735506] list_and
//// │ PASS [mem: 29717, cpu: 10050212] list_or
//// ┕━━━━━━━━━━━━ 2 tests | 2 passed | 0 failed
//// ```

use auxlib/collections

/// https://github.com/aiken-lang/stdlib/blob/888c567afbbbcb4a8550e1e7c146bdbd0b8e9c5f/lib/aiken/list.ak#L49
test list_and() {
  and {
    [True, True, True] |> collections.list_and,
    [True, False, True] |> collections.list_and |> not,
    [] |> collections.list_and,
  }
}

/// https://github.com/aiken-lang/stdlib/blob/888c567afbbbcb4a8550e1e7c146bdbd0b8e9c5f/lib/aiken/list.ak#L183
test list_or() {
  and {
    [True, True] |> collections.list_or,
    [True, False, True] |> collections.list_or,
    [] |> collections.list_or |> not,
    [False, False] |> collections.list_or |> not,
  }
}
