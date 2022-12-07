<template>
  <tr class="dq-tr flex w-100" @dblclick="dbClick" @click="click">
    <slot name="td-widget"></slot>
    <slot name="td-checkbox"></slot>
    <slot name="td-serial"></slot>
    <td class="w-100 dq-td flex flex-1 word-normal" 
      v-for="(col, index) in columns" :key="index" 
      :class="[col && col.align ? `jus-${col.align}` : '',col && col.isBold ? 'font-bold' : '',col.class]"
      :style="[
        col && col.width ? {width:`${col.width}px`,minWidth:`${col.width}px`} : '' 
      ]"
    >
      <div v-if="col.image" class="flex jus-center w-100 align-center">
        <img style="width:100px;height:100px" v-if="data[`${col.dataField}`]" :src="`data:image/png;base64,${data[`${col.dataField}`]}`" >
      </div>
      <div v-else-if="col.audio" class="flex jus-center w-100 align-center">
        <audio v-if="data[`${col.dataField}`]" controls style="width:100%">
            <source :src="getBase64File(data[`${col.dataField}`])" type="audio/mpeg">
        </audio>
      </div>
      <div v-else-if="col.format == $enum.Format.Date">
          {{ data[`${col.dataField}`] | formatDate}}
      </div>
      <div v-else-if="(col.format == $enum.Format.Money)">
          {{ data[`${col.dataField}`] | formatMoney }}
      </div>
       <div v-else-if="col.enum != null">
          {{ $commonFunc.getValueStringByEnum(col.enum,data[`${col.dataField}`])}}
      </div>
      <div v-else :title="data[`${col.dataField}`]">
        {{ data[`${col.dataField}`] }}
      </div>
    </td>
  </tr>
</template>

<script>
export default {
  components: {},
  props: {
    columns: [],
    data: {
      typeof: Object,
      default: null,
    },
  },
  data(){
    return {
    }
  },
  computed:{
    
  },
  methods: {
    dbClick() {
      const me = this;
      me.$emit("dblclick");
    },
    click() {
      const me = this;
      me.$emit("click");
    },
    getBase64File(data){
      const me = this;
      return me.$commonFunc.getBase64FromData(data);
    }
  },
};
</script>


<style scoped>
@import url("../../assets/contents/css/grid/tr.css");
</style>