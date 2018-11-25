<template>
  <div>
    <form novalidate class="md-layout" @submit.prevent="onRegisterClick">
      <md-card class="md-layout-item md-size-100 md-small-size-100">
        <md-card-header>
          <div class="md-title"><md-icon>person</md-icon> Register</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
            <div v-for="(field, index) in fields" :key="index" class="md-layout-item md-size-100 md-small-size-100">
              <md-field>
                <label :for="field">{{ field }}</label>
                <md-input :name="field" :type="field !== 'password' ? 'text' : 'password'" class="inputBgOpaque" :id="field" v-model="form[field]"/>
              </md-field>
            </div>
          </div>
        </md-card-content>
        <md-card-actions>
          <md-button class="md-raised" to="/login" style="margin-right:10px;">Login</md-button>
          <md-button type="submit" class="md-raised md-primary"><md-icon>arrow_forward_ios</md-icon> Sign Up</md-button>
        </md-card-actions>
      </md-card>
    </form>
    <md-dialog-alert
      :md-active.sync="error"
      md-title="Error"
      md-content="Error: Cannot register" />
  </div>
</template>

<script>
import { register } from "@/models/auth";

export default {
  name: "register",
  data: function() {
    return {
      error: false,
      fields: [
        "username",
        "password",
        "firstname",
        "lastname",
        "description",
        "email",
        "phone",
        "ssn"
      ],
      form: {
        firstname: "",
        lastname: "",
        description: "",
        email: "",
        phone: "",
        ssn: "",
        username: "",
        password: ""
      }
    };
  },
  methods: {
    onRegisterClick() {
      register(this.form).catch(error => {
        console.log(error);
        this.error = true;
      });
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
