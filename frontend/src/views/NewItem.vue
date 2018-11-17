<template>
  <div class="new-item">
    <NavBar/>
    <h1>This is New Page</h1>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";

export default {
  name: "new-item",
  components: {
    NavBar
  }
};
</script>
