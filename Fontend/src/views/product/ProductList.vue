<template>
    <div v-if="Products && Products.length > 0" class="products">
        <div class="flex title-product-list relative container-fluid">
            <div class="flex justify-start font-bold productlist-title">QUẦN ÁO VHSTORE</div>
        </div>
        <div class="product-filter">
        </div>
        <div class="flex flex-wrap">
            <div class="product w-1/4" v-for="(product, index) in Products" :key="index">
                <Product :product="product"/>
            </div>
        </div>
        <div class="product-page">
            <dq-pagination ref="pagination" :totalRecord="params.totalRecord"
                :pageSize="params.pageSize" :totalPages="params.totalPages"
                :pageIndex="params.pageIndex" :filter="params.filter" :textTotal="'Sản phẩm'"
                @getData="getDataProduct">
            </dq-pagination>
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProduct } from '@/store/module-const';
import Product from './Product.vue';
export default {
    name: "ProductList",
    components: {
        Product
    },
    props: {

    },
    computed: {
        ...mapGetters(ModuleProduct, [
            'ProductPage',
            'Products',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    data() {
        return {
            params: {
                pageSize: 8,
                pageIndex: 1,
                filter: "",
                totalPages: 0
            },
        }
    },
    created(){
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleProduct, [
            'getUsers',
            'getProductPageAsync',
        ]),

        async initData() {
            const me = this;
            me.initDataStatic();
            await me.loadDataProducts();
        },
        initDataStatic(){
            const me = this;
        },
        async loadDataProducts() {
            const me = this;
            let params = me.getPayload()
            await me.getProductPageAsync(params);
            if (me.ProductPage) {
                me.params.pageIndex = me.ProductPage.pageIndex;
                me.params.pageSize = me.ProductPage.pageSize;
                me.params.totalRecord = me.ProductPage.totalRecord;
                me.params.totalPages = me.ProductPage.totalPages;
            }
        },
        
        async getDataProduct(params){
            const me = this;
            let payload = {
                pageIndex : params.pageIndex,
                pageSize : params.pageSize,
                filter : params.filter
            }
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            await me.getProductPageAsync(payload);
        },

        getPayload() {
            const me = this;
            return {
                PageIndex: me.params.pageIndex,
                PageSize: me.params.pageSize,
                Filter: me.params.filter
            };
        },
        getDataPagging: _.debounce(async function () {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getProductPageAsync(params);
        }, 300),
    }
}
</script>

<style scoped>
.products{
    width: 90%;
    margin-left: 5%;
}
.productlist-title{
    font-size: 24px;
}

.title-product-list::after{
    position: absolute;
    content: "";
    width: 100%;
    height: 0;
    top: 50%;
    left: 0;
    border-top: 1px dashed #bec5cb;
    z-index: -1;
}
</style>