<template>
<div>
    <div class="sb-topnav navbar navbar-expand navbar-dark bg-dark h-navbar-top">
        <form class="
          d-none d-md-inline-block
          form-inline
          ms-auto
          me-0 me-md-3
          my-2 my-md-0
        ">
        </form>
        <div class="flex text-statistic">
            <ul class="flex h-user" v-if="userName">
                <li class="text-login">Xin chào!   <span style="font-weight:bold;margin-left:20px">{{ userName }}</span></li>
                <li class="text-logout"><div @click="logOut" title="">Đăng xuất</div></li>
            </ul>
        </div>
    </div>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav" class="w-250px">
            <div class="sb-sidenav accordion dq-nav-admin" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav" >
                        <div class="sb-sidenav-menu-heading" style="color:yellow">DANH SÁCH QUẢN LÝ</div>
                        <router-link :to="sidebar.route" class="nav-link" v-for="(sidebar,index) in sidebars" :key="index">
                            <div class="sb-nav-link-icon"><i class="fa fa-table"></i></div>
                            {{sidebar.text }}
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <router-view></router-view>
    </div>
</div>
</template>

<script>
import {
    mapActions, 
} from 'vuex';
import {ModuleUser} from '@/store/module-const';
export default {
    components:{
    },
    data(){
        return {
            userName : "",
            isShow : false,
            sidebars : []
        }
    },
    async created() {
        const me = this;
        me.initData();
        let user = me.$auth.getUserStorage();
        if(user){
            me.userName = user.userName;
            if(user.role != me.$enum.Role.Admin){
                me.logOut();
            }
        }
    },
    methods:{
         ...mapActions(ModuleUser, ["getUserByUserName"]),
        initData(){
            const me = this;
            me.sidebars = [
                {
                    text : "Quản lý người dùng",
                    route : "/admin-user"
                },
                {
                    text : "Quản lý bài thi",
                    route : "/admin-exam"
                },
                {
                    text : "Quản lý ngân hàng câu hỏi",
                    route : "/admin-question"
                },
                {
                    text : "Quản lý trình độ câu hỏi",
                    route : "/admin-level-question"
                },
                {
                    text : "Quản lý loại câu hỏi",
                    route : "/admin-type-question"
                },
            ];
        },
        logOut(){
            const me = this;
            me.$auth.logout();
            me.$router.push("/login")
        },
        // trạng thái của popup thống kê
        setStatePopup(isShow){
            this.isShow = isShow;
        }
    }
};
</script>
<style scoped>
.dq-nav-admin{
    background-color: #212121;
    color: red !important;
}
#layoutSidenav_nav {
    max-height: calc(100vh - 56px);
    min-height: calc(100vh - 56px);
}
.h-user{
    color : #fff;
    padding-right:20px ;
}
.text-login{
    padding-right:10px;
    border-right: 1px solid #fff;
}
.text-logout{
    margin-left: 10px;
    cursor: pointer;
}
.text-logout:hover{
    color: orange;
}

.text-statistic{
    color: #fff;
    cursor: pointer;
}
.text-statistic:focus,.text-statistic:active{
    color: orange;
}
.hide {
    visibility: hidden !important;
}
</style>
