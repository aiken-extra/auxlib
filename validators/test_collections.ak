use auxlib/collections

test list_and() {
  and {
    [True, True, True] |> collections.list_and,
    [True, False, True] |> collections.list_and |> not,
    [] |> collections.list_and,
  }
}

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
    collections.zip3([1, 2], ["a", "b", "c"], [True, False, True, False]) == [
      (1, "a", True), (2, "b", False),
    ],
    collections.zip3([1, 2, 3], ["a", "b", "c", "d"], [True, False, True]) == [
      (1, "a", True), (2, "b", False), (3, "c", True),
    ],
    collections.zip3([1, 2, 3, 4], ["a", "b", "c"], [True, False]) == [
      (1, "a", True), (2, "b", False),
    ],
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
