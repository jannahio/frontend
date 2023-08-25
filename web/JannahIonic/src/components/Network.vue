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
       allNetworks: {
        query: gql`
              query NetworkList{
                networks{
                  cursor,
                  hasMore,
                  networks{
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
            allNetworks: [],
            loadingNertworksQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.networks.networks
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
};
</script>

<template>
  <div class="network">
    <h1>This is a Network index page</h1>
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

