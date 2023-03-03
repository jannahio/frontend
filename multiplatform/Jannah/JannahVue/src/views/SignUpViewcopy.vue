<script>
import { computed, watch } from 'vue'
import { useQuery } from '@vue/apollo-composable';
import gql from 'graphql-tag';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';
import { ApolloClient, createHttpLink, InMemoryCache } from '@apollo/client/core';
import { SITE_INFO } from "@/queries";
import { useUserStore } from "@/stores/user";




// HTTP connection to the API
const httpLink = createHttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:8000/graphql',
});

// Cache implementation
const cache = new InMemoryCache();

// Create the apollo client
const siteapolloClient = new ApolloClient({
  link: httpLink,
  cache,
});


export default {
  setup() {
    const userStore = useUserStore();
    return { userStore };
  },

  data() {
    return {
      menuOpen: false,
      mySite: null,
      user: {
        isAuthenticated: false,
        token: this.userStore.getToken || "",
        info: this.userStore.getUser || {},
      },
      dataLoaded: false,
    };
  },

  async created() {
    const siteInfo = await this.$apollo.query({
      query: SITE_INFO,
    });
    this.mySite = siteInfo.data.site;

    if (this.user.token) {
      this.user.isAuthenticated = true;
    }
  },

  methods: {
    userSignOut() {
      this.userStore.removeToken();
      this.userStore.removeUser();
    },
  },
};
</script>