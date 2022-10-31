import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
import state from './state';
import getters from './getters';
import mutations from './mutation';
import actions from './actions';

import user from './user/user-const.js';
import download from './download/download-const.js';
import work from './work/const-work';
import customer from './customer/customer-const';
const store = new Vuex.Store({
    getters,
    state,
    actions,
    mutations,
    namespaced: true,
    modules:{
        user,
        download,
        work,
        customer
    }
});

export default store;