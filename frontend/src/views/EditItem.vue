<template>
  <div class="edit-item">
    <NavBar/>
    <h1>This is Edit Page for item {{ id }}</h1>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";

export default {
  name: "edit-item",
  components: {
    NavBar
  },
  props: ['id']
};
</script>
