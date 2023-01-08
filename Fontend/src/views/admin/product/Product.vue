<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex flex-1">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterUsers">
                        </dq-input>
                    </div>
                    <div class="ml-2.5" v-if="selected && selected.length > 0">
                        <div class="icon icon-delete dq-icon-24"></div>
                    </div>
                </div>
                <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm sản phẩm'" @click="addProduct"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridProduct" :data="Products" :columns="columns" serial="true" checkbox="true"
                pagination="true" :dataPagination="params" :textPage="'Sản phẩm'" @dbclick="editDataProduct"
                @getData="getDataPagging" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti" @updateProduct="updateProduct">
            </dq-grid>
        </div>
        <ProductDetail :isShow="isShow" :product="product" :mode="mode" @closePopup="setStateDetail(false)"
            @showPopup="setStateDetail(true)" @resetData="resetDataDetail" @loadData="loadDataProducts" @updateProduct="updateProduct"/>
    </div>
</template>

<script>
import ProductDetail from './ProductDetail.vue';
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProduct } from '@/store/module-const';
export default {
    name: "AdminProduct",
    components: {
        ProductDetail
    },
    props: {},
    data() {
        return {
            params: {
                fromDate: this.$dateRange.getDateDefault(),
                toDate: this.$dateRange.getDateDefault(),
                pageSize: 20,
                pageIndex: 1,
                filter: "",
                totalPages: 0
            },
            columns: [],
            isShow: false,
            mode: this.$enum.Mode.Add,
            selected: [],
            product : {}
        }
    },
    computed: {
        ...mapGetters(ModuleProduct, [
            'ProductPage',
            'Products',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleProduct, [
            'getUsers',
            'getProductPageAdminAsync',
            'getProductAsync',
            'insertProductAsync',
            'updateProductAsync',
            'deleteProductAsync',
            'deleteProductsAsync'
        ]),

        async initData() {
            const me = this;
            me.initDataStatic();
            await me.loadDataProducts();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                // {
                //     title: 'Mã sản phẩm',
                //     dataField: 'code',
                // },
                {
                    title: 'Tên sản phẩm',
                    dataField: 'product_name',
                },
                {
                    title: 'Đơn vị tính',
                    dataField: 'unit_name',
                },
                {
                    title: 'Số lượng',
                    dataField: 'quantity',
                },
                {
                    title: 'Số lượng đã bán',
                    dataField: 'quantity_sold',
                },
                {
                    title: 'Giá gốc',
                    dataField: 'original_price',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Giá bán',
                    dataField: 'sale_price',
                    format: me.$enum.Format.Money
                },
                // {
                //     title: 'Mô tả',
                //     dataField: 'description',
                //     class : 'text-ellipsis whitespace-nowrap overflow-hidden'
                // },
            ]
        },

        async loadDataProducts() {
            const me = this;
            let params = me.getPayload()
            await me.getProductPageAdminAsync(params);
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
        async getDataPagging(params) {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getProductPageAdminAsync(params);
        },

        /*
        *Hàm lọc danh sách
        */
        filterUsers: _.debounce(async function () {
            const me = this;
            await me.loadDataProducts();
        }, 1000),
        /**
         * Xóa nhiều
         */
        async deleteManyProduct() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    productIds: me.selected.map(x => x.product_id)
                }
                let res = await me.deleteManyProductAsync(params);
                if (res) {
                    await me.loadDataProducts();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        async editDataProduct(item) {
            const me = this;
            if(!item) return;
            let payload = {
                productId : item.id
            };
            let productDb = await me.getProductAsync(payload);
            if(productDb){
                me.setStateDetail(true);
                me.mode = me.$enum.Mode.Edit;
                me.product = {...productDb};
            }
        },

        /**
        * Check row grid
        */
        checkboxOne(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },

        /**
         * Check all data in grid
         * @param {*} selecteds 
         */
        checkboxMulti(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },

        addProduct(){
            const me = this;
            me.setStateDetail(true);
        },
        setStateDetail(isShow) {
            const me = this;
            me.isShow = isShow;
        },
        resetDataDetail(){
            const me = this;
            me.product = {};
        },

        updateProduct(data){
            const me = this;
            me.product = data;
        },

        async deleteProduct(){
            const me = this;
            await me.deleteManyProductAsync(me.selected);
        }, 
        
       


    }
}
</script>

<style scoped>

</style>