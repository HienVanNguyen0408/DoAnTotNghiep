
<template>
  <div>
    <div class="dq-bg"></div>
    <div class="dq-login">
      <div class="login-title">
        <div
          @click="redirectHome"
          class="dq-logo dq-icon-80 icon-logo"
          title="Trang chủ"
        ></div>
        <div>{{ $t("i18nLogin.Welcome") }}</div>
      </div>
      <div class="login-content">
        <div class="option-phone-email">
          <div class="flex jus-between">
            <div class="text-option">{{ titleText }}</div>
          </div>
          <a-form
            id="components-form-demo-normal-login"
            :form="form"
            class="login-form"
            @submit="handleSubmit"
          >
            <a-form-item>
              <a-input
                v-decorator="[
                  'UserName',
                  {
                    initialValue: user.username && user ? user.username : '',
                    rules: [
                      {
                        required: true,
                        message:
                          'Vui lòng nhập tên tài khoản! Tài khoản không được để chống',
                      },
                    ],
                  },
                ]"
                placeholder="Tài khoản"
              >
                <a-icon
                  slot="prefix"
                  type="user"
                  style="color: rgba(0, 0, 0, 0.25)"
                />
              </a-input>
            </a-form-item>
            <a-form-item>
              <a-input-password
                v-decorator="[
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
                ]"
                type="password"
                placeholder="Mật khẩu"
              >
                <a-icon
                  slot="prefix"
                  type="lock"
                  style="color: rgba(0, 0, 0, 0.25)"
                />
              </a-input-password>
              <div
                class="text-error-password"
                style="color: red"
                v-if="checkExistUserName"
                :class="registerSuccess ? 'color-success' : ''"
              >
                {{ checkExistUserName }}
              </div>
            </a-form-item>
            <a-form-item style="margin-top: 15px" class="jus-center">
              <div class="btn-login">
                <a-button
                  type="primary"
                  html-type="submit"
                  class="login-form-button font-bold"
                >
                  {{ textBtn }}
                </a-button>
              </div>
              <div
                class="flex align-center login-google"
                @click="redirecLoginGoogle"
              >
                <div style="font-weight: bold">Đăng nhập với Google</div>
                <div
                  style="margin-left: 20px"
                  class="icon-google dq-icon-18"
                ></div>
              </div>
              <div class="more-option">
                <div class="flex jus-center">
                  {{ textShow1 }}
                  <span class="register-text" @click="registerAccount">{{
                    textShow
                  }}</span>
                </div>
              </div>
            </a-form-item>
          </a-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import { ModuleUser } from "@/store/module-const";
export default {
  components: {},
  computed: {
    titleText() {
      const me = this;
      if (!me.isRegister) {
        return me.$t("i18nLogin.titleLogin");
      }
      return me.$t("i18nLogin.titleRegister");
    },
    textBtn() {
      const me = this;
      if (!me.isRegister) {
        return me.$t("i18nLogin.Login");
      }
      return me.$t("i18nLogin.Register");
    },
    textShow() {
      const me = this;
      if (me.isRegister) {
        return me.$t("i18nLogin.Login");
      }
      return me.$t("i18nLogin.Register");
    },
    textShow1() {
      const me = this;
      if (!me.isRegister) {
        return me.$t("i18nLogin.NoAccount");
      }
      return me.$t("i18nLogin.HaveAccount");
    },
  },
  created(){
  },
  data() {
    return {
      isOptionPhone: true,
      isLoginGoogle: false,
      user: {},
      isRegister: false,
      remmber: false,
      checkExistUserName: "",
      checkExistPassword: true,
      users: [],
      form: this.$form.createForm(this, { name: "coordinated" }),
      registerSuccess: false,
    };
  },
  methods: {
    ...mapActions(ModuleUser, ["loginUser", "getTokenUser","registerUserAsync"]),
    async redirecLoginGoogle() {
      // window.open("https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?response_type=code&client_id=171089796403-r5p2ko063d3iig2ajnghvkq7kuns3vqn.apps.googleusercontent.com&redirect_uri=https%3A%2F%2Fmycvvn-1556004183645.firebaseapp.com%2F__%2Fauth%2Fhandler&state=AMbdmDmNLO04XqL1-1u7ihvU85QNG-0oQbiD6HKdT5egOmdz0rxc-XVuK6PGb-wI3t9qUAO1KpYtL9pLvP4zpTqLvH12Qo-zKc9wNSH_ZEu8Z55dP4yy_KISVKg_wVTXTu7_NBvy4X1q1bNlDreZbwAsL_As0WC-t5OIgrPSzbrNsPxJf0hHzEVFs2lMmGgOPyvx7RY2bdFksWIT_daVJWLp0gzjLDUxg22eVlbU5JQ3kDYngrhcHpv0YiXc11YRGN_0J67apovZTkctN_2-nnTKoC-vN3dIVpibkfuxDOdy37z8sAGNPlRVtOqr0lsgFxsFOFVXO9Hcch3ATnpE&scope=openid%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20profile&context_uri=https%3A%2F%2Faccounts.fullstack.edu.vn&flowName=GeneralOAuthFlow");
      const me = this;
      const userGG = await me.$gAuth.signIn();
      var profile = userGG.getBasicProfile();
      let isLoginGoogle = me.$gAuth.isAuthorized;
      if (isLoginGoogle) {
        let params = {};
        if(profile){
          params = {
            emailId  : profile.getId(),
            fullName : profile.getName(),
            userName :  profile.getEmail(),
            email :  profile.getEmail(),
            imageUrl : profile.getImageUrl()
          }
        }
        let res = await me.$auth.loginUser(params);
        if (res) {
          this.$router.push("/");
        }
      }
    },
    backOption() {
      const me = this;
      me.typeOption = 0;
    },
    clickType() {
      const me = this;
      me.isOptionPhone = !me.isOptionPhone;
    },

    async loginWithGoogle() {
      const me = this;
      await me.$gAuth.signIn();
      let isLoginGoogle = me.$gAuth.isAuthorized;
      if (isLoginGoogle) {
        this.$router.push("/");
      }
    },
    async logoutWithGoogle() {
      const me = this;
      await me.$gAuth.signOut();
    },
    /**
     * Chuyển form đăng kí tài khoản
     */
    registerAccount() {
      const me = this;
      me.isRegister = !me.isRegister;
      me.checkExistUserName = "";
    },

    async handleSubmit(e) {
      e.preventDefault();
      this.form.validateFields(async (err, values) => {
        const me = this;
        let user = {
          userName: values.UserName,
          password: values.Password,
        };
        if (!err) {
          if (!me.isRegister) {
            me.loginUser(user);
          } else {
            me.registerUser(user);
          }
        }
      });
    },
    redirectHome() {
      const me = this;
      me.$router.push("/");
    },
    redirectAdmin() {
      const me = this;
      me.$router.push("/admin-user");
    },
    async loginUser(user) {
      const me = this;
      let res = await me.$auth.loginUser(user);
      if (res && res.status == me.$enum.Status.Ok) {
        let data = res.data;
        if (data) {
          if (data.role == me.$enum.Role.Admin) {
            me.redirectAdmin();
          } else {
            me.redirectHome();
          }
        }
      } else {
        me.checkExistUserName = "Tài khoản hoặc mật khẩu không đúng";
      }
    },

    async registerUser(user) {
      const me = this;
      if (user) {
        let res = await me.registerUserAsync(user);
        if (res) {
          me.checkExistUserName = res.data;
          if (res.status == me.$enum.Status.Created) {
            me.registerSuccess = true;
          }
        } else {
          me.checkExistUserName = "Đăng ký thất bại";
        }
      }
    },
  },
};
</script>
<style scoped>
@import url("../../assets/contents/css/views/user/login.css");
.color-success {
  color: green;
}
.login-google {
  cursor: pointer;
}
</style>
