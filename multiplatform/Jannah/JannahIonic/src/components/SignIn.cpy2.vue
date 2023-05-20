
<template>
  <ApolloQuery
  :query="gql => gql`
    query MyHelloQuery ($name: String!) {
      hello (name: $name)
    }
  `"
  :variables="{ name }"
>
  <template v-slot="{ result: { error, data }, isLoading }">
    <!-- Loading -->
    <div v-if="isLoading" class="loading apollo">Loading...</div>

    <!-- Error -->
    <div v-else-if="error" class="error apollo">An error occurred</div>

    <!-- Result -->
    <div v-else-if="data" class="result apollo">{{ data.hello }}</div>

    <!-- No result -->
    <div v-else class="no-result apollo">No result</div>
  </template>
</ApolloQuery>
</template>
<script>
import { computed, watch } from 'vue'
import { useMutation } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { useUserStore } from "@/stores/user";
import { USER_SIGNIN } from "@/mutations";

import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';

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

                  apolloProvider(signinapolloClient);
                  const { mutate: userSignIn, loading: userSignInLoading,onError, error: userSignInError, onDone } = useMutation
                  (
                        USER_SIGNIN,
                        () =>  (
                                    {

                                      variables: {
                                                    username: this.signInDetails.username,
                                                    password: this.signInDetails.password,
                                                  }

                                     }
                              )
                );

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
              userSignIn();
                  
          },
    },
};
</script>

