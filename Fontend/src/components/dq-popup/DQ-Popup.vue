<template>
  <div class="">
    <div class="dq-model-popup"></div>
    <div
      class="dq-popup"
      :style="stylePop"
    >
      <div class="dq-pop-header flex">
        <slot name="header"></slot>
        <div
          class="icon-close dq-icon-16 dq-icon-close"
          @click="clickClosePopup"
        ></div>
      </div>
      <div class="dq-pop-content">
        <slot name="content"></slot>
      </div>
      <div class="dq-pop-footer flex">
        <slot name="footer"></slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    /**
     * Chiều rộng popup
     */
    width: {
      typeof: Number,
      default: 500,
    },
    /**
     * Chiều cao popup
     */
    height: {
      typeof: Number,
      default: 500,
    },

    isShow: {
      default: false,
      typeof: Boolean,
    },
    isFull :{
        default : false,
        typeof:Boolean
    }
  },

  computed: {
    getWidthScreen() {
      return window.innerWidth;
    },
    getHeightScreen() {
      return window.innerHeight;
    },
    stylePop(){
        const me = this;
        if(me.isFull){
            return [{width:'100%',height: '100%',top:0,left:0}]
        }
        else{
            return [{width:me.width +'px',height:me. height+'px',top: me.getHeightScreen/2 - me.height/2+'px', left : me.getWidthScreen/2 - me.width/2+'px'}];
        }
    }
  },
  methods: {
    clickClosePopup() {
      this.$emit("closePopup");
    },
  },
};
</script>

<style scoped>
@import url('@/assets/contents/scss/components/popup/popup.scss');
</style>