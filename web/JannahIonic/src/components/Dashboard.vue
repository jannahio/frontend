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
        cursor: "1",
        showMoreEnabled: false,
      };
    },
  apollo: {
      allWorkflows: {
        query: gql`
                  query WorkflowList($cursor: String){
                      workflows(cursor: $cursor){
                          cursor,
                          hasMore,
                          workflows{
                              id,
                              name,
                              description
                          }
                      }
                  }
        `,
        // Initial variables
        variables: {
          cursor: "1",
        },
        data () {
          return {
            // Initialize your apollo data
            allWorkflows: [],
            loadingWorkflowQueriesCount: 0,
            cursor: "1",
            showMoreEnabled: true
          }
        },
        update (data) {
          console.log("update data: ", data);
          const hasMore = data.workflows.hasMore
          this.showMoreEnabled = hasMore
          this.cursor = data.workflows.cursor
          return data.workflows.workflows;
        },
        // Optional result hook
        result ({ data, loading, networkStatus, fetchMore }) {
          console.log('We got some result!')
        },
        // Error handling
        error (error) {
          console.error('We\'ve got an error!', error);
          this.error = error;
        },
        // Loading state
        loadingKey: 'loadingWorkflowQueriesCount',
        // watchLoading will be called whenever the loading state changes
        watchLoading (isLoading, countModifier) {
          // isLoading is a boolean
          // countModifier is either 1 or -1
        },
      },
    },
  methods: {
    showMore () {
      // Fetch more data and transform the original result
      this.$apollo.queries.allWorkflows.fetchMore({
        // New variables
        variables: {
          cursor: this.cursor,
        },
        // Transform the previous result with new data
        updateQuery: (previousResult, { fetchMoreResult }) => {
          const newWorkflows = fetchMoreResult.workflows.workflows
          this.showMoreEnabled = fetchMoreResult.workflows.hasMore
          this.cursor = fetchMoreResult.workflows.cursor
          return {
            workflows: {
              cursor: this.cursor,
              hasMore: fetchMoreResult.workflows.hasMore,
              __typename: previousResult.workflows.__typename,
              // Merging the workflow list
              workflows: [...previousResult.workflows.workflows, ...newWorkflows],
            },
          }

        },
      })
    },
  },
};
</script>


<template>
  <div class="workflow">
    <h1>This is a Workflow index page</h1>
    <div v-if="loadingWorkflowQueriesCount">Loading...</div>
    <div v-else-if="error"> {{ error.message }}</div>
    <ul v-else-if="allWorkflows">
      <li v-for="workflow of allWorkflows" :key="workflow.name">
        {{ workflow.name }} - {{ workflow.description }}
      </li>
      <div class="actions">
        <button v-if="showMoreEnabled" @click="showMore">Show more</button>
      </div>
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

