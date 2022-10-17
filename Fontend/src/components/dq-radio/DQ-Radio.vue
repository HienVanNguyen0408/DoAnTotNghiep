<template>
  <div>
    <div class="h-input">
      <div v-if="title" class="h-mb-5 text-title">{{ title }}</div>
      <input
        ref="input"
        class="input"
        type="radio"
        v-on="inputListeners"
        v-bind="$attrs"
        :checked="value"
      />
      <div v-if="icon" :class="icon" class="h-icon-input"></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    icon: {
      typeof: String,
      default: "",
    },
    title: {
      typeof: String,
      default: "",
    },
    value : {}
  },
  computed: {
    inputListeners(){
      return{
        click :event =>{
          this.$emit("click",event);
        },
        input: () =>{
          this.$emit("input",!this.value);
        },
        change: () =>{
          this.$emit("change",this.value);
        },
        // focus : () =>{
        //   this.focus();
        // },
        // blur:()=>{
        //   this.onBlur();
        // }
      }
    }
  },
};
</script>

<style scoped>
.h-input {
  position: relative;
  box-sizing: border-box;
}
.input {
  border: 1px solid #e5e5e5;
  border-radius: 4px;
  padding-left: 10px;
}
.h-icon-input {
  position: absolute;
  top: 8px;
  right: 10px;
}
.text-title {
  font-weight: bold;
}
</style>