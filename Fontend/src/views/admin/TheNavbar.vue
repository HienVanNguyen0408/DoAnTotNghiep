<template>
    <div class="dq-admin-navbar">
        <div class="nav-header flex jus-center align-center font-bold text-upcase">
            {{ $t('i18nAdmin.ManageShop')}}
        </div>
        <div class="menus" v-if="menus && menus.length > 0">
            <div class="menu" v-for="(menu,index) in menus" :key="index" :class="menu.active ? 'menu-active' : ''" @click="menuChange(menu)">
                <div class="flex align-center w-100">
                    <div class="dq-mgr-10 icon-navbar" :class="menu.icon"></div>
                    <div class="text-navbar">{{ menu.text }}</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name:"AdminNavbar",
        data(){
            return{
                menus : [],
            }
        },
        created(){
            const me = this;
            me.initData();
        },
        methods:{
            initData(){
                const me = this;
                me.initDataStatic();
            },
            initDataStatic(){
                const me = this;
                me.menus = [
                    {
                        name : 'dashboard',
                        router : '/dashboard',
                        text : 'Tổng quan',
                        icon : 'icon-dashboard dq-icon-20',
                        active : true
                    },
                    {
                        name : 'user',
                        router : '/user',
                        text : 'Quản lý người dùng',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'product',
                        router : '/product',
                        text : 'Quản lý sản phẩm',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'order',
                        router : '/order',
                        text : 'Quản lý đơn hàng',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'blog',
                        router : '/blog',
                        text : 'Quản lý bài viết',
                        icon : 'icon-todolist dq-icon-20',
                    },
                ];
            }
        }
    }
</script>

<style lang="scss" scoped>
@import url('@/assets/contents/scss/views/admin/navbar.scss');
</style>