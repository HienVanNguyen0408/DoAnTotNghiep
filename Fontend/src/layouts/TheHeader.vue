<template>
    <div class="dq-header flex">
      <div class="header-title">
        Xin chào Hiến
      </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
        };
    },
    computed:{
    },
    created() {
      const me = this;
      me.initDataStatic();
    },
    methods: {
      initDataStatic(){
        const me = this;
      },

    },
};
</script>

<style scoped>
@import "@/assets/contents/scss/layout/header/header.scss";
.payment-order{
  cursor: pointer;
}
</style>