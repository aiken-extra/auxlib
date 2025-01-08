use auxlib/logics

test all_true() {
  and {
    [True, True, True] |> logics.all_true,
    [True, False, True] |> logics.all_true |> not,
    [] |> logics.all_true,
  }
}

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
