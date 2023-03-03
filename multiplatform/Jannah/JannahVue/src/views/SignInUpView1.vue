<script>
import { computed, watch } from 'vue'
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';
import { SITE_INFO } from "@/queries";
import { useUserStore } from "@/stores/user";




// HTTP connection to the API
const httpLink = createHttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:8000/graphql',
});

// Cache implementation
const cache = new InMemoryCache();

// Create the apollo client
const siteapolloClient = new ApolloClient({
  link: httpLink,
  cache,
});


export default {
  setup() {
    const userStore = useUserStore();
    provideApolloClient(siteapolloClient);
    const { result, loading,  error, onResult , onError } = useQuery
    (
      gql`
      query getSite
            {
              site{
          name
          description
        }
      }
    `)
    const siteInfo = computed(() => result.value?.site ?? []);
    menuOpen = false;
    user = {
        isAuthenticated: false,
        token: this.userStore.getToken || "",
        info: this.userStore.getUser || {},
      };
    dataLoaded = false,
    onResult(queryResult => {
      console.log(queryResult.data)
      console.log(queryResult.loading)
  //    console.log(queryResult.networkStatus)
      console.log(queryResult.stale)
    });
    onError(error => {
      logErrorMessages(error)
    })

    return { userStore ,
            siteInfo};
  },


  methods: {
    userSignOut() {
      this.userStore.removeToken();
      this.userStore.removeUser();
    },
  },
};
</script>

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
      </div>
    </form>
  </div>
</template>