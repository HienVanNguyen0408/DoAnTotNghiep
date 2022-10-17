<template>
    <div>
        <div class="pagination flex" style="display:flex;">
            
            <div class="h-text-pagination" v-show="totalPages != undefined && totalPages != 0">Tổng số : <span style="font-weight:bold;margin-left:10px">  {{ totalRecord }}  </span>  <span style="margin-left:10px">{{ textTotal }}</span>   </div>
                    <div class="h-text-pagination" v-show="totalPages == undefined || totalPages == 0">Tổng số : <span style="font-weight:bold;margin-left:10px">  0  
                        </span>   <span style="margin-left:10px">{{ textTotal }}</span> </div>
                    <div class="right" style="position:relative;width:80%">
                        <div class="page-numbers">
                            <a-pagination size="small" @change="handelChangePageIndex" :showLessItems="true" :pageSize="pageSize" :total="totalRecord" :item-render="itemRender" :placeholder="'Số bản ghi trên 1 trang'" v-model="getPage"/>
                    </div>
            </div>
        </div>
    </div>
</template>

<script>
// import ComboboxAuto from '../combobox/ComboboxAuto.vue'
    export default {
        components:{
            // ComboboxAuto
        },
        props:{
            /**
             * Kích thước trang : số bản ghi trên 1 trang
             */
            pageSize : {
                typeof : Number,
                default : 0
            },
            /**
             * Trang hiện tại
             */
            pageIndex : {
                typeof : Number,
                default : 0
            },
            /**
             * Tổng số trang
             */
            totalPages : {
                typeof : Number,
                default : 0
            },
            /**
             * Tổng số bản ghi
             */
            totalRecord : {
                typeof : Number,
                default : 0
            },
            filter : {
                typeof : String,
                default : ""
            },
            textTotal :{
                typeof: String,
                default:"bản ghi"
            }
        },
        computed:{
            getPage :{
                get(){
                    return this.pageIndexD
                },
                set(val){
                    this.pageIndexD = val
                }      
            },
        },
        data(){
            return{
                pageSizes : [10,20,50,100],
                pageIndexD : this.pageIndex,
            }
        },
        methods:{
            itemRender(current, type, originalElement) {
                if (type === 'prev') {
                    return <a>Trước</a>;
                } else if (type === 'next') {
                    return <a>Sau</a>;
                }
                return originalElement;
            },
            handelChangePageIndex(){
                let params = {
                    pageIndex : this.pageIndexD,
                    pageSize : this.pageSize,
                    filter : this.filter
                };
                this.$emit('getData',params);
            },
            setVModel(vModel){
                this.$emit("setPageSize",vModel)
               
            }
        },
        
    }
</script>

<style sscoped>
.pagination{
    display: flex;
    height: 40px;
    align-items: center;
    position: relative;
}
.pagination .h-text-pagination{
    margin-left: 20px;
    position: absolute;
    left: 10px;
    width: 300px;
    justify-content: left !important;
}
.pagination .right{
    display: flex;
}
.pagination .right .page-numbers{
    display: flex;
    align-items: center;
    position: absolute;
    right: 50px;
}
.page-numbers ul{
    display: flex !important;
}
.pagination .page-numbers .page-prev{
    margin-right: 10px;
}
.right .page-numbers .page-number{
    margin-right: 10px;
}
.pagination .page-numbers .page-next{
    margin-right: 10px;
    margin-top: -3px;
}
.h-combobox{
    position: absolute;
    left: 300px;
}

.ant-pagination-disabled a{
    margin-right: 10px !important;
}
.ant-pagination-prev{
    margin-right: 10px !important;
}
.ant-pagination.mini .ant-pagination-item {
    margin-right: 10px !important;
    color: #111 !important;
    cursor: pointer!important;
}
.ant-pagination-item a{
    color: #111 !important;
    font-weight: 400 !important;
    font-size: 12px !important;
}
.ant-pagination-item a:hover{
    color: #e5e5e5 !important;
}
.ant-pagination-item-active:focus a, .ant-pagination-item-active:hover a{
    color: #111 !important;
}
.ant-pagination-item-active{
    border: 1px solid #e0e0e0 !important;
}
.ant-pagination-item-active a {
    color: #111 !important;
    font-weight: 700 !important;
}
.ant-pagination-jump-prev .ant-pagination-item-container .ant-pagination-item-ellipsis, .ant-pagination-jump-next .ant-pagination-item-container .ant-pagination-item-ellipsis{
    color: #111 !important;
    font-size: 11px !important;
    opacity: 0.6 !important;
}
.ant-pagination-disabled:hover{
    cursor: auto !important;
}
.ant-pagination-disabled a{
    cursor: auto !important;
}
.ant-pagination-disabled a:hover{
    cursor: auto !important;
}

.pagination a:hover{
    background: #e5e5e5 !important;
    color: #111 !important;
}
</style>