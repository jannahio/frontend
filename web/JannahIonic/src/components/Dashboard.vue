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
const computeapolloClient = new ApolloClient({
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
      allComputes: {
        query: gql`
            query getComputes
            {
              allComputes
              {
                name,
                description
              }
            }
        `,
        data () {
          return {
            // Initialize your apollo data
            allComputess: [],
            loadingComputeQueriesCount: 0
          }
        },
        update (data) {
          console.log(data);
          // The returned value will update
          // the vue property 'pingMessage'
          //this.loading = loading;
          //this.networkStatus = networkStatus;
          return data.allComputes;
        },
        // Optional result hook
        result ({ data, loading, networkStatus }) {
          console.log('We got some result!')
        },
        // Error handling
        error (error) {
          console.error('We\'ve got an error!', error);
          this.error = error;
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
  // setup () 
  // {
  //   provideApolloClient(computeapolloClient);
  //   const { result, loading,  error, onResult , onError } = useQuery
  //   (
  //     gql`
  //     query getComputes 
  //     {
  //       allComputes
  //       {
  //         name,
  //         description
  //       }
  //     }
  //   `)
  //   const allComputes = computed(() => result.value?.allComputes ?? [])
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
    // allComputes,
    // loading,
    // error,
  //   }
  // },
};
</script>

<template>
  <div class="compute">
    <h1>This is a Compute page</h1>
    <div v-if="loadingComputeQueriesCount">Loading...</div>
    <div v-else-if="error"> {{ error.message }}</div>
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

