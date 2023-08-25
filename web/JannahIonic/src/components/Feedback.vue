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
    allFeedbacks: {
        query: gql`
        query FeedbackList{
          feedbacks{
            cursor,
            hasMore,
            feedbacks{
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
            allFeedbacks: [],
            loadingFeedbackQueriesCount: 0
          }
        },
        update (data) {
          console.log(data)
          // The returned value will update
          // the vue property 'pingMessage'
          return data.feedbacks.feedbacks
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

};
</script>

<template>
  <div class="feedback">
    <h1>This is a Feedback index page</h1>
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

