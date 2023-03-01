import Vue from 'vue'
import VueRouter from 'vue-router'
// import Auth from '@/auth/auth';

import Page from '@/pages/Page.vue';
import Home from '@/views/home/Home.vue';
import ProductPage from '@/views/product/ProductPage.vue';
import ProductDetail from '@/views/product/ProductDetail.vue';
import BlogList from '@/views/blog/BlogList.vue';
import BlogDetail from '@/views/blog/BlogDetail.vue';
import Cart from '@/views/cart/Cart.vue';
import CartPay from '@/views/cart/CartPay.vue';
import Order from '@/views/cart/Order.vue';
import AddressInfos from '@/views/cart/AddressInfos.vue';
import Policy from '@/views/policy/Policy.vue';


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
                    component: ProductPage,
                    props:true
                },
                {
                    name: 'blog',
                    path: '/blog',
                    component: BlogList,
                    props:true
                },
                {
                    name: 'productdetail',
                    path: '/product-detail',
                    component: ProductDetail,
                    props:true
                },
                {
                    name: 'blogdetail',
                    path: '/blog-detail',
                    component: BlogDetail,
                    props:true
                },
                {
                    name: 'cart',
                    path: '/cart',
                    component: Cart,
                    props:true
                },
                {
                    name: 'cartpay',
                    path: '/cartpay',
                    component: CartPay,
                    props:true
                },
                {
                    name: 'order',
                    path: '/order',
                    component: Order,
                    props:true
                },
                {
                    name: 'address',
                    path: '/address-info',
                    component: AddressInfos,
                    props:true
                },
                {
                    name: 'policy',
                    path: '/policy',
                    component: Policy,
                    props:true
                },
            ],
            props: true
        },
        {
            name: 'admin',
            path: '/admin',
            component: Admin,
            props: true,
            children: [
                {
                    name: 'adminuser',
                    path: '/admin',
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