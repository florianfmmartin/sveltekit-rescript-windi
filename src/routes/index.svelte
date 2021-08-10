<script>
  import { model, e } from "../stores/Model.bs";

  let m;

  model.subscribe(value => {
    m = value;
  });
</script>

<h1 class="text-xl text-gray-600">Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
<h1>Count is {m.count}</h1>
<button on:click={e("increment")}>Up</button>
<button on:click={e("decrement")}>Down</button>
<h1>Hello {m.name}</h1>
<input type="text" placeholder="Enter your name" on:input={e("change")}>

