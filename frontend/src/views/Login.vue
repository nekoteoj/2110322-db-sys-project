<template>
  <div>
    <form novalidate class="md-layout" @submit.prevent="onLoginClick">
      <md-card class="md-layout-item md-size-100 md-small-size-100">
        <md-card-header>
          <div class="md-title"><md-icon>person</md-icon> Login</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
            <div class="md-layout-item md-size-100 md-small-size-100">
              <md-field>
                <label for="username">Username</label>
                <md-input name="username" class="inputBgOpaque" id="username" v-model="username"/>
              </md-field>
            </div>

            <div class="md-layout-item md-size-100 md-small-size-100">
              <md-field>
                <label for="last-name">Password</label>
                <md-input type="password" name="password" id="password" v-model="password"/>
              </md-field>
            </div>
          </div>
        </md-card-content>
        <md-card-actions>
          <md-button type="submit" class="md-raised md-primary"><md-icon>arrow_forward_ios</md-icon> Login</md-button>
        </md-card-actions>
      </md-card>
    </form>
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
form {
  margin: auto;
  max-width: 500px;
  padding: 20px;
  margin-top: 20px;
}

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

.inputBgOpaque:-webkit-autofill {
  -webkit-box-shadow: 0 0 0 100px white inset;
}
</style>
