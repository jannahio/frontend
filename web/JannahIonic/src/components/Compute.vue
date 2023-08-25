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
      allComputes: {
        query: gql`
                query getComputes
                    {
                      computes{
                          cursor,
                          hasMore,
                          computes{
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
            allComputes: [],
            loadingComputeQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.computes.computes
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
        loadingKey: 'loadingComputeQueriesCount',
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
  <div class="compute">
    <h1>This is a Compute index page</h1>
    <div v-if="loadingComputeQueriesCount">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allComputes">
      <li v-for="compute of allComputes" :key="compute.name">
        {{ compute.name }} - {{ compute.description }}
      </li>
    </ul>

  </div>
</template>

<style>
@media (min-width: 1024px) {
  .compute {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>

