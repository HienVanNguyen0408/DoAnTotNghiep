<template>
  <div class="dq-header">
    <div class="flex items-center">
      <div class="flex-1 dq-logo-home font-bold cursor-pointer">
        VHSTORE
      </div>
      <div class="flex-3 menus-header flex h-full">
        <div class="menu-header font-bold cursor-pointer" v-for="(menu, index) in menus" :key="index"
          @click="changeMenu(menu)">
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
          <div class="flex items-center justify-center h-10 w-10 mr-5 relative">
            <div class="dq-icon-24 icon-user cursor-pointer" @click="showFormLogin"></div>
            <div class="form-login" v-if="isShowLogin">
              <div v-if="!User || !User.user_name">
                <div>
                  <div class="title-search">ĐĂNG NHẬP TÀI KHOẢN</div>
                  <div class="mt-3">
                    <dq-input v-model="user.user_name" placeholder="Tài khoản" :title="'Tài khoản'">
                    </dq-input>
                  </div>
                  <div class="mt-6">
                    <dq-input v-model="user.password" :type="'password'" placeholder="Mật khẩu"
                      :title="'Mật khẩu'"></dq-input>
                  </div>
                </div>
                <div class="mt-4">
                  <dq-button :title="'Đăng nhập'" @click="loginUser"></dq-button>
                </div>
                <div class="mt-4 flex justify-center align-center">
                  <div>
                    <div>Khách hàng mới? <span class="color-orange cursor-pointer" @click="registerUser">Tạo tài
                        khoản</span></div>
                    <div>Quên mật khẩu? <span class="color-orange cursor-pointer" @click="resetPassword">Khôi phục mật
                        khẩu</span></div>
                  </div>
                </div>
              </div>
              <div v-else>
                <div>
                  <div class="title-search">THÔNG TIN TÀI KHOẢN</div>
                  <div class="font-bold mt-4 cursor-pointer">{{ User.user_name }}</div>
                  <div class="mt-4 cursor-pointer action-form">Tài khoản của tôi</div>
                  <div class="mt-4 cursor-pointer action-form">Địa chỉ của tôi</div>
                  <div class="mt-4 cursor-pointer action-form" @click="logout">Đăng xuất</div>
                </div>
              </div>
            </div>
          </div>
          <div class="flex items-center justify-center h-10 w-10 relative cart" @click="viewCart">
            <div class="dq-icon-24 icon-cart cursor-pointer relative"></div>
            <div class="number-cart font-bold absolute cursor-pointer">
              <span v-if="CartProducts && CartProducts.length > 0">{{ CartProducts.length }}</span>
              <span v-else>0</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  mapActions, mapGetters, mapMutations
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
export default {
  data() {
    return {
      menus: [],
      isShowSearch: false,
      isShowLogin: false,
      params: {},
      user: {}
    };
  },
  computed: {
    ...mapGetters(["CartProducts"]),
    ...mapGetters(ModuleUser, [
      'User'
    ]),
  },
  created() {
    const me = this;
    let user = me.$commonFunc.getUserInfo();
    if (user) {
      me.user = user;
    }
    me.initData();
  },
  methods: {
    ...mapActions(["getCartByUser"]),
    ...mapActions(ModuleUser, [
      'loginUserAsync',
      'registerUserAsync',
    ]),

    ...mapMutations(ModuleUser, [
      'updateUserLogin'
    ]),
    initData() {
      const me = this;
      me.initDataStatic();
      me.getOrders();
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
          router: '/product'
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
    /**
         * Lấy đanh sách đơn hàng trrong giỏ
         */
    async getOrders() {
      const me = this;
      if (me.user && me.user.user_name) {
        await me.getCartByUser(me.user.user_name);
      }
    },
    showFormSearch() {
      const me = this;
      me.isShowSearch = !me.isShowSearch;
    },
    showFormLogin() {
      const me = this;
      me.isShowLogin = !me.isShowLogin;
    },

    viewCart() {
      const me = this;
      me.$router.push('/cart');
    },

    changeMenu(menu) {
      const me = this;
      me.$router.push(`${menu.router}`);
    },

    closeFormLogin() {
      const me = this;
      me.isShowLogin = false;
    },
    async loginUser() {
      const me = this;
      let payload = {
        user_name: me.user.user_name,
        password: me.user.password
      }
      await me.loginUserAsync(me.user);
      if (me.User) {
        delete me.User.password;
        me.$commonFunc.updateUserInfo(me.User);
        me.closeFormLogin();
      }
    },

    registerUser() {
      const me = this;
    },

    resetPassword() {
      const me = this;
    },
    logout() {
      const me = this;
      me.$commonFunc.logoutUserInfo();
      me.updateUserLogin({});
      me.closeFormLogin();
      me.user = {};
    }
  },

};
</script>

<style scoped>
@import "@/assets/contents/css/layout/header/header.css";

.number-cart {
  right: 17px;
  top: 11px;
}
</style>