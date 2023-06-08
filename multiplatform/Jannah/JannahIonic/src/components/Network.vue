<script>
import { computed, watch } from 'vue'
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';

// HTTP connection to the API
const httpLink = createHttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:8000/graphql',
});

// Cache implementation
const cache = new InMemoryCache();

// Create the apollo client
const networkapolloClient = new ApolloClient({
  link: httpLink,
  cache,
});

export default {
  data() {
      return {
        error: '',
      };
  },
  apollo: {
       allNetworks: {
        query: gql`
            query getNertworks 
            {
              allNetworks
              {
                name,
                description
              }
            }
        `,
        data () {
          return {
            // Initialize your apollo data
            allNetworks: [],
            loadingNertworksQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.allNetworks
        },
        // Optional result hook
        result ({ data, loading, networkStatus }) {
          console.log('We got some result!')
        },
        // Error handling
        error (error) {
          console.error('We\'ve got an error!', error)
        },
        // Loading state
        loadingKey: 'loadingNertworksQueriesCount',
        // watchLoading will be called whenever the loading state changes
        watchLoading (isLoading, countModifier) {
          // isLoading is a boolean
          // countModifier is either 1 or -1
        },
      },
    },
  // setup () 
  // {
  //   provideApolloClient(networkapolloClient);
  //   const { result, loading,  error, onResult , onError } = useQuery
  //   (
  //     gql`
      // query getNertworks 
      // {
      //   allNetworks
      //   {
      //     name,
      //     description
      //   }
      // }
  //   `)
  //   const allNetworks = computed(() => result.value?.allNetworks ?? [])
  //   onResult(queryResult => {
  //     console.log(queryResult.data)
  //     console.log(queryResult.loading)
  // //    console.log(queryResult.networkStatus)
  //     console.log(queryResult.stale)
  //   });
  //   onError(error => {
  //     logErrorMessages(error)
  //   })
  //  return {
  //   allNetworks,
  //   loading,
  //   error,
  //   }
  // },
};
</script>

<template>
  <div class="network">
    <h1>This is a Network page</h1>
    <div v-if="loadingNertworksQueriesCount">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allNetworks">
      <li v-for="network of allNetworks" :key="network.name">
        {{ network.name }} - {{ network.description }}
      </li>
    </ul>

  </div>
</template>

<style>
@media (min-width: 1024px) {
  .network {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>

