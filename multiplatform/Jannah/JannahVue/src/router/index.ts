import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
    },
    {
      path: "/boot",
      name: "boot",
      component: () => import("../views/BootView.vue"),
    },
    {
      path: "/network",
      name: "network",
      component: () => import("../views/NetworkView.vue"),
    },
    {
      path: "/storage",
      name: "storage",
      component: () => import("../views/StorageView.vue"),
    },
    {
      path: "/compute",
      name: "compute",
      component: () => import("../views/ComputeView.vue"),
    },
    {
      path: "/ux",
      name: "ux",
      component: () => import("../views/UXView.vue"),
    },
    {
      path: "/feedback",
      name: "feedback",
      component: () => import("../views/FeedbackView.vue"),
    }
  ],
});

export default router;
