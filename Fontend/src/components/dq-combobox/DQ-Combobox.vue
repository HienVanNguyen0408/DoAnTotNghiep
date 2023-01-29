<template>
  <div :class="classCombobox">
    <div v-if="title" class="mb-2" :class="classTitle">{{ title }}</div>
    <a-select
      class="w-100"
      ref="aSelect"
      show-search
      option-filter-prop="children"
      :style="styleCombo"
      :filter-option="filterOption"
      @focus="handleFocus"
      @blur="handleBlur"
      @change="handleChange"
      :placeholder="placeholder"
      :disabled="disabled"
      :value="valuePeriodCombo"
    >
      <a-select-option
        v-for="(item, index) in data"
        :key="index"
        :value="item[`${keyData}`]"
      >
        {{ item[`${display}`] }}
      </a-select-option>
    </a-select>
  </div>
</template>

<script>
export default {
  props: {
    data: [],
    keyData: {
      typeof: String,
      default: "",
    },
    display: {
      typeof: String,
      default: "",
    },
    defaultValue: {},
    value: {},
    title: {
      typeof: String,
      default: "",
    },
    classCombobox: {
      typeof: String,
      default: "",
    },
    placeholder: {
      typeof: String,
      default: "",
    },
    styleCombo: {
    },
    classTitle: {
      typeof: String,
      default: "",
    },
    disabled :{
        default:false,
        typeof :Boolean
    }
  },
  data() {
    return {
      valuePeriod : this.defaultValue
    };
  },
  computed:{
    valuePeriodCombo: {
      get() { return this.valuePeriod; },
      set(value) { this.valuePeriod = value;}
    }
  },
  methods: {
    handleBlur() {},
    handleFocus() {},
    filterOption(input, option) {
      return (
        option.componentOptions.children[0].text
          .toLowerCase()
          .indexOf(input.toLowerCase()) >= 0
      );
    },
    handleChange(value) {
      const me = this;
      this.valuePeriod = value;
      me.$emit("update:value",value);
      this.$emit('change',value);
    },
  },
};
</script>

<style scoped>
.ant-select-selection--single{
  height: 36px !important;
}
</style>
