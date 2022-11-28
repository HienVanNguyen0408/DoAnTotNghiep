<template>
  <div id="app">
    <FullPage/>
  </div>
</template>

<script>
  import FullPage from '@/pages/FullPage.vue'
  export default {
    name:"App",
    components: {
      FullPage
    },
    data () {
      return {
      }
    },
  }
</script>

<style scoped>
 @import url('./tailwind.css');
 @import url('@/assets/contents/scss/common/common.scss');
  #app {
    width:100%;
    height: 100vh;;
  }

</style>
