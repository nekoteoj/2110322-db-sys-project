<template>
  <nav>
    <md-toolbar>
      <md-button class="md-icon-button" @click="showNavigation = true">
        <md-icon>menu</md-icon>
      </md-button>
      <h3 class="md-title" style="flex: 1;">NoSQL is the best</h3>
      <md-button @click="logoutClicked()">Logout</md-button>
    </md-toolbar>

    <md-drawer :md-active.sync="showNavigation">
      <md-toolbar class="md-transparent" md-elevation="0">
        <span class="md-title">Navigation</span>
      </md-toolbar>

      <md-list>
        <md-list-item to="/" @click="showNavigation = false">
          <md-icon>view_list</md-icon>
          <span class="md-list-item-text">Home</span>
        </md-list-item>

        <md-list-item to="/new-item" @click="showNavigation = false">
          <md-icon>add_circle</md-icon>
          <span class="md-list-item-text">New Item</span>
        </md-list-item>

        <md-list-item @click="logoutClicked(); showNavigation = false">
          <md-icon>exit_to_app</md-icon>
          <span class="md-list-item-text">Logout</span>
        </md-list-item>
      </md-list>
    </md-drawer>

  </nav>
</template>

<script>
import { logout } from "../models/auth";

export default {
  name: "NavBar",
  data: function() {
    return {
      showNavigation: false
    };
  },
  methods: {
    logoutClicked() {
      logout();
    }
  }
};
</script>

<style scoped>
.md-drawer {
  width: 230px;
  max-width: calc(100vw - 125px);
}
</style>
