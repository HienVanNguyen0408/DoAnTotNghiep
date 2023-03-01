import Vue from 'vue'
import App from './App.vue'
import {router} from './router/router.js';
import store from '@/store/store';
import moment from 'vue-moment';
import vue2Swiper from 'vue2-swiper';
import i18n from './i18n/i18n-config.js'
import  filters  from './filters/dq-filter';

import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';

import './tailwind.css'

import InputColorPicker from 'vue-native-color-picker'

// import "./plugin.js";

// register plugin global
import './globalPlugin';
// register plugin components
import './globalPluginComponents';

// import GAuth from 'vue-google-oauth2'
// const gauthOption = {
  //   clientId: '658612176566-5sp84c1s1k36bqj9kk5i211f0vpllbtk.apps.googleusercontent.com',
  //   scope: 'profile email',
  //   prompt: 'select_account',
  //   fetch_basic_profile : true
  // }
  // Vue.use(GAuth, gauthOption);
  
Vue.config.productionTip = false;
Vue.use(InputColorPicker);
Vue.use(vue2Swiper);
Vue.use(Antd);
Vue.use(moment);

new Vue({
  router,
  store,
  i18n:i18n,
  filters,
  render: h => h(App),
}).$mount('#app')



//EAAMoB3ZCmVGkBAKFUIkfLZCqd8Uy15fZA2YYm2rhSVPFkuHFaobXF1pyHeeinZClLGtM1iTtYcsClM65dHQF8eWK4fTAx5GbhehxeTbeYJKLu3QXkdDZAwCiGHmhJpiVV9GOgUxZCmuc6BmIpoiWkOa8yf1dNKeQi23UMfeUOyjP9sxpTto2Ov