<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex-1">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterUsers">
                        </dq-input>
                    </div>
                </div>
                <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm loại sản phẩm'"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid dq-mgt-20">
            <dq-grid ref="gridProductCategory" :data="ProductCategories" :columns="columns" serial="true" checkbox="true"
                pagination="true" :dataPagination="params" :textPage="'Loại sản phẩm'" @dbclick="editDataProductCategory"
                @getData="getDataPagging" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProductCategory } from '@/store/module-const';
export default {
    name: "AdminProductCategory",
    components: {},
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
            selected: []
        }
    },
    computed: {
        ...mapGetters(ModuleProductCategory, [
            'ProductCategoryPage',
            'ProductCategories',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleProductCategory, [
            'getProductCategories',
            'getProductCategoryPageAsync',
            'getProductCategoryAsync',
            'insertProductCategoryAsync',
            'updateProductCategoryAsync',
            'deleteProductCategoryAsync',
            'deleteManyProductCategoryAsync'
        ]),

        initData() {
            const me = this;
            me.initDataStatic();
            me.loadDataProductCategorys();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Mã sản phẩm',
                    dataField: 'code',
                },
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
                },
                {
                    title: 'Giá bán',
                    dataField: 'sale_price',
                },
                {
                    title: 'Giá gốc',
                    dataField: 'original_price',
                },
                {
                    title: 'Mô tả',
                    dataField: 'description',
                },
            ]
        },

        async loadDataProductCategorys() {
            const me = this;
            let params = me.getPayload()
            await me.getProductCategoryPageAsync(params);
            if (me.ProductCategoryPage) {
                me.params.pageIndex = me.ProductCategoryPage.pageIndex;
                me.params.pageSize = me.ProductCategoryPage.pageSize;
                me.params.totalRecord = me.ProductCategoryPage.totalRecord;
                me.params.totalPages = me.ProductCategoryPage.totalPages;
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
            await me.getProductCategoryPageAsync(params);
        },

        /*
        *Hàm lọc danh sách
        */
        filterUsers: _.debounce(async function () {
            const me = this;
            await me.loadDataProductCategorys();
        }, 1000),
        /**
         * Xóa nhiều
         */
        async deleteManyProductCategory() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    productIds: me.selected.map(x => x.product_id)
                }
                let res = await me.deleteManyProductCategoryAsync(params);
                if (res) {
                    me.loadDataProductCategorys();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        editDataProductCategory() {
            const me = this;
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


    }
}
</script>

<style lang="scss" scoped>

</style>