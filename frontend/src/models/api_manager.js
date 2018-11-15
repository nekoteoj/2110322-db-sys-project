import axios from "axios";
import qs from "qs";
import { baseUrl } from "@/config.js";

class APIManager {
  constructor(baseUrl) {
    this.baseUrl = baseUrl;
  }

  login(username, password) {
    return axios.post(
      this.baseUrl + "/auth/login",
      qs.stringify({ username, password })
    );
  }

  getSellers() {
    return axios.get(this.baseUrl + "/seller");
  }
}

export default new APIManager(baseUrl);
