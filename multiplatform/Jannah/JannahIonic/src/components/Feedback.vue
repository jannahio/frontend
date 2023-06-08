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
const feedbackapolloClient = new ApolloClient({
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
    allFeedbacks: {
        query: gql`
            query getFeedbacks
            {
              allFeedbacks
              {
                name,
                description
              }
            }
        `,
        data () {
          return {
            // Initialize your apollo data
            allFeedbacks: [],
            loadingFeedbackQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.allFeedbacks
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
        loadingKey: 'loadingFeedbackQueriesCount',
        // watchLoading will be called whenever the loading state changes
        watchLoading (isLoading, countModifier) {
          // isLoading is a boolean
          // countModifier is either 1 or -1
        },
      },
    },
  // setup () 
  // {
  //   provideApolloClient(feedbackapolloClient);
  //   const { result, loading,  error, onResult , onError } = useQuery
  //   (
  //     gql`
      // query getFeedbacks
      // {
      //   allFeedbacks
      //   {
      //     name,
      //     description
      //   }
      // }
  //   `)
  //   const allFeedbacks = computed(() => result.value?.allFeedbacks ?? [])
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
  //   allFeedbacks,
  //   loading,
  //   error,
  //   }
  // },
};
</script>

<template>
  <div class="feedback">
    <h1>This is a Feedback page</h1>
    <div v-if="loadingFeedbackQueriesCount">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="allFeedbacks">
      <li v-for="feedback of allFeedbacks" :key="feedback.name">
        {{ feedback.name }} - {{ feedback.description }}
      </li>
    </ul>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .feedback {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>

