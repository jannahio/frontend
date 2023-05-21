<template>
  <ion-page>
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-buttons slot="start">
          <ion-menu-button color="primary"></ion-menu-button>
        </ion-buttons>
        <ion-title>{{ $route.params.id }}</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">{{ $route.params.id }}</ion-title>
        </ion-toolbar>
      </ion-header>

      <div id="container">
        <component :is="active_workflows[$route.params.id]" ></component>
      </div>
    </ion-content>
  </ion-page>
</template>

<script setup lang="ts">
import { IonButtons, IonContent, IonHeader, IonMenuButton, IonPage, IonTitle, IonToolbar } from '@ionic/vue';
import { useRouter, useRoute } from 'vue-router';
import { useUserStore } from "@/stores/user";
import { USER_SIGNIN } from "@/mutations";
import { ref } from 'vue';
//import CurrentWorkflow from "../components/CurrentWorkflow.vue";
import SignIn from "../components/SignIn.vue";
import Register from "../components/Register.vue";
import Boot from "../components/Boot.vue";
import Network from "../components/Network.vue";
import Storage from "../components/Storage.vue";
import Compute from "../components/Compute.vue";
import UX from "../components/UX.vue";
import Feedback from "../components/Feedback.vue";
import Dashboard from "../components/Dashboard.vue";
import SignOut from "../components/SignOut.vue";

const router = useRouter();
const route = useRoute();
const userStore = useUserStore();

const active_workflows = {
  SignIn,
  Register,
  Boot,
  Network,
  Storage,
  Compute,
  UX,
  Feedback,
  Dashboard,
  SignOut
}

router.beforeEach(async (to, from) => {
  if (
    // make sure the user is authenticated
    userStore.getToken === null &&
    // ❗️ Avoid an infinite redirect
    to.name !== 'SignIn'
  ) {
    //route.params.id = "SignIn";
    userStore.setToken("TOKEN");
    // redirect the user to the login page
    return { name: 'SignIn' }
  }
})

</script>

<style scoped>
#container {
  text-align: center;
  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;
  color: #8c8c8c;
  margin: 0;
}

#container a {
  text-decoration: none;
}
</style>
