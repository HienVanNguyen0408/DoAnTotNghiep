<template>
  <div class="dq-header">
    <div class="flex items-center">
      <div class="flex-1 dq-logo-home font-bold cursor-pointer">
        VHSTORE
      </div>
      <div class="flex-3 menus-header flex h-full">
        <div class="menu-header font-bold cursor-pointer" v-for="(menu, index) in menus" :key="index" :class="menuIndex == index ? 'menu-header-active' : ''"
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
                  <a-form id="components-form-demo-normal-login" :form="form" class="login-form" @submit="handleSubmit">
                    <div class="mt-3">
                      <a-form-item>
                        <a-input v-decorator="[
                          'UserName',
                          {
                            initialValue: user.user_name && user ? user.user_name : '',
                            rules: [
                              {
                                required: true,
                                message:
                                  'Vui lòng nhập tên tài khoản! Tài khoản không được để chống',
                              },
                            ],
                          },
                        ]" placeholder="Tài khoản">
                          <a-icon slot="prefix" type="user" style="color: rgba(0, 0, 0, 0.25)" />
                        </a-input>
                      </a-form-item>
                    </div>
                    <div class="mt-6">
                      <a-form-item>
                        <a-input-password v-decorator="[
                          'Password',
                          {
                            initialValue: user && user.password ? user.password : '',
                            rules: [
                              {
                                required: true,
                                message:
                                  'Vui lòng nhập mật khẩu! Mật khẩu không được để chống!',
                              },
                            ],
                          },
                        ]" type="password" placeholder="Mật khẩu">
                          <a-icon slot="prefix" type="lock" style="color: rgba(0, 0, 0, 0.25)" />
                        </a-input-password>
                        <div class="text-error-password" style="color: red" v-if="checkExistUserName"
                          :class="registerSuccess ? 'color-success' : ''">
                          {{ checkExistUserName }}
                        </div>
                      </a-form-item>
                    </div>
                    <a-form-item style="margin-top: 15px" class="jus-center">
                      <div class="mt-4">
                        <dq-button :title="isRegister ? 'Đăng ký' : 'Đăng nhập'" html-type="submit"></dq-button>
                      </div>
                    </a-form-item>
                  </a-form>
                </div>
                <div class="mt-4 flex justify-center align-center">
                  <div>
                    <div v-if="!isRegister">Khách hàng mới? <span class="color-orange cursor-pointer"
                        @click="registerUser">Tạo tài
                        khoản</span></div>
                    <div v-if="isRegister">Đã có tài khoản. <span class="color-orange cursor-pointer"
                        @click="loginNow">Đăng nhập ngay</span></div>
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
      user: {},
      checkExistUserName: false,
      registerSuccess: false,
      isRegister: false,
      form: this.$form.createForm(this, { name: "coordinated" }),
      menuIndex : -1
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
    me.initData();
  },
  methods: {
    ...mapActions(["getCartByUser"]),
    ...mapActions(ModuleUser, [
      'loginUserAsync',
      'registerUserAsync',
    ]),

    ...mapMutations(ModuleUser, [
      'updateUserLogin',
    ]),
    ...mapMutations(['updateCart']),
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
          title: 'Quần áo',
          router: '/product'
        },
        {
          title: 'Bài viết',
          router: '/blog'
        },
        // {
        //   title: 'Địa chỉ cửa hàng',
        //   router: '/address-store'
        // },
        {
          title: 'Chính sách đổi trả',
          router: '/policy'
        },
      ]
    },
    async handleSubmit(e) {
      e.preventDefault();
      this.form.validateFields(async (err, values) => {
        const me = this;
        let user = {
          user_name: values.UserName,
          password: values.Password
        }
        if (!err) {
          if (!me.isRegister) {
            let res = await me.loginUserAsync(user);
            if (me.User) {
              delete me.User.password;
              await me.$auth.setToken(me.User.key_auth);
              me.$commonFunc.updateUserInfo(me.User);
              me.checkExistUserName = res.message;
              let checkAdmin = me.User.role == me.$enum.Role.Admin;
              if(checkAdmin){
                me.$router.push("/admin");
              }
              me.getOrders();
              me.closeFormLogin();
            }
          } else {
            if (user) {
              let res = await me.registerUserAsync(user);
              me.checkExistUserName = res.message;
            }
          }
        }
      });
    },
    registerUser() {
      const me = this;
      me.isRegister = true;
    },
    /**
         * Lấy đanh sách đơn hàng trrong giỏ
         */
    async getOrders(userName) {
      const me = this;
      await me.getCartByUser(me.User.user_name);
      if(userName){
        me.updateCart([]);
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
      let index = me.menus.findIndex(x => x.router == menu.router);
      if(index >= 0){
        me.menuIndex = index;
      }
      me.$router.push(`${menu.router}`);
    },

    closeFormLogin() {
      const me = this;
      me.isShowLogin = false;
      me.isRegister = false;
      me.checkExistUserName = "";
    },

    resetPassword() {
      const me = this;
    },
    logout() {
      const me = this;
      if(me.User && me.User.user_name){
        me.getOrders(me.User.user_name);
      }
      me.$auth.logout();
      me.updateUserLogin({});
      me.closeFormLogin();
      me.user = {};
    },
    loginNow() {
      const me = this;
      me.isRegister = false;
      me.checkExistUserName = "";
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