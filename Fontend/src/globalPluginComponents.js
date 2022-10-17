import Vue from 'vue';
//Layouts
import TheContent from '@/layouts/TheContent.vue';
Vue.component('dq-content',TheContent);
import TheHeader from '@/layouts/TheHeader.vue';
Vue.component('dq-header',TheHeader);
import TheNavbar from '@/layouts/TheNavbar.vue';
Vue.component('dq-navbar',TheNavbar);


//components
import Input  from '@/components/dq-input/DQ-Input';
Vue.component('dq-input',Input);

import InputFile  from '@/components/dq-input-file/DQ-InputFile';
Vue.component('dq-input-file',InputFile);

import InputDate from '@/components/dq-input-date/DQ-InputDate';
Vue.component('dq-input-date',InputDate);

import DateRange from '@/components/dq-date-range/DQDateRange.vue';
Vue.component('dq-date-range',DateRange);


import Radio from '@/components/dq-radio/DQ-Radio';
Vue.component('dq-radio',Radio);

import Checkbox  from '@/components/dq-checkbox/DQ-Checkbox';
Vue.component('dq-checkbox',Checkbox);

import Textarea from '@/components/dq-textarea/DQ-Textarea';
Vue.component('dq-textarea',Textarea);

import Combobox from '@/components/dq-combobox/DQ-Combobox';
Vue.component('dq-combobox',Combobox);

import Dropdown from '@/components/dq-dropdown/DQ-Dropdown';
Vue.component('dq-dropdown',Dropdown);

import Menu from '@/components/dq-menu/DQ-Menu';
Vue.component('dq-menu',Menu);

import Button from '@/components/dq-button/DQ-Button';
Vue.component('dq-button',Button);

import Popup from '@/components/dq-popup/DQ-Popup';
Vue.component('dq-popup',Popup);

import Grid from '@/components/dq-grid/DQ-Grid';
Vue.component('dq-grid',Grid);
import Tr from '@/components/dq-grid/DQ-Tr';
Vue.component('dq-tr',Tr);
import Th from '@/components/dq-grid/DQ-Th';
Vue.component('dq-th',Th);

import GridEdit from '@/components/dq-grid/DQ-Grid-Edit';
Vue.component('dq-grid-edit',GridEdit);
import TrEdit from '@/components/dq-grid/DQ-Tr-Edit';
Vue.component('dq-tr-edit',TrEdit);
import ThEdit from '@/components/dq-grid/DQ-Th-Edit';
Vue.component('dq-th-edit',ThEdit);

import Pagination from '@/components/dq-pagination/DQ-Pagination';
Vue.component('dq-pagination',Pagination);

//Chart
import BarChart from '@/components/dq-chart/DQ-BarChart';
Vue.component('dq-bar-chart',BarChart);

import LineChart from '@/components/dq-chart/DQ-LineChart';
Vue.component('dq-line-chart',LineChart);

import Doughnut from '@/components/dq-chart/DQ-DoughnutChart';
Vue.component('dq-doughnut-chart',Doughnut);


//fb login 
import FBLogin from '@/views/user/FacebookLogin';
Vue.component('dq-facebook-login',FBLogin);