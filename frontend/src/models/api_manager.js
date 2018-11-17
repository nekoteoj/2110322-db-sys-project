import axios from "axios";
import qs from "qs";
import { getToken } from "./auth";
import { baseUrl } from "@/config.js";

class APIManager {
  constructor(baseUrl) {
    this.baseUrl = baseUrl;
  }

  post(url, data, auth = false) {
    const config = {};
    if (auth) {
      config.headers = { Authorization: "Bearer " + getToken() };
    }
    return axios.post(baseUrl + url, qs.stringify(data), config);
  }

  get(url, data, auth = false) {
    const config = { params: data };
    if (auth) {
      config.headers = { Authorization: "Bearer " + getToken() };
    }
    return axios.get(baseUrl + url, config);
  }

  delete(url, data, auth = false) {
    const config = {
      data: qs.stringify(data)
    };
    if (auth) {
      config.headers = { Authorization: "Bearer " + getToken() };
    }
    return axios({
      url: baseUrl + url,
      method: "DELETE",
      ...config
    });
  }
}

export default new APIManager(baseUrl);
