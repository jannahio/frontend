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
  setup () 
  {
    provideApolloClient(networkapolloClient);
    const { result, loading,  error, onResult , onError } = useQuery
    (
      gql`
      query getNertworks 
      {
        allNetworks
        {
          name,
          description
        }
      }
    `)
    const allNetworks = computed(() => result.value?.allNetworks ?? [])
    onResult(queryResult => {
      console.log(queryResult.data)
      console.log(queryResult.loading)
  //    console.log(queryResult.networkStatus)
      console.log(queryResult.stale)
    });
    onError(error => {
      logErrorMessages(error)
    })
   return {
    allNetworks,
    loading,
    error,
    }
  },
};
</script>

<template>
  <div class="network">
    <h1>This is a Network page</h1>
    <div v-if="loading">Loading...</div>
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

