//// ```
//// ┍━ test_logics ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//// │ PASS [mem:  28877, cpu: 10323876] all_true
//// │ PASS [mem:  27917, cpu:  9638108] any_true
//// │ PASS [mem:  31882, cpu: 11416656] all_false
//// │ PASS [mem:  30321, cpu: 10512332] any_false
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
