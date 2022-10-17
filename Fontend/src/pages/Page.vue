<template>
    <div class="flex full-view">
        <div>
            <dq-navbar></dq-navbar>
        </div>
        <div class="content-page">
            <dq-header></dq-header>
            <dq-content></dq-content>
        </div>
    </div>
</template>

<script>
    export default {
        name : "Page",
        prop:{},
        computed:{},
        data(){
            return{

            }
        },
        method:{}
    }
</script>

<style scoped>
.full-view{
    width: 100%;
    height: 100vh;
}
.content-page{
    height:100vh;
    width : calc(100% - 240px);
    margin-left : 240px;
}
</style>