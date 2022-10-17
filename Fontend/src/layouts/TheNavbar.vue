<template>
    <div class="dq-navbar">
        <div class="nav-header flex jus-center align-center font-bold text-upcase">
            {{ $t('i18nToDoList.ManageToDoList')}}
        </div>
        <div class="menus dq-mgt-30" v-if="menus && menus.length > 0">
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
        name : "TheNavbar1",
        computed:{
        },
        data(){
            return{
                menus : [],
            }   
        },
        created() {
            const me = this;
            me.initDataStatic();
            me.initRouterDefault();
        },
        methods:{
            /**
            Hàm khởi tạo dữ liệu tĩnh
            */
            initDataStatic(){
                const me = this;
                me.menus = [
                    {
                        name : 'dashboard',
                        router : '/dashboard',
                        text : 'Tổng quan',
                        icon : 'icon-dashboard dq-icon-20',
                    },
                    {
                        name : 'todolist',
                        router : '/to-do-list',
                        text : 'Việc của tôi',
                        icon : 'icon-todolist dq-icon-20',
                        active : true
                    },
                ];
            },
            initRouterDefault(){
                const me = this;
                let routerDefault = "/to-do-list";
                // bắt đầu để màn mặc định
                if(me.$route && me.$route.path && me.$route.path == "/") me.$router.push(routerDefault);
            },
            /**
                Hàm sửa lý chuyển đổi navbar
            */
            menuChange(menu){
                const me = this;
                me.$router.push(menu.router);
                me.changeActiveNavbar(menu);
            },
            changeActiveNavbar(menu){
                const me = this;
                if(me.menus && me.menus.length > 0){
                    me.menus.forEach((x) => {
                        if(x.router == menu.router){
                            x.active = true;
                        }
                        else x.active = false;
                    });
                }
            }
        }
    }
</script>

<style scoped lang="scss">
@import "@/assets/contents/scss/layout/navbar/navbar.scss";
</style>