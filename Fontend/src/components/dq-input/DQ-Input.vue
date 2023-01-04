<template>
  <div>
    <div class="dq-input" :class="customInput">
      <div v-if="title" class="dq-mgb-5 text-title">{{ title }}</div>
      <input
        ref="input"
        class="input"
        :type="type"
        v-bind="$attrs"
        style="width:100%"
        v-on="inputListeners"
        :style="{
          height: height + 'px',
          fontSize: fontSize + 'px',
          fontFamily: fontFamily,
          color:color
        }"
        :class="[classInput,classHover,classActive, icon ? 'pd-icon-input' : '']"
      />
      <div v-if="icon" :class="[icon, positionIcon]" class="dq-icon-input"></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      typeof: String,
      default: "",
    },
    autoFocus: {
      typeof: Boolean,
      default: false,
    },
    customInput: {
      typeof: String,
      default: "",
    },
    height: {
      default: 36,
      type: Number,
    },
    width: {
      default: 200,
      type: Number,
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
    classInput: {
      default: "",
      type: String,
    },
    classHover: {
      default: "",
      type: String,
    },
    classActive: {
      default: "",
      type: String,
    },
    type : {
      default:"text",
      typeof:String
    },
    icon:{
      default:"",
      typeof: String
    },
    // Vị trí của icon
    position : {
      default:"left",
      typeof: String
    },
  },
  computed: {
    inputListeners: function () {
      var vm = this;
      // `Object.assign` merges objects together to form a new object
      return Object.assign(
        {},
        // We add all the listeners from the parent
        this.$listeners,
        // Then we can add custom listeners or override the
        // behavior of some listeners.
        {
          // This ensures that the component works with v-model
          input: function (event) {
            vm.$emit("input", event.target.value);
          },
        }
      );
    },
    positionIcon(){
      const me = this;
      if(me.position == "right") return "position-icon-right";
      if(me.position == "center") return "position-icon-center";
      return "position-default"
    }
  },
};
</script>

<style scoped >
@import "@/assets/contents/css/components/input/input.css";
</style>