<template>
    <div class="dq-menu" :class="[horizontal ? 'flex' : '',cusMenu]">
        <div :class="[horizontal ? '' : 'dq-menu-ver']" v-for="item in data" :key="item[`${filed}`]" @click="clickItem(item)">
            {{ item[`${display}`] }}
        </div>
    </div>
</template>
<script>
    export default {
        props:{
            data : [],
            cusMenu:{
                default:"",
                typeof:String
            },
            display:{
                default:"",
                typeof:String
            },
            filed:{
                default:"",
                typeof:String
            },
            /**
                Menu nằm ngang hay không
             */
            horizontal : {
                default:false,
                typeof:Boolean
            },
        },
        methods:{
            clickItem(data){
                this.$emit("click",data);
            }
        }
    }
</script>

<style scoped>
.dq-menu-ver{
    padding: 10px 10px 10px 10px;
    border-bottom: 1px solid #ddd;
    cursor: pointer;
}
.dq-menu-ver:hover{
    background-color: #33abe5;
    color: #ffffff;
}
</style>