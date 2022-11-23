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
                        name : 'adminuser',
                        router : '/admin-user',
                        text : 'Quản lý người dùng',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminproduct',
                        router : '/admin-product',
                        text : 'Quản lý sản phẩm',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminorder',
                        router : '/admin-order',
                        text : 'Quản lý đơn hàng',
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminblog',
                        router : '/admin-blog',
                        text : 'Quản lý bài viết',
                        icon : 'icon-todolist dq-icon-20',
                    },
                ];

                me.$router.push(`${me.menus[0].router}`);
            },
            
            setActiveMenu(menu){
                const me = this;
                me.menus.forEach(item => {
                    if(item.router == menu.router) item.active = true;
                    else item.active = false;
                });
            },
            menuChange(menu){
                const me = this;
                me.setActiveMenu(menu);
                me.$router.push(`${menu.router}`);
            }
        }
    }
</script>

<style lang="scss" scoped>
@import url('@/assets/contents/scss/views/admin/navbar.scss');
</style>