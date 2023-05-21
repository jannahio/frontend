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
const bootapolloClient = new ApolloClient({
  link: httpLink,
  cache,
});

export default {
  setup () 
  {
    provideApolloClient(bootapolloClient);
    const { result, loading,  error, onResult , onError } = useQuery
    (
      gql`
      query getBoots 
      {
        allBoots
        {
          name,
          description
        }
      }
    `)
    const allBoots = computed(() => result.value?.allBoots ?? [])
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
    allBoots,
    loading,
    error,
    }
  },
};
</script>

<template>
  <div class="boot">
    <h1>This is a Boot page</h1>
    <div v-if="loading">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allBoots">
      <li v-for="boot of allBoots" :key="boot.name">
        {{ boot.name }} - {{ boot.description }}
      </li>
    </ul>

  </div>
</template>

<style>
@media (min-width: 1024px) {
  .boot {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
