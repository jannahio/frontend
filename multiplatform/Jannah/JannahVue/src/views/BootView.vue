<script>
import { computed, watch } from 'vue'
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';

export default {
  setup () 
  {
    const { result, loading,  error, onResult , onError } = useQuery
    (
      gql`
      query getBoots 
      {
        allBoots
        {
          name
        }
      }
    `)
    const boots = computed(() => result.value?.allBoots ?? ['1'])
    onResult(queryResult => {
      console.log(queryResult.data)
      console.log(queryResult.loading)
      console.log(queryResult.networkStatus)
      console.log(queryResult.stale)
    });
    onError(error => {
      logErrorMessages(error)
    })
   return {
    boots,
    loading,
    error,
    }
  },
};
</script>

<template>
  <div class="boot">
    <h1>This is a Boot page</h1>
    <div v-if="loading">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else-if="result && result.allBoots">
      <li v-for="boot of result.allBoots" :key="boot.name">
        {{ boot.name }}
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
