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
const storageapolloClient = new ApolloClient({
  link: httpLink,
  cache,
});

export default {
  setup () 
  {
    provideApolloClient(storageapolloClient);
    const { result, loading,  error, onResult , onError } = useQuery
    (
      gql`
      query getStorages 
      {
        allStorages
        {
          name,
          description
        }
      }
    `)
    const allStorages = computed(() => result.value?.allStorages ?? [])
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
    allStorages,
    loading,
    error,
    }
  },
};
</script>

<template>
  <div class="storage">
    <h1>This is a Storage page</h1>
    <div v-if="loading">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allStorages">
      <li v-for="storage of allStorages" :key="storage.name">
        {{ storage.name }} - {{ storage.description }}
      </li>
    </ul>

  </div>
</template>

<style>
@media (min-width: 1024px) {
  .storage {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>

