<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex-1">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterBlogs">
                        </dq-input>
                    </div>
                </div>
                <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm bài viết'" @click="addBlog"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridBlog" :data="Blogs" :columns="columns" serial="true" checkbox="true"
                pagination="true" :dataPagination="params" :textPage="'Bài viết'" @dbclick="editDataBlog"
                @getData="getDataPagging" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
        <BlogDetail :isShow="isShow" :blog="blog" :mode="mode" @closePopup="setStateDetail(false)"
            @showPopup="setStateDetail(true)" @resetData="resetDataDetail" @loadData="loadDataBlogs"/>
    </div>
</template>

<script>
import BlogDetail from './BlogDetail.vue';
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleBlog } from '@/store/module-const';
export default {
    name: "AdminBlog",
    components: {
        BlogDetail
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
            blog : {}
        }
    },
    computed: {
        ...mapGetters(ModuleBlog, [
            'BlogPage',
            'Blogs',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleBlog, [
            'getBlogs',
            'getBlogPageAsync',
            'getBlogAsync',
            'insertBlogAsync',
            'updateBlogAsync',
            'deleteBlogAsync',
            'deleteManyBlogAsync'
        ]),

        initData() {
            const me = this;
            me.initDataStatic();
            me.loadDataBlogs();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Tiêu đề bài viết',
                    dataField: 'title',
                },
                {
                    title: 'Tóm tắt bài viết',
                    dataField: 'summary',
                },
                {
                    title: 'Nội dung bài viết',
                    dataField: 'content',
                },
            ]
        },

        async loadDataBlogs() {
            const me = this;
            let params = me.getPayload()
            await me.getBlogPageAsync(params);
            if (me.BlogPage) {
                me.params.pageIndex = me.BlogPage.pageIndex;
                me.params.pageSize = me.BlogPage.pageSize;
                me.params.totalRecord = me.BlogPage.totalRecord;
                me.params.totalPages = me.BlogPage.totalPages;
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
            await me.getBlogPageAsync(params);
        },

        /*
        *Hàm lọc danh sách
        */
        filterBlogs: _.debounce(async function () {
            const me = this;
            await me.loadDataBlogs();
        }, 1000),
        /**
         * Xóa nhiều
         */
        async deleteManyBlog() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    orderIds: me.selected.map(x => x.order_id)
                }
                let res = await me.deleteManyBlogAsync(params);
                if (res) {
                    me.loadDataBlogs();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        editDataBlog() {
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
        addBlog(){
            const me = this;
            me.setStateDetail(true);
        },
        setStateDetail(isShow) {
            const me = this;
            me.isShow = isShow;
        },
        resetDataDetail(){
            const me = this;
            me.blog = {};
        }

    }
}
</script>

<style lang="scss" scoped>

</style>