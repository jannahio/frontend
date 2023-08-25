<script>
import { computed, watch } from 'vue'
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';

export default {
  data() {
      return {
        error: '',
      };
  },
  apollo: {
     allStorages: {
        query: gql`
              query StorageList{
                storages{
                  cursor,
                  hasMore,
                  storages{
                    id,
                    name,
                    description
                  }
                }
              }
        `,
        data () {
          return {
            // Initialize your apollo data
            allStorages: [],
            loadingStoragesQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          return data.storages.storages
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
        loadingKey: 'loadingStoragesQueriesCount',
        // watchLoading will be called whenever the loading state changes
        watchLoading (isLoading, countModifier) {
          // isLoading is a boolean
          // countModifier is either 1 or -1
        },
      },
    },
};
</script>

<template>
  <div class="storage">
    <h1>This is a Storage index page</h1>
    <div v-if="loadingStoragesQueriesCount">Loading...</div>
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

