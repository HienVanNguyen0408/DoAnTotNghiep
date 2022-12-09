import Vue from 'vue';
import Vuex from 'vuex';
import VuexPersistence from 'vuex-persist'

Vue.use(Vuex);
import state from './state';
import getters from './getters';
import mutations from './mutation';
import actions from './actions';

import download from './download/download-const.js';
import customer from './customer/customer-const';

import user from './user/user-const.js';
import product from './product/product-const.js';
import order from './order/order-const.js';
import blog from './blog/blog-const.js';

const vuexLocal = new VuexPersistence({
    key: 'MYAPP',
    storage: window.localStorage
})

const store = new Vuex.Store({
    getters,
    state,
    actions,
    mutations,
    namespaced: true,
    modules:{
        user,
        download,
        customer,
        blog,
        order,
        product
    },
    // plugins: [vuexLocal.plugin]
});




export default store;