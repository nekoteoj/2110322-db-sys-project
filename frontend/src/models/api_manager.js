import axios from "axios";
import { baseUrl } from "@/config.js";

class APIManager {
  constructor(baseUrl) {
    this.baseUrl = baseUrl;
  }

  getSellers() {
    return axios.get(this.baseUrl + "/seller");
  }
}

export default new APIManager(baseUrl);
