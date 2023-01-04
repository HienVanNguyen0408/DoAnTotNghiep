<template>
    <div class="dq-admin">
        <div class="flex">
            <div class="admin-navbar">
                <TheNavbar/>
            </div>
            <div class="admin-right">
                <div class="admin-header">
                    <TheHeader/>
                </div>
                <div class="admin-content">
                    <TheContent/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import TheNavbar from './TheNavbar.vue'
    import TheHeader from './TheHeader.vue'
    import TheContent from './TheContent.vue'
    export default {
        name: "Admin",
        components:{
            TheNavbar,
            TheHeader,
            TheContent
        },
        data(){
            return{

            }
        },
        created(){

        },
        methods:{

        }
    }
</script>
<style scoped>
@import url('@/assets/contents/css/views/admin/admin.css');
</style>