import router from "@/router";
import api from "./api_manager";

export function login(username, password) {
  api
    .login(username, password)
    .then(res => {
      sessionStorage.setItem("accessToken", res.data.accessToken);
      router.push({ name: "home" });
    })
    .catch(error => {
      console.log(error);
      router.push({ path: "login" });
    });
}

export function logout() {
  sessionStorage.clear();
  router.push({ path: "login" });
}

export const auth = (to, from, next) => {
  if (sessionStorage.getItem("accessToken")) {
    next();
  } else {
    next("/login");
  }
};
