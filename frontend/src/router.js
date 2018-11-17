import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";
import Login from "./views/Login.vue";
import NewItem from "./views/NewItem.vue";
import EditItem from "./views/EditItem.vue";
import ShowItem from "./views/ShowItem.vue";
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
      path: "/login",
      name: "login",
      component: Login
    },
    {
      path: "/new-item",
      name: "new-item",
      component: NewItem,
      beforeEnter: auth
    },
    {
      path: "/edit-item/:id",
      name: "edit-item",
      component: EditItem,
      props: true,
      beforeEnter: auth
    },
    {
      path: "/show-item/:id",
      name: "show-item",
      component: ShowItem,
      props: true,
      beforeEnter: auth
    }
  ]
});
