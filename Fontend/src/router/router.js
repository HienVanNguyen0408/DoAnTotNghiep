import Vue from 'vue'
import VueRouter from 'vue-router'
// import Auth from '@/auth/auth';

import Page from '@/pages/Page.vue';
import Login from '@/views/user/Login.vue';
import Register from '@/views/user/Register.vue';

import Home from '@/views/home/Home.vue';
// Page Admin
import Admin from '@/views/admin/Admin.vue';
import ToDoList from '@/views/todolist/ToDoList.vue';
import Dashboard from '@/views/dashboard/Dashboard.vue';
import PaymentOrder from '@/views/payment/PaymentOrder.vue';
import CustomerAdmin from '@/views/customer/CustomerAdmin.vue';

Vue.use(VueRouter);

export const router = new VueRouter({
    mode: '',
    base: process.env.BASE_URL,
    scrollBehavior() {
        return { x: 0, y: 0 }
    },
    mode: 'history',
    routes: [
        {
            path: '/', 
            name: 'home',
            component: Page,
            children: [
                {
                    name: 'home',
                    path: '/',
                    component: Home,
                    props: true
                },
                {
                    name: 'todolist',
                    path: '/to-do-list',
                    component: ToDoList,
                    props: true
                },
                {
                    name: 'dashboard',
                    path: '/dashboard',
                    component: Dashboard,
                    props: true
                },
                {
                    name: 'customer',
                    path: '/customer',
                    component: CustomerAdmin,
                    props: true
                },
            ],
            props: true
        },
        {
            name: 'login',
            path: '/login',
            component: Login,
            props: true
        },
        {
            name: 'register',
            path: '/register',
            component: Register
        },
        {
            name: 'admin',
            path: '/admin',
            component: Admin,
            props: true
        },
    ]
});
// router.beforeEach((to, from, next) => {
//   const token =  Auth.getTokenStorage();
//   const user = Auth.getUserStorage();
//   if (!(token && user)) {
//     next({path: '/login'});
//   } else {
//     next();
//   }
// });