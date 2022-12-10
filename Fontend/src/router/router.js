import Vue from 'vue'
import VueRouter from 'vue-router'
// import Auth from '@/auth/auth';

import Page from '@/pages/Page.vue';
import Login from '@/views/user/Login.vue';
import Home from '@/views/home/Home.vue';
import ProductList from '@/views/product/ProductList.vue';



import Admin from '@/views/admin/Admin.vue';
import AdminUser from '@/views/admin/user/User.vue';
import AdminProduct from '@/views/admin/product/Product.vue';
import AdminProductCategory from '@/views/admin/productCategory/ProductCategory.vue';
import AdminBlog from '@/views/admin/blog/Blog.vue';
import AdminBlogCategory from '@/views/admin/blogCategory/BlogCategory.vue';

import AdminOrder from '@/views/admin/order/Order.vue';


import Dashboard from '@/views/admin/dashboard/Dashboard.vue';

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
                    name: 'product',
                    path: '/product',
                    component: ProductList,
                    props:true
                }
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
            name: 'admin',
            path: '/admin',
            component: Admin,
            props: true,
            children: [
                {
                    name: 'dashboard',
                    path: '/dashboard',
                    component: Dashboard,
                    props: true
                },
                {
                    name: 'adminuser',
                    path: '/admin-user',
                    component: AdminUser,
                    props: true
                },
                {
                    name: 'adminblogcategory',
                    path: '/admin-blogcategory',
                    component: AdminBlogCategory,
                    props: true
                },
                {
                    name: 'adminblog',
                    path: '/admin-blog',
                    component: AdminBlog,
                    props: true
                },
                {
                    name: 'adminproductcategory',
                    path: '/admin-productcategory',
                    component: AdminProductCategory,
                    props: true
                },
                {
                    name: 'adminproduct',
                    path: '/admin-product',
                    component: AdminProduct,
                    props: true
                },
                {
                    name: 'adminOrder',
                    path: '/admin-order',
                    component: AdminOrder,
                    props: true
                },
            ]
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