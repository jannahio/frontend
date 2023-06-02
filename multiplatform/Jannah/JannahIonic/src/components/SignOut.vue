<template>
  <div class="mx-auto h-screen w-full sm:w-2/3 md:w-1/3">
    <form action="POST" @submit.prevent="userSignOut()">
      <div class="bg-white rounded-xl w-full">
        <div class="space-y-4">
        </div>
        <button
          class="mt-4 w-full bg-teal-500 hover:bg-teal-700 focus:ring focus:ring-teal-100 text-white py-2 rounded-md text-lg tracking-wide"
        >
          SignOut
        </button>
      </div>
    </form>
  </div>
</template>
<script>
import { useUserStore } from "@/stores/user";

export default {
  name: "SignOut",

    setup() {
      const userStore = useUserStore();
      return { userStore };
    },
    data() {
      return {
        signInDetails: {
          username: "",
          password: "",
        },
      };
    },
    methods: 
    {
          async userSignOut() 
          {
            this.userStore.removeToken();
            this.userStore.removeUser();
            this.$router.push('/workflow/SignIn');    
          },
    },
};
</script>

