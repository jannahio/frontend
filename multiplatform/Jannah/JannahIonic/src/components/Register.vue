<script>
import { useMutation } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { useUserStore } from "@/stores/user";
import { USER_SIGNIN } from "@/mutations";

import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';

export default {
  name: "SignUp",

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

  methods: {
    async userSignUp() {
      const user = await this.$apollo.mutate({
        mutation: USER_SIGNIN,
        variables: {
          username: this.signInDetails.username,
          password: this.signInDetails.password,
        },
      });
      this.userStore.setToken(user.data.tokenAuth.token);
      this.userStore.setUser(user.data.tokenAuth.user);
    },
  },
};
</script>


<template>
  <div class="mx-auto h-screen w-full sm:w-2/3 md:w-1/3">
    <form action="POST" @submit.prevent="userSignUp()">
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
          Register
        </button>
        <div class="text-right">
          <small
            >Don't have an account? Try
            <router-link to="/workflow/Register" class="text-teal-500 hover:underline"
              >Register</router-link
            >
            first.</small
          >
        </div>
      </div>
    </form>
  </div>
</template>