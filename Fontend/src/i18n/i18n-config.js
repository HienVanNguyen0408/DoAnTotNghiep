import Vue from 'vue';
import VueI18n from 'vue-i18n'
import i18nData from '@/i18n/i18n-data'

Vue.use(VueI18n);

export default new VueI18n({
    locale: 'vi', // set locale
    messages : i18nData
});
