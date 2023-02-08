<template>
    <div class="full-page-user">
        <dq-header></dq-header>
        <dq-content></dq-content>
        <dq-footer></dq-footer>
    </div>
</template>

<script>
import {
    mapGetters
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
export default {
    name: "Page",
    prop: {},
    computed: {
        ...mapGetters(ModuleUser, [
            'User'
        ])
    },
    created() {
        const me = this;
        let checkAdmin = me.User && me.User.id && me.User.role == me.$enum.Role.Admin;
        if (checkAdmin) {
            me.$router.push("/admin");
        }
    },
    data() {
        return {

        }
    },
    method: {}
}
</script>

<style scoped>
.ull-page-user {
    width: 100%;
    height: 100vh;
}
</style>