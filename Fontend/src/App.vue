<template>
  <div id="app">
    <FullPage />
    <dq-loading></dq-loading>
    <!-- <Messanger /> -->
  </div>
</template>

<script>
import FullPage from '@/pages/FullPage.vue';
// import Messanger from '@/views/platform/Messanger.vue';
import {
  mapMutations
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
export default {
  name: "App",
  components: {
    FullPage,
    // Messanger
  },
  data() {
    return {
    }
  },
  created() {
    const me = this;
    let user = me.$commonFunc.getUserInfo();
    if (user && user.user_name) {
      me.updateUserLogin(user);
    }
  },

  methods: {
    ...mapMutations(ModuleUser, [
      'updateUserLogin'
    ])
  }
}
</script>

<style scoped>
@import url('./tailwind.css');
@import url('@/assets/contents/css/common/common.css');

*,
*::before,
*::after {
  box-sizing: border-box;
}

#app {
  width: 100%;
  height: 100vh;
  ;
}</style>
