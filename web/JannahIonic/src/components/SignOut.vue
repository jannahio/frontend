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
// import { useUserStore } from "@/stores/user";
import { useIonicUserStore } from "@/stores/ionic_user";

export default {
  name: "SignOut",

    setup() {
      const userStore = '';
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
            const ionicSignOutUserStore = await useIonicUserStore.create();
            console.log("ionicSignOutUserStore", ionicSignOutUserStore);
            await ionicSignOutUserStore.remove('ionicUserToken');
            await ionicSignOutUserStore.remove('ionicUser');
            await ionicSignOutUserStore.clear();
            const validate__remove_Token = await ionicSignOutUserStore.get('ionicUserToken');
            const validate__remove_User = await ionicSignOutUserStore.get('ionicUser');
            console.log("validate__remove_Token", validate__remove_Token);
            console.log("validate__remove_User", validate__remove_User);
            this.$router.push('/workflow/SignIn');    
          },
    },
};
</script>