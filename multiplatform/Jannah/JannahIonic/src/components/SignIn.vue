<template>
  <div class="mx-auto h-screen w-full sm:w-2/3 md:w-1/3">
    <form action="POST" @submit.prevent="userSignIn()">
      <div class="bg-white rounded-xl w-full">
        <div class="space-y-4">
          <div>
            <label for="email" class="block mb-1 text-gray-600 font-medium"
              >Username</label
            >
            <input
              type="text"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring focus:ring-teal-300 focus:ring-opacity-50"
              v-model="signInDetails.username"
            />
          </div>
          <div>
            <label for="email" class="block mb-1 text-gray-600 font-medium"
              >Password</label
            >
            <input
              type="text"
              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-teal-500 focus:ring focus:ring-teal-300 focus:ring-opacity-50"
              v-model="signInDetails.password"
            />
          </div>
        </div>
        <button
          class="mt-4 w-full bg-teal-500 hover:bg-teal-700 focus:ring focus:ring-teal-100 text-white py-2 rounded-md text-lg tracking-wide"
        >
          Sign In
        </button>
    
        <div class="text-right">
          <small
            >Don't have an account? Try
            <router-link to="/workflow/Register" class="text-teal-500 hover:underline"
              >Sign Up</router-link>.
              </small>
        </div>
        <div>
        
        </div>
      </div>
    </form>
  </div>
</template>
<script>
import { computed, watch } from 'vue'
import { useMutation } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { useUserStore } from "@/stores/user";
import { useIonicUserStore } from "@/stores/ionic_user";
import { USER_SIGNIN } from "@/mutations";
import { useRouter, useRoute } from 'vue-router';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';
import Dashboard from './Dashboard.vue';
//import { createApolloProvider } from '@vue/apollo-option';


export default {
     name: "SignIn",

    setup() {
      const userStore = useUserStore();
      // const ionicUserStore = useIonicUserStore;
      return { userStore };
    },

    data() {
      return {
        signInDetails: {
          username: "",
          password: "",
        },
        error: '',
      };
    },
    methods: 
    {
          async userSignIn() 
          {

                  // Sign in
                  const user = await this.$apollo.mutate({
                    mutation: USER_SIGNIN,
                    variables: {
                      username: this.signInDetails.username,
                      password: this.signInDetails.password,
                    },
                  });
                  console.log(user.data.tokenAuth);
                  this.userStore.setToken(user.data.tokenAuth.token);
                  const ionicSignInUserStore = await useIonicUserStore.create();
                  console.log(ionicSignInUserStore);
                  await ionicSignInUserStore.set('ionicUserToken', user.data.tokenAuth.token);
                  const _ionicSignInUserToken = await ionicSignInUserStore.set('ionicUserToken', user.data.tokenAuth.token);
                  console.log(_ionicSignInUserToken);
                  this.userStore.setUser(user.data.tokenAuth.user); 
                  const _ionicUser = await ionicSignInUserStore.set('ionicUser', user.data.tokenAuth.user); 
                  console.log("" + ionicSignInUserStore); 
                  this.$router.push('/workflow/Dashboard');  
          },
    },
    // methods: 
    // {
    //       async userSignIn() 
    //       {

    //               // HTTP connection to the API
    //               const httpLink = createHttpLink({
    //                 // You should use an absolute URL here
    //                 uri: 'http://localhost:8000/graphql',
    //               });

    //               // Cache implementation
    //               const cache = new InMemoryCache();

    //               // Create the apollo client
    //               const signinapolloClient = new ApolloClient({
    //                 link: httpLink,
    //                 cache,
    //               });  

    //               provideApolloClient(signinapolloClient);
    //               const { mutate: userSignIn, loading: userSignInLoading,onError, error: userSignInError, onDone } = useMutation
    //               (
    //                     USER_SIGNIN,
    //                     () =>  (
    //                                 {

    //                                   variables: {
    //                                                 username: this.signInDetails.username,
    //                                                 password: this.signInDetails.password,
    //                                               }

    //                                  }
    //                           )
    //             );

    //           onDone(result => {
    //             console.log(result.data.tokenAuth);
    //             //user = computed(() => result.data.tokenAuth.user);
    //             let user = {};
    //             user = result.data.tokenAuth.user
    //             user.token = result.data.tokenAuth.token;
    //             console.log(user);
    //             this.userStore.setToken(user.token);
    //             this.userStore.setUser(user);
    //             const router = useRouter();
    //             this.$router.push('/workflow/Dashboard');
    //           })
    //           userSignIn();
                  
    //       },
    // },
};
</script>

