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
  // https://apollo.vuejs.org/api/smart-query.html#options
  // Apollo-specific options
    apollo: {
      // Advanced query with parameters
      // The 'variables' method is watched by vue
      allBoots: {
        query: gql`
        query getBoots 
          {
            allBoots
            {
              name,
              description
            }
          }
        `,
        // Reactive parameters
        // variables () {
        //   // Use vue reactive properties here
        //   return {
        //     message: this.user.id,
        //   }
        // },
        // Polling interval in milliseconds
        // pollInterval: 10000,
        // Or, set polling interval as a vue reactive property
        // pollInterval() {
        //   return this.pollInterval;
        // },
        // Variables: deep object watch
        // deep: false,
        // We use a custom update callback because
        // the field names don't match
        // By default, the 'pingMessage' attribute
        // would be used on the 'data' result object
        // Here we know the result is in the 'ping' attribute
        // considering the way the apollo server works
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.allBoots
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
        // loadingKey is the name of the data property
        // that will be incremented when the query is loading
        // and decremented when it no longer is.
        loadingKey: 'loadingBootQueriesCount',
        // watchLoading will be called whenever the loading state changes
        watchLoading (isLoading, countModifier) {
          // isLoading is a boolean
          // countModifier is either 1 or -1
        },
      },
    },
  // setup () 
  // {
  //   provideApolloClient(bootapolloClient);
  //   const { result, loading,  error, onResult , onError } = useQuery
  //   (
  //     gql`
  //     query getBoots 
  //     {
  //       allBoots
  //       {
  //         name,
  //         description
  //       }
  //     }
  //   `)
  //   const allBoots = computed(() => result.value?.allBoots ?? [])
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
  //   allBoots,
  //   loading,
  //   error,
  //   }
  // },
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
