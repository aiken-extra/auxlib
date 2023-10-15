//// ```
//// ┍━ test_logics ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//// │ PASS [mem:  30377, cpu: 10666506] all_true
//// │ PASS [mem:  29117, cpu:  9912212] any_true
//// │ PASS [mem:  33382, cpu: 11759286] all_false
//// │ PASS [mem:  31521, cpu: 10786436] any_false
//// ┕━━━━━━━━━━━━━━ 4 tests | 4 passed | 0 failed
//// ```

use auxlib/logics

/// https://github.com/aiken-lang/stdlib/blob/888c567afbbbcb4a8550e1e7c146bdbd0b8e9c5f/lib/aiken/list.ak#L49
test all_true() {
  and {
    [True, True, True] |> logics.all_true,
    [True, False, True] |> logics.all_true |> not,
    [] |> logics.all_true,
  }
}

/// https://github.com/aiken-lang/stdlib/blob/888c567afbbbcb4a8550e1e7c146bdbd0b8e9c5f/lib/aiken/list.ak#L183
test any_true() {
  and {
    [True, True] |> logics.any_true,
    [True, False, True] |> logics.any_true,
    [] |> logics.any_true |> not,
    [False, False] |> logics.any_true |> not,
  }
}

test all_false() {
  and {
    [False, False, False] |> logics.all_false,
    [False, True, False] |> logics.all_false |> not,
    [] |> logics.all_false,
  }
}

test any_false() {
  and {
    [False, False] |> logics.any_false,
    [False, True, False] |> logics.any_false,
    [] |> logics.any_false |> not,
    [True, True] |> logics.any_false |> not,
  }
}
