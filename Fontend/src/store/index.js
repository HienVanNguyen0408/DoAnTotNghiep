import Vue from 'vue';
import Vuex from 'vuex';

import { auth } from './auth.module';

Vue.use(Vuex);

export default new Vuex.Store({
  plugins : [vuexPersist.plugin],
  modules: {
    auth
  }
});


export const vuexPersist = new VuexPersist({
  key: 'my-app',
  storage: window.localStorage
})