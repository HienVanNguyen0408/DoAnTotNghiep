<template>
  <div class="dq-header">
    <div class="flex items-center">
      <div class="flex-1 dq-logo-home font-bold cursor-pointer">
        VHSTORE
      </div>
      <div class="flex-3 menus-header flex h-full">
        <div class="menu-header font-bold" v-for="(menu, index) in menus" :key="index">
          <div>{{ (menu.title) }}</div>
        </div>
      </div>
      <div class="flex-1">
        <div class="flex items-center">
          <div class="flex items-center justify-center h-10 w-10 mr-5 relative">
            <div class="dq-icon-24 icon-search cursor-pointer" @click="showFormSearch"></div>
            <div class="form-search-product" v-if="isShowSearch">
              <div>
                <div class="title-search">Tìm kiếm</div>
                <dq-input v-model="params.filter" placeholder="Tìm kiếm sản phẩm..." :position="'right'"
                  :icon="'dq-icon-24 icon-input-search opacity-40'"></dq-input>
              </div>
            </div>
          </div>
          <div class="flex items-center justify-center h-10 w-10 mr-5">
            <div class="dq-icon-24 icon-user cursor-pointer"></div>
          </div>
          <div class="flex items-center justify-center h-10 w-10 relative cart">
            <div class="dq-icon-24 icon-cart cursor-pointer relative"></div>
            <div class="number-cart font-bold absolute cursor-pointer">0</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      menus: [],
      isShowSearch: false,
      params: {}
    };
  },
  computed: {
  },
  created() {
    const me = this;
    me.initData();
  },
  methods: {
    initData() {
      const me = this;
      me.initDataStatic();
    },
    initDataStatic() {
      const me = this;
      me.menus = [
        {
          title: 'Trang chủ',
          router: '/home'
        },
        {
          title: 'Bài viết',
          router: '/blogs'
        },
        {
          title: 'Quần áo',
          router: '/clothes'
        },
        {
          title: 'Địa chỉ cửa hàng',
          router: '/address-store'
        },
        {
          title: 'Chính sách',
          router: '/policy'
        },
      ]
    },
    showFormSearch(){
      const me = this;
      me.isShowSearch = !me.isShowSearch;
    }
  },

};
</script>

<style scoped>
@import "@/assets/contents/css/layout/header/header.css";
.number-cart{
  right: 17px;
  top: 11px;
}
</style>