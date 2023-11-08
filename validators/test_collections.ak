//// ```
//// ┍━ test_collections ━━━━━━━━━━━━━━━━━━━━━━━━
//// │ PASS [mem:  30377, cpu: 10666506] list_and
//// │ PASS [mem:  29117, cpu:  9912212] list_or
//// │ PASS [mem:  95047, cpu: 38067735] zip3
//// │ PASS [mem: 134431, cpu: 51525708] unzip3
//// ┕━━━━━━━━━━━━━ 4 tests | 4 passed | 0 failed
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

test zip3() {
  and {
    collections.zip3([1,
        2], ["a",
        "b",
        "c"], [True, False, True, False]) == [(1, "a", True), (2, "b", False)],
    collections.zip3([1,
        2,
        3], ["a",
        "b",
        "c",
        "d"], [True, False, True]) == [
      (1, "a", True),
      (2, "b", False),
      (3, "c", True),
    ],
    collections.zip3([1,
        2,
        3,
        4], ["a",
        "b", "c"], [True, False]) == [(1, "a", True), (2, "b", False)],
  }
}

test unzip3() {
  and {
    collections.unzip3([(1, "a", True), (2, "b", False)]) == (
      [1, 2],
      ["a", "b"],
      [True, False],
    ),
    collections.unzip3([(1, "a", True), (2, "b", False), (3, "c", True)]) == (
      [1, 2, 3],
      ["a", "b", "c"],
      [True, False, True],
    ),
    collections.unzip3(
      [(1, "a", True), (2, "b", False), (3, "c", True), (4, "d", False)],
    ) == ([1, 2, 3, 4], ["a", "b", "c", "d"], [True, False, True, False]),
  }
}
