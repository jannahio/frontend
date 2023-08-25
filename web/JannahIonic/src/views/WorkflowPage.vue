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
import { useIonicUserStore } from "@/stores/ionic_user";
import { USER_SIGNIN } from "@/mutations";
import { ref } from 'vue';

import Site from "../components/Site.vue";
import User from "../components/User.vue";
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
  Site,
  User,
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
  const ionicNavUserStore = await useIonicUserStore.create();
  console.log("beforeEach.ionicNavUserStore: " + ionicNavUserStore);
  const _ionicNavUserToken = await ionicNavUserStore.get('ionicUserToken');
  const _ionicNavUser = await ionicNavUserStore.get('ionicUser');
  console.log("beforeEac--_ionicNavUser: ",_ionicNavUser);
  console.log("beforeEac--_ionicNavUserToken: " + _ionicNavUserToken);
  // If the user has not sign in yet,
  // redirect them to the signIn
  if (
    // make sure the user is authenticated
    _ionicNavUserToken === null &&
    // ❗️ Avoid an infinite redirect
    (to.params.id !== 'SignIn' &&
    to.params.id !== 'Register') 
  ) {
    // redirect the user to the login page
    return { id: 'SignIn' }
  }
  // console.log("to_variable");
  console.log(to);
  // If the user has already signed in
  // and are attempting to click on the SignIn button
  // then redirect them to the Dashboard
  if (
    // make sure the user is authenticated
    _ionicNavUserToken != null &&
    (to.params.id === 'SignIn' || to.params.id === 'Register')
  ) {
    // redirect the user to the login page
    to.params.id = 'Dashboard';
  } 
  // if (
  //   // make sure the user is authenticated
  //   userStore.getToken === null &&
  //   // ❗️ Avoid an infinite redirect
  //   (to.params.id !== 'SignIn' &&
  //   to.params.id !== 'Register') 
  // ) {
  //   // redirect the user to the login page
  //   return { id: 'SignIn' }
  // }
  // // console.log("to_variable");
  // console.log(to);
  // // If the user has already signed in
  // // and are attempting to click on the SignIn button
  // // then redirect them to the Dashboard
  // if (
  //   // make sure the user is authenticated
  //   userStore.getToken != null &&
  //   (to.params.id === 'SignIn' || to.params.id === 'Register')
  // ) {
  //   // redirect the user to the login page
  //   to.params.id = 'Dashboard';
  // } 
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
