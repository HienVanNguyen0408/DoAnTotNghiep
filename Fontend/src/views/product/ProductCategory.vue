<template>
    <div>
        <div class="title-category font-bold">DANH MỤC SẢN PHÂM</div>
        <div>
            <div>Khoảng giá</div>
            <div></div>
            <dq-range-slider @changeValue="changeValueRange"></dq-range-slider>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ProductCategoryView",
        data(){
            return{ 
                valuePrice : 0
            }
        },
        methods:{
            changeValueRange(value){
                const me = this;
                debugger;
                me.valuePrice = value;
            }
        }
    }
</script>

<style scoped>
.title-category{
    font-size: 22px;
}
</style>