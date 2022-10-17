<template>
  <div class="dq-dropdown">
    <slot name="dropdown"></slot>
    <slot name="button" :events="{ clickBtn }" :click="clickBtn"></slot>
    <slot name="buttonHover" :hover="showDrop" :leave="closeDrop"></slot>
    <dq-button :title="button" @click="clickBtn($event)" v-if="button">Hello</dq-button>
    <dq-menu class="dq-dropdown-menu" :style="{'min-width':minW + 'px'}" v-if="isShow" :data="data" :display="display" :filed="filed">
    </dq-menu>
  </div>
</template>

<script>
export default {
  name:"DQ-Dropdown",
  components: {  },
  props: {
    data: [],
    hover: {
      default: false,
      typeof: Boolean,
    },
    display: {
      default: "",
      typeof: String,
    },
    filed: {
      default: "",
      typeof: String,
    },
    button:{
      default: "",
      typeof: String,
    },
    pos:{
      default: "",
      typeof: String,
    },
    minW:{
      default: 200,
      typeof:Number
    }
  },
  data(){
    return{
      isShow:false,
      elPrevClass: ""
    }
  },
  created(){
    
  },
  mounted(){
    this.closeDropClick();
  },
  methods: {
    dropdownClick(item) {
      const me = this;
      me.$emit('selectDrop', item);
      me.closeDropClick();
    },
    /**
     * Hàm sử lý click button
     */
    clickBtn(e){
      const me = this;
      me.isShow = true;
      if(e && e.target){
          me.elPrevClass = e.target._prevClass;
        }
    },
    /**
     * Hàm sử lý hover button
     */
    hoverBtn(){
      const me = this;
      me.isShow = true;
    },
    
    closeDrop(){
      this.isShow = false;
    },
    showDrop(){
      this.isShow = true;
    },
    closeDropClick(){
      const me = this;
      window.addEventListener("click", function(event) {
        if(event.target._prevClass != me.elPrevClass){
          me.closeDrop();
        }
      });
    }
  },
};
</script>

<style scoped>
@import url('../../assets/contents/css/dropdown/dropdown.css');
</style>