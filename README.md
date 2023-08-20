# auxlib

An Aiken auxiliary library. Currently it contains removed functions from `stdlib`, and some minor additional stuffs.

| ℹ️  | Package name and version | aiken-extra/auxlib v2.150.202308                                                                    | 🪲  |
| --- | ------------------------ | --------------------------------------------------------------------------------------------------- | --- |
| 🟢  | **Depends on**           | **aiken-lang/stdlib v1.5.0**                                                                        | ✔️  |
| 🟢  | **Tested with**          | **[89c55a23fa](https://github.com/aiken-lang/aiken/tree/89c55a23fa63e023dcf2973594dd4a332de06aaa)** | ✔️  |
| 🟢  | **Compatible with**      | **aiken v1.0.15-alpha**                                                                             | ✔️  |
| ⚠️  | **Incompatible with**    | **aiken v1.0.13-alpha**\*                                                                           | ❌  |

\* - In [stdlib v1.5.0](https://github.com/aiken-lang/stdlib/releases/tag/1.5.0) the `list.{and,or}` were removed in favor of the new {`and`,`or`} blocks (see [aiken v1.0.14-alpha](https://github.com/aiken-lang/aiken/releases/tag/v1.0.14-alpha) release notes). Unfortunately currently there is no replacement to conveniently do the logical `and`|`or` to `List<Bool>` data-type variables, for example:

Previously we could just,

```gleam
  let list_variable = [True, True, True]
  list.and(list_variable)
```

now if we try,

```gleam
  let list_variable = [True, True, True]
  and { list_variable }
```

it will throw `aiken::check::type_mismatch`:

```gleam
  × While trying to make sense of your code...
  ╰─▶ I struggled to unify the types of two expressions.

  help: I am inferring the following type:

            Bool

        but I found an expression with a different type:

            List<Bool>

        Either, add type-annotation to improve my inference, or adjust the expression to have the expected type.


Summary
    1 error, 0 warnings
```

It is possible to use `list_variable |> all(identity)` from `Prelude`, but it's not as clear as `list.and`. Hence for the time being, this library offers the following solution:

```gleam
use auxlib/collections.{list_and}
```

```gleam
  let list_variable = [True, True, True]
  list_and(list_variable)
```

or alternatively,

```gleam
use auxlib/logics.{all_true}
```

```gleam
  let list_variable = [True, True, True]
  list_variable |> all_true
```

at least until they provide the replacements for `list.{and,or}`.
