
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
            <router-link to="/signup" class="text-teal-500 hover:underline"
              >Sign Up</router-link
            >
            first.</small
          >
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
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';
import { useUserStore } from "@/stores/user";
import { USER_SIGNIN } from "@/mutations";



export default {
  name: "SignInView",

    setup() {
      const userStore = useUserStore();
      return { userStore };
    },

    data() {
      return {
        signInDetails: {
          username: "",
          password: "",
        },
      };
    },

    methods: 
    {
          async userSignIn() 
          {

                  // HTTP connection to the API
                  const httpLink = createHttpLink({
                    // You should use an absolute URL here
                    uri: 'http://localhost:8000/graphql',
                  });

                  // Cache implementation
                  const cache = new InMemoryCache();

                  // Create the apollo client
                  const signinapolloClient = new ApolloClient({
                    link: httpLink,
                    cache,
                  });  

                  provideApolloClient(signinapolloClient);
                  const { mutate: userSignIn, loading: userSignInLoading,onError, error: userSignInError, onDone } = useMutation
                  (
                        USER_SIGNIN,
                        () =>  (
                                    {

                                      variables: {
                                                    username: this.signInDetails.username,
                                                    password: this.signInDetails.password,
                                                  }
                                    //   update: (
                                    //             cache, 
                                    //             { 
                                    //                 data: { 
                                    //                       userSignIn 
                                    //                       } 
                                    //             }
                                    //           ) => {
                                    //                 let data = cache.readQuery({ query: USER_SIGNIN });
                                    //                 data = {
                                    //                           ...data,
                                    //                           user: [
                                    //                             ...data.user,
                                    //                             // userSignIn,
                                    //                           ],
                                    //                       }
                                    //                 cache.writeQuery({ query: USER_SIGNIN, data });
                                    //               },
                                     }
                              )
                );
                
              //   onDone(
              //             () => {
              //                     console.log(result.data)
              //                     // const user = computed(() => result.value?.user ?? {});
              //                     // this.userStore.setToken(user.data.tokenAuth.token);
              //                     // this.userStore.setUser(user.data.tokenAuth.user);
              //                 }
              // );
              onDone(result => {
                console.log(result.data.tokenAuth);
                //user = computed(() => result.data.tokenAuth.user);
                let user = {};
                user = result.data.tokenAuth.user
                user.token = result.data.tokenAuth.token;
                console.log(user);
                this.userStore.setToken(user.token);
                this.userStore.setUser(user);
                
              })
              // onError(error => {
              //   console.log(error)
              // })
              userSignIn();
                  
          },
    },
};
</script>

