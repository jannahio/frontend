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
     allUXs: {
        query: gql`
              query UXList{
                uxs{
                  cursor,
                  hasMore,
                  uxs{
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
            allUXs: [],
            loadingUXQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          return data.uxs.uxs
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
        loadingKey: 'loadingUXQueriesCount',
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
  <div class="ux">
    <h1>This is a UX index page</h1>
    <div v-if="loadingUXQueriesCount">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allUXs">
      <li v-for="ux of allUXs" :key="ux.name">
        {{ ux.name }} - {{ ux.description }}
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

