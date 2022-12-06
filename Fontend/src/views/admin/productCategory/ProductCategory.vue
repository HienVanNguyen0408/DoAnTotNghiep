<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex flex-1 align-center">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterUsers">
                        </dq-input>
                    </div>
                    <div class="ml-2.5 " v-if="selected && selected.length > 0">
                        <div class="icon icon-delete dq-icon-24 cursor-pointer"></div>
                    </div>
                </div>
                <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm loại sản phẩm'" @click="addProductCategory"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridProductCategory" :data="ProductCategories" :columns="columns" serial="true"
                checkbox="true" pagination="true" :dataPagination="params" :textPage="'Loại sản phẩm'"
                @dbclick="editDataProductCategory" @getData="getDataPagging" @checkboxOne="checkboxOne"
                @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
        <ProductCategoryDetail :isShow="isShow" :productCategory="productCategory" :mode="mode"
            @closePopup="setStateDetail(false)" @showPopup="setStateDetail(true)" @loadData="loadDataProductCategorys"
            @resetData="resetDataDetail" />
    </div>
</template>

<script>
import ProductCategoryDetail from './ProductCategoryDetail.vue';
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProduct } from '@/store/module-const';
export default {
    name: "AdminProductCategory",
    components: {
        ProductCategoryDetail
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
            productCategory: {}
        }
    },
    computed: {
        ...mapGetters(ModuleProduct, [
            'ProductCategoryPage',
            'ProductCategories',
            'CategoryTotalPage',
            'CategoryTotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleProduct, [
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
                    title: 'Tên loại sản phẩm',
                    dataField: 'name',
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

        editDataProductCategory(item) {
            const me = this;
            me.setStateDetail(true);
            me.mode = me.$enum.Mode.Edit;
            me.productCategory = {...item};
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
        addProductCategory() {
            const me = this;
            me.setStateDetail(true);

        },
        setStateDetail(isShow) {
            const me = this;
            me.isShow = isShow;
        },
        resetDataDetail() {
            const me = this;
            me.productCategory = {};
        }
    }
}
</script>

<style lang="scss" scoped>

</style>