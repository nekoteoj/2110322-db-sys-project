import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";
import TestServer from "./views/TestServer.vue";
import Login from "./views/Login.vue";
import { auth } from "./models/auth";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "home",
      component: Home,
      beforeEnter: auth
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "about" */ "./views/About.vue")
    },
    {
      path: "/test-server",
      name: "test-server",
      component: TestServer
    },
    {
      path: "/login",
      name: "login",
      component: Login
    }
  ]
});
