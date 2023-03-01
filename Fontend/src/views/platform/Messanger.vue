<template>
    <div>
      <div id="fb-root"></div>
      <div class="fb-customerchat" attribution="setup_tool" page_id="104040369299055" theme_color="#0084ff"></div>
    </div>
  </template>
  
  <script>
  import FB from 'fb-sdk'
  
  export default {
    mounted() {
      this.$nextTick(() => {
        FB.init({
          appId: '888437605815401',
          autoLogAppEvents: true,
          xfbml: true,
          version: 'v11.0'
        })
      })
    }
  }
  </script>