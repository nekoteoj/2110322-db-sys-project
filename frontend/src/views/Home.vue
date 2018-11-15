<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to DB SYS Project App!"/>
    <md-button class="md-raised md-accent" @click="onLogoutClick">Logout</md-button>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
import { logout } from "@/models/auth";

export default {
  name: "home",
  components: {
    HelloWorld
  },
  methods: {
    onLogoutClick() {
      logout();
    }
  }
};
</script>
