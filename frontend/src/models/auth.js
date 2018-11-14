import router from "@/router";

export function login(username, password) {
  sessionStorage.setItem("username", username);
  sessionStorage.setItem("password", password);
  router.push({ name: "home" });
}

export function logout() {
  sessionStorage.clear();
  router.push({ path: "login" });
}

export const auth = (to, from, next) => {
  const username = sessionStorage.getItem("username");
  const password = sessionStorage.getItem("password");
  console.log(username, password);
  if (username && password) {
    next();
  } else {
    next("/login");
  }
};
