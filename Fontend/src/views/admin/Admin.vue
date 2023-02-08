<template>
    <div class="dq-admin">
        <div class="flex">
            <div class="admin-navbar">
                <TheNavbar />
            </div>
            <div class="admin-right">
                <div class="admin-header">
                    <TheHeader />
                </div>
                <div class="admin-content">
                    <TheContent />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
import TheNavbar from './TheNavbar.vue'
import TheHeader from './TheHeader.vue'
import TheContent from './TheContent.vue'
export default {
    name: "Admin",
    components: {
        TheNavbar,
        TheHeader,
        TheContent
    },
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
        let checkAdmin = me.User && me.User.id && me.User.role == me.$enum.Role.Admin;
        if(!checkAdmin){
            me.$router.push("/");
        }
    },
    methods: {

    }
}
</script>
<style scoped>
@import url('@/assets/contents/css/views/admin/admin.css');
</style>