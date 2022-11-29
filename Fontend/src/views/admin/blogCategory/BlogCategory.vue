<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex flex-1">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterBlogCategories">
                        </dq-input>
                    </div>
                    <div class="ml-2.5" v-if="selected && selected.length > 0"  @click="deleteBlogCategory">
                        <div class="icon icon-delete dq-icon-24"></div>
                    </div>
                </div>
                <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm loại bài viết'" @click="addBlogCategory"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridBlogCategory" :data="BlogCategories" :columns="columns" serial="true" checkbox="true"
                pagination="true" :dataPagination="params" :textPage="'Loại bài viết'" @dbclick="editDataBlogCategory"
                @getData="getDataPagging" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
        <BlogCategoryDetail :isShow="isShow" :blogCategory="blogCategory" :mode="mode" @closePopup="setStateDetail(false)"
            @showPopup="setStateDetail(true)" @loadData="loadDataBlogCategories"
            @resetData="resetDataDetail"/>
    </div>
</template>

<script>
import BlogCategoryDetail from './BlogCategoryDetail.vue';
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleBlog } from '@/store/module-const';
export default {
    name: "AdminBlogCategory",
    components: {
        BlogCategoryDetail
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
            blogCategory: {}
        }
    },
    computed: {
        ...mapGetters(ModuleBlog, [
            'BlogCategoryPage',
            'BlogCategories',
            'CategoryTotalPage',
            'CategoryTotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleBlog, [
            'getBlogCategories',
            'getBlogCategoryPageAsync',
            'getBlogCategoryAsync',
            'insertBlogCategoryAsync',
            'updateBlogCategoryAsync',
            'deleteBlogCategoryAsync',
            'deleteManyBlogCategoryAsync'
        ]),

        initData() {
            const me = this;
            me.initDataStatic();
            me.loadDataBlogCategories();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Tên loại bài viết',
                    dataField: 'name',
                },
                {
                    title: 'Mô tả',
                    dataField: 'description',
                },
            ]
        },

        async loadDataBlogCategories() {
            const me = this;
            let params = me.getPayload()
            await me.getBlogCategoryPageAsync(params);
            if (me.BlogCategoryPage) {
                me.params.pageIndex = me.BlogCategoryPage.pageIndex;
                me.params.pageSize = me.BlogCategoryPage.pageSize;
                me.params.totalRecord = me.BlogCategoryPage.totalRecord;
                me.params.totalPages = me.BlogCategoryPage.totalPages;
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
            await me.getBlogCategoryPageAsync(params);
        },

        /*
        *Hàm lọc danh sách
        */
        filterBlogCategories: _.debounce(async function () {
            const me = this;
            await me.loadDataBlogCategories();
        }, 1000),
        /**
         * Xóa nhiều
         */
        async deleteManyBlogCategory() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    blogIds: me.selected.map(x => x.blog_id)
                }
                let res = await me.deleteManyBlogCategoryAsync(params);
                if (res) {
                    me.loadDataBlogCategories();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        editDataBlogCategory() {
            const me = this;
        },

        async deleteBlogCategory(){
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
        addBlogCategory(){
            const me = this;
            me.setStateDetail(true);

        },
        setStateDetail(isShow){
            const me = this;
            me.isShow = isShow;
        },
        resetDataDetail(){
            const me = this;
            me.blogCategory = {};
        }
    }
}
</script>

<style lang="scss" scoped>

</style>