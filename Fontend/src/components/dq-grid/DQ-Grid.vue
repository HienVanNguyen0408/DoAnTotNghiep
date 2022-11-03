<template>
  <div>
    <div class="overflow-grid">
      <table class="dq-grid w-100">
        <thead class="dq-th-grid">
          <tr class="flex">
            <dq-th
              @clickCheck="clickCheckboxMul"
              :checked="isCheckboxSelectedMul"
              class="maxW-42px"
              :checkbox="checkbox"
              v-if="checkbox"
            ></dq-th>
            <dq-th
              class="maxW-50px"
              v-if="serial"
              :serial="serial"
              :order="'STT'"
            ></dq-th>
            <dq-th v-for="(col, index) in columns" :col="col" :key="index"></dq-th>
          </tr>
        </thead>
        <tbody>
          <dq-tr
            v-for="(item, index) in data"
            :key="index"
            :data="item"
            :columns="columns"
            @dblclick="dblclick(item)"
          >
            <template v-slot:td-checkbox>
              <dq-th
                @clickCheck="clickCheckbox(item)"
                :checked="isCheckboxSelected(item)"
                class="maxW-42px"
                :checkbox="checkbox"
                v-if="checkbox"
              ></dq-th>
            </template>
             <template v-slot:td-widget>
               <div v-if="widget" class="icon-32 icon-delete maxW-50px"></div>
            </template>
            <template v-slot:td-serial>
              <dq-th
                class="maxW-50px"
                v-if="serial"
                :serial="serial"
                :order="index + 1"
              ></dq-th>
            </template>
          </dq-tr>
        </tbody>
      </table>
    </div>
    <div class="ms-pagination" v-if="pagination">
      <dq-pagination
        ref="pagination"
        @getData="getData"
        :totalRecord="dataPagination.totalRecord"
        :pageSize="dataPagination.pageSize"
        :totalPages="dataPagination.totalPages"
        :pageIndex="dataPagination.pageIndex"
        :filter="dataPagination.filter"
        :textTotal="dataPagination.textPage"
      ></dq-pagination>
    </div>
  </div>
</template>
<script>
export default {
  name: "DQ-Grid",
  components: {},
  props: {
    columns: [],
    data: [],
    /**
     * Có phân trang hay không
     */
    pagination: {
      default: false,
      typeof: Boolean,
    },
    checkbox: {
      default: false,
      typeof: Boolean,
    },
    /**
     * Grid có STT hay không
     */
    serial: {
      default: false,
      typeof: Boolean,
    },
    pageIndex: {
      typeof: Number,
      default: 1,
    },
    pageSize: {
      typeof: Number,
      default: 10,
    },
    fieldId: {
      typeof: String,
      default: "",
    },
    dataPagination : {},
    widget : {
      default : false,
      typeof : Boolean
    },
  },
  computed: {
    isCheckboxSelectedMul() {
      const me = this;
      if (!me.selected || (me.selected && me.selected.length <= 0))
        return false;
      else if (
        me.selected &&
        me.data &&
        me.selected.length > 0 &&
        me.selected.length == me.data.length
      )
        return true;
      return false;
    },
  },
  data() {
    return {
      selected: [],
      isShow: false,
      currentSelected: {},
    };
  },
  methods: {
    getData(params) {
      const me = this;
      me.$emit('getData',params);
    },
    deleteData(id) {
      const me = this;
      me.$emit("deleteData", id);
    },
    editData(id) {
      const me = this;
      me.$emit("editData", id);
    },

    /**
     * double click row in grid
     * Sửa thông tin của dòng đó
     */
    dblclick(item) {
      this.$emit('dbclick',item);
    },
    /**
     * Click check box multiple
     */
    clickCheckboxMul() {
      const me = this;
      me.selected = me.isCheckboxSelectedMul ? [] : [...me.data];
      this.$emit("checkboxMulti", me.selected);
    },
    /**
     * Click checkbox trên 1 row
     */
    clickCheckbox(item) {
      const me = this;
      if (me.isCheckboxSelected(item)) {
        let index = me.selected.findIndex((x) => {
          return (x[`${me.fieldId}`] == item[`${me.fieldId}`]);
        });
        if (index >= 0) {
          me.selected.splice(index, 1);
          this.$emit("checkboxOne", me.selected);
          return;
        }
      } else {
        me.selected.push(item);
        this.$emit("checkboxOne", me.selected);
      }
      
    },
    isCheckboxSelected(item) {
      const me = this;
      if (me.selected && me.selected.length > 0) {
        return me.selected.includes(item);
      }
      return false;
    },
    resetSelect(){
      const me = this;
      me.selected = [];
    }
  },
};
</script>

<style scoped>
@import url("../../assets/contents/css/grid/grid.css");
.overflow-grid{
  max-width: 100%;
  overflow: auto;
}

/* .overflow-grid::-webkit-scrollbar {
    width: 5px;
    height: 5px;
} */

/* .overflow-grid::-webkit-scrollbar-track-piece {
    background-color: #c2d2e4;
} */

/* .overflow-grid::-webkit-scrollbar-thumb:vertical {
    height: 30px;
    background-color: #0a4c95;
} */
</style>
