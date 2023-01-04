<template>
  <div class="flex flex-1" :class="serial || checkbox ? 'th-first' : ''">
    <th v-if="serial" class=" w-100 text-center">
      {{ order }}
    </th>
    <th class="" v-else-if="checkbox">
      <dq-checkbox @click="clickCheck" :checkboxCus="checkboxCus" :class="[checkboxCus, 'th-checkbox']"
        :value="checked"></dq-checkbox>
    </th>
    <th class="w-100" @click="click" v-else-if="col" :style="[
      col && col.width ? { width: `${col.width}px`, minWidth: `${col.width}px` } : '',
    ]" :class="[col && col.align ? `text-${col.align}` : '']">
      {{ col.title }}
    </th>
  </div>
</template>

<script>
export default {
  props: {
    col: {
      typeof: Object,
      default: null,
    },
    checkbox: {
      typeof: Boolean,
      default: false,
    },
    /**
     * Có thứ tự cột hay không
     */
    serial: {
      typeof: Boolean,
      default: false
    },
    order: {
      typeof: Object,
      default: null
    },
    checkboxCus: {
      typeof: String,
      default: "",
    },
    checked: {
      default: false,
      typeof: Boolean
    }
  },
  created() {
    const me = this;
    me.initData();
  },
  methods: {
    initData() {
      const me = this;
      if (me.col) {
        if (!me.col.title) {
          me.col.title = "";
        }
        if (!me.col.width) {
          me.col.width = 50;
        }
        if (!me.col.height) {
          me.col.height = 36;
        }
        if (!me.col.minW) {
          me.col.minW = 50;
        }
        if (!me.col.maxW) {
          me.col.maxW = 200;
        }
      }
    },
    clickCheck() {
      const me = this;
      me.$emit("clickCheck");
    },
    click() {
      const me = this;
      me.$emit("click");
    },
  },
};
</script>

<style scoped>
@import url("../../assets/contents/css/grid/th.css");
</style>