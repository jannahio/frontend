import { createApp, h } from 'vue';
import App from './App.vue';
import router from './router';
import { IonicVue } from '@ionic/vue';
import { createPinia } from 'pinia';

import Vue from 'vue';
import VueApollo from 'vue-apollo';
// import VueApolloComponents from '@vue/apollo-components';
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';

/* Core CSS required for Ionic components to work properly */
import '@ionic/vue/css/core.css';

/* Basic CSS for apps built with Ionic */
import '@ionic/vue/css/normalize.css';
import '@ionic/vue/css/structure.css';
import '@ionic/vue/css/typography.css';

/* Optional CSS utils that can be commented out */
import '@ionic/vue/css/padding.css';
import '@ionic/vue/css/float-elements.css';
import '@ionic/vue/css/text-alignment.css';
import '@ionic/vue/css/text-transformation.css';
import '@ionic/vue/css/flex-utils.css';
import '@ionic/vue/css/display.css';

/* Theme variables */
import './theme/variables.css';

import ApolloClient from 'apollo-boost';

const apolloClient = new ApolloClient({
  // You should use an absolute URL here
  uri: 'http://localhost:3020/graphql'
})

import { createApolloProvider } from '@vue/apollo-option';

const apolloProvider = createApolloProvider({
  defaultClient: apolloClient,
})




const pinia = createPinia()
const app = createApp(App);
app.use(IonicVue)
  .use(router)
  .use(pinia)
  .use(apolloProvider);
  //.use(VueApolloComponents);


router.isReady().then(() => {
  app.mount('#app');
});