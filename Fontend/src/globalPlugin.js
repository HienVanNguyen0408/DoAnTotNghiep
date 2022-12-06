import Vue from 'vue';
import moment from 'vue-moment'

import commonFunc from './common/commonFunc';
import DateRange from '@/utils/dateRange'
import Enum from '@/enum/enum';
import Auth from './auth/auth';

const install = Vue => {
    //prototype
    Vue.prototype.moment = moment
    Vue.prototype.$commonFunc = commonFunc;
    Vue.prototype.$dateRange = DateRange;
    Vue.prototype.$enum = Enum;
    Vue.prototype.$auth = Auth;
};

install(Vue);
export default install;
