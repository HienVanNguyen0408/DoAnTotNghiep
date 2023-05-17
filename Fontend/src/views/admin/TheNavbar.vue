<template>
    <div class="dq-admin-navbar">
        <div class="nav-header flex jus-center align-center font-bold text-upcase">
            {{ $t('i18nAdmin.ManageShop')}}
        </div>
        <div class="menus" v-if="menus && menus.length > 0">
            <div class="menu" v-for="(menu,index) in menus" :key="index" :class="{'menu-active' : routerActive == menu.router}" @click="menuChange(menu)">
                <div class="flex align-center w-100">
                    <!-- <div class="dq-mgr-10 icon-navbar" :class="menu.icon"></div> -->
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
        computed:{
            routerActive(){
                const me = this;
                if(me.$route && me.$route.path) return me.$route.path;
                return '/admin';
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
                        text : `${me.$t('i18nAdmin.Dashboard')}`,
                        icon : 'icon-dashboard dq-icon-20'
                    },
                    {
                        name : 'adminuser',
                        router : '/admin',
                        text : `${me.$t('i18nAdmin.ManageUser')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminproductcategory',
                        router : '/admin-productcategory',
                        text : `${me.$t('i18nAdmin.ManageProductCategory')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminproduct',
                        router : '/admin-product',
                        text : `${me.$t('i18nAdmin.ManageProduct')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminorder',
                        router : '/admin-order',
                        text : `${me.$t('i18nAdmin.ManageOrder')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminblogcategory',
                        router : '/admin-blogcategory',
                        text : `${me.$t('i18nAdmin.ManageBlogCategory')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },
                    {
                        name : 'adminblog',
                        router : '/admin-blog',
                        text : `${me.$t('i18nAdmin.ManageBlog')}`,
                        icon : 'icon-todolist dq-icon-20',
                    },

                ];          
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
                me.$router.push(`${menu.router}`);
            }
        }
    }
</script>

<style scoped>
@import url('@/assets/contents/css/views/admin/navbar.css');
</style>