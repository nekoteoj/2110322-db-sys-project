<template>
<div>
  <b-container id="login-block" fluid>
    <b-row class="margin">
      <b-col><h3>Login</h3></b-col>
    </b-row>
    <b-row class="margin">
      <b-col sm="3"><label for="username">Username</label></b-col>
      <b-col sm="9"><b-form-input type="text" id="username" v-model.trim="username"></b-form-input></b-col>
    </b-row>
    <b-row class="margin">
      <b-col sm="3"><label for="password">Password</label></b-col>
      <b-col sm="9"><b-form-input type="password" id="password" v-model.trim="password"></b-form-input></b-col>
    </b-row>
    <b-row>
      <b-col sm="12">
        <b-button variant="primary" class="right" @click="onLoginClick()">Login</b-button>
      </b-col>
    </b-row>
  </b-container>
</div>
</template>

<script>
import { login } from "@/models/auth";

export default {
  name: "login",
  data: function() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    onLoginClick() {
      login(this.username, this.password);
    }
  }
};
</script>

<style scoped>
#login-block {
  max-width: 500px;
  background-color: white;
  border: 2px solid gray;
  border-radius: 5px;
  padding: 20px;
  margin-top: 20px;
}

.margin {
  margin: 10px;
}

.right {
  float: right;
}
</style>
