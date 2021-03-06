import router from "@/router";
import jwtDecode from "jwt-decode";
import api from "./api_manager";

export function login(username, password) {
  return api
    .post("/auth/login", { username, password })
    .then(res => {
      sessionStorage.setItem("accessToken", res.data.accessToken);
      router.push({ name: "home" });
    });
}

export function logout() {
  sessionStorage.clear();
  router.push({ name: "login" });
}

export function register(form) {
  return api
    .post("/auth/register", form)
    .then(() => router.push({ name: "login" }))
}

export function getToken() {
  return sessionStorage.getItem("accessToken");
}

export function authData() {
  const token = getToken();
  if (!token) {
    return {};
  }
  return jwtDecode(token);
}

export function auth(to, from, next) {
  if (getToken()) {
    next();
  } else {
    next("/login");
  }
}
