<template>
  <div class="test-server">
    <h1>Web Backend Setting up test page</h1>
    <template v-if="database">
      <h3>Database: </h3>
      <p>{{ database }}</p>
    </template>
    <template v-if="json">
      <h3>JSON: </h3>
      <code>{{ json }}</code>
    </template>
  </div>
</template>

<script>
import axios from "axios";

axios.defaults.baseURL = "http://localhost:5000/";

export default {
  name: "test-server",
  data: function () {
    return {
      database: "",
      json: ""
    }
  },
  created: function() {
    axios
      .get("/api/test-db")
      .then(response => {
        this.database = response.data;
      })
      .catch(error => {
        this.database = "Server Error";
      });
    axios
      .get("/api/test-json")
      .then(response => {
        this.json = response.data;
      })
      .catch(error => {
        this.json = "Server Error";
      });
  }
};
</script>

<style scoped>
.test_server {
  font-family: "Courier New", Courier, monospace;
}
</style>
