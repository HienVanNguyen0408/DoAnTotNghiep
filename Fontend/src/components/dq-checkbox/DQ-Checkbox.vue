<template>
  <div>
    <div class="dq-input-checkbox">
      <div v-if="title" class="dq-mb-5 dq-font-bold">{{ title }}</div>
      <input
        ref="input"
        class="input dq-input-checkbox "
        type="checkbox"
        :class="[checkOnOf ? 'dq-check-on-of' : '',checkboxCus]"
        :checked="value"
        :value="value"
        v-on="inputListeners"
      />
      <div v-if="icon" :class="icon" class="dq-icon-input"></div>
    </div>
  </div>
</template>

<script>
export default {
   model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    icon: {
      typeof: String,
      default: "",
    },
    title: {
      typeof: String,
      default: "",
    },
    checkOnOf: {
      type: Boolean,
      default: false,
    },
    checked: Boolean,
    /**
     * Custom css checkbox
     */
    checkboxCus:{
      default:"",
      typeof:String
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
  data(){
    return{
      focused:false
    }
  },
  methods: {
    focus(){
      const me = this;
      me.focused = true;
    },
    onBlur(){
      const me = this;
      me.focus = false;
    }
  },
};
</script>

<style scoped>
.dq-input-checkbox {
  position: relative;
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  text-align: center;
  width: 20px;
  height: 20px;
  align-items: center;
}
.input {
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    margin-left: 5px;
}

.dq-check-on-of {
  position: relative;
  background: white;
  width: 120px;
  height: 40px;
  -webkit-appearance: initial;
  border-radius: 3px;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  outline: none;
  font-size: 14px;
  font-family: Trebuchet, Arial, sans-serif;
  font-weight: bold;
  cursor: pointer;
  border: 1px solid #ddd;
}

.dq-check-on-of:after {
  position: absolute;
  top: 5%;
  display: block;
  line-height: 32px;
  width: 45%;
  height: 90%;
  background: #fff;
  box-sizing: border-box;
  text-align: center;
  transition: all 0.3s ease-in 0s;
  color: black;
  border: #888 1px solid;
  border-radius: 3px;
}

.dq-check-on-of:after {
  left: 2%;
  content: "OFF";
}

.dq-check-on-of:checked:after {
  left: 53%;
  content: "ON";
}
.dq-icon-input {
  position: absolute;
  top: 8px;
  right: 10px;
}
.dq-font-bold {
  font-weight: bold;
}

.checkbox {
    width: 100%;
    margin: 15px auto;
    position: relative;
    display: block;
}

.checkbox input[type="checkbox"] {
    width: auto;
    opacity: 0.00000001;
    position: absolute;
    left: 0;
    margin-left: -20px;
}
.checkbox label {
    position: relative;
}
.checkbox label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    margin: 4px;
    width: 22px;
    height: 22px;
    transition: transform 0.28s ease;
    border-radius: 3px;
    border: 2px solid #7bbe72;
}
.checkbox label:after {
  content: '';
    display: block;
    width: 10px;
    height: 5px;
    border-bottom: 2px solid #7bbe72;
    border-left: 2px solid #7bbe72;
    -webkit-transform: rotate(-45deg) scale(0);
    transform: rotate(-45deg) scale(0);
    transition: transform ease 0.25s;
    will-change: transform;
    position: absolute;
    top: 12px;
    left: 10px;
}
.checkbox input[type="checkbox"]:checked ~ label::before {
    color: #7bbe72;
}

.checkbox input[type="checkbox"]:checked ~ label::after {
    -webkit-transform: rotate(-45deg) scale(1);
    transform: rotate(-45deg) scale(1);
}

.checkbox label {
    min-height: 34px;
    display: block;
    padding-left: 40px;
    margin-bottom: 0;
    font-weight: normal;
    cursor: pointer;
    vertical-align: sub;
}
.checkbox label span {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
}
.checkbox input[type="checkbox"]:focus + label::before {
    outline: 0;
}

</style>