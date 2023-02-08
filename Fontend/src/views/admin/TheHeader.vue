<template>
    <div class="dq-admin-header">
        <div class="flex justify-between p-6">
            <div></div>
            <div class="flex">
                <div>Xin chào <span class="ml-2 font-bold">{{ User.user_name }}</span></div>
                <div class="ml-5 text-logout" v-if="User.user_name" @click="logout">Đăng xuất</div>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions,
    mapGetters,
    mapMutations
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
export default {
    name: "AdminHeader",
    data() {
        return {

        }
    },
    computed: {
        ...mapGetters(ModuleUser, [
            'User'
        ])
    },
    created() {
        const me = this;
    },
    methods: {
        ...mapMutations(ModuleUser, [
            'updateUserLogin'
        ]),
        logout() {
            const me = this;
            me.$auth.logout();
            me.updateUserLogin({});
            me.$router.push("/");
        }
    }
}
</script>

<style scoped>
@import url('@/assets/contents/css/views/admin/header.css');

.dq-admin-header {
    color: #000;
}

.text-logout {
    color: #00aab7;
    cursor: pointer;
}

.text-logout:hover {
    color: #1dcddb;
}
</style>