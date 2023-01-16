<template>
  <div>
    <div class="icon-left" :class="icon" v-if="icon &&  postion == 'left'"></div>
    <button
      @click="btnClick"
      @blur="btnBlur"
      @mousedown="btnMouseDown"
      @mouseover="btnMouseover"
      @mouseleave="btnMouseleave"
      :class="[classButton,classHover,classActive,type, disabled ? 'disabled-btn' : '']"
      :style="{
        height: height + 'px',
      }"
      :disabled="disabled"
      class="btn-default w-100"
      v-bind="$attrs"
    >
      {{ title }}
    </button>
    <div class="icon-right" :class="icon" v-if="icon &&  postion == 'right'"></div>
  </div>
</template>
<script>
export default {
  name: "DQButton",
  components: {},
  props: {
    icon: {
      default: "",
      type: String,
    },
    classButton: {
      default: "",
      type: String,
    },
    title: {
      default: "",
      type: String,
    },
    placeholder: {
      default: "",
      type: String,
    },
    cusStyle: {
      default: "",
      type: String,
    },
    posZ: {
      default: "",
      type: String,
    },
    disabled: {
      default: false,
      type: Boolean,
    },
    shape: {
      default: "",
      type: String,
    },
    size: {
      default: "",
      type: String,
    },
    height: {
      default: 36,
      type: Number,
    },
    width: {
      default: 100,
      type: Number,
    },
    backgroundColor: {
      default: "",
      type: String,
    },
    color: {
      default: "",
      type: String,
    },
    fontSize: {
      default: 16,
      type: Number,
    },
    fontFamily: {
      default: "",
      type: String,
    },
    classHover :{
      default: "",
      type: String,
    },
    classActive :{
      default: "",
      type: String,
    },
    fontBold : {
      default:false,
      typeof:Boolean
    },
    postion:{
      default:'left',
      typeof: String
    },
    type:{
      default:'primary',
      typeof: String
    },
  },
  data() {
    return {};
  },
  created() {},
  computed: {},
  methods: {
    btnClick() {
      this.$emit("click");
    },
    btnBlur(){
      this.$emit("blur");
    },
    btnMouseDown(){
      this.$emit("mousedown");
    },
    btnMouseover(){
      this.$emit("mouseover")
    },
    btnMouseleave(){
      this.$emit("mouseleave");
    }
  },
};
</script>

<style scoped>
@import url('@/assets/contents/css/components/button/button.css');
</style>