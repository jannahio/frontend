import { createApp, provide, h } from "vue";
import { createPinia } from "pinia";
import { provideApolloClient, DefaultApolloClient } from '@vue/apollo-composable';

import App from "./App.vue";
import router from "./router";

import "./assets/main.css";

const app = createApp({
    setup () {
        provideApolloClient(App.apolloClient)
      },
      
    render: () => h(App),
  })

app.use(createPinia());
app.use(router);

app.mount("#app");
