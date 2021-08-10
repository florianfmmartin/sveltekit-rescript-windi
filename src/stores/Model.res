module Svelte = {
  type writable<'a> = {update: ('a => 'a) => unit}
}
@module("svelte/store") external writable: 'a => Svelte.writable<'a> = "writable"

type modelType = {
  count: int,
  name: string,
}

let model = writable({
  count: 0,
  name: "",
})

module Action = {
  type t = private [>
    | #increment
    | #decrement
    | #change
  ]
}

let e = (action: Action.t) => {
  let fun = params => {
    switch action {
    | #increment =>
      model.update(value => {
        {
          ...value,
          count: value.count + 1,
        }
      })
    | #decrement =>
      model.update(value => {
        {
          ...value,
          count: value.count - 1,
        }
      })
    | #change => model.update(value => {
        {
          ...value,
          name: params["srcElement"]["value"],
        }
      })
    | _ => Js.Console.warn3("[Rescript]:", action, "is not a valid action...")
    }
  }
  fun
}
