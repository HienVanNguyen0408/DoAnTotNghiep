<template>
    <div v-if="Products && Products.length > 0">
        <div class="flex justify-center font-bold productlist-title">QUẦN ÁO VHSTORE</div>
        <div class="product-filter">
        </div>
        <div class="products flex flex-wrap">
            <div class="product w-1/5" v-for="(product, index) in Products" :key="index">
                <Product :product="product"/>
            </div>
        </div>
        <div class="product-page">
            <dq-pagination ref="pagination" :totalRecord="params.totalRecord"
                :pageSize="params.pageSize" :totalPages="params.totalPages"
                :pageIndex="params.pageIndex" :filter="params.filter" :textTotal="'Sản phẩm'">
            </dq-pagination>
        </div>
    </div>
    <div v-else class="w-96">
        <div class="flex justify-center font-bold productlist-title">QUẦN ÁO VHSTORE</div>
        <div class="flex justify-center mt-10">Chưa có dữ liệu</div>
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
                pageSize: 20,
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
.productlist-title{
    font-size: 24px;
}
</style>