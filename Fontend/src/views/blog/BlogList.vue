<template>
    <div v-if="Blogs && Blogs.length > 0" class="blog-list">
        <div class="flex justify-center blog-title font-bold mt-5">VHSTORE BLOG</div>
        <div class="blogs flex flex-wrap">
            <div class="blog w-23per ml-2per mt-8" v-for="(blog, index) in Blogs" :key="index">
                <Blog :blog="blog"/>
            </div>
        </div>
        <div class="blog-page mb-5">
            <dq-pagination ref="pagination" :totalRecord="params.totalRecord"
                :pageSize="params.pageSize" :totalPages="params.totalPages"
                :pageIndex="params.pageIndex" :filter="params.filter" :textTotal="'Bài viết'">
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
import { ModuleBlog } from '@/store/module-const';
import Blog from './Blog.vue';
export default {
    name: "BlogList",
    components: {
        Blog
    },
    props: {

    },
    computed: {
        ...mapGetters(ModuleBlog, [
            'BlogPage',
            'Blogs',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    data() {
        return {
            params: {
                pageSize: 10,
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
        ...mapActions(ModuleBlog, [
            'getBlogPageAsync',
        ]),

        async initData() {
            const me = this;
            me.initDataStatic();
            await me.loadDataBlogs();
        },
        initDataStatic(){
            const me = this;
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
        getDataPagging: _.debounce(async function () {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getBlogPageAsync(params);
        }, 300),
    }
}
</script>

<style scoped>
.ml-2per{
    margin-left: 1%;
    margin-right: 1%;
}
.w-23per{
    width: 23%;
}
.blog-list{
    width: 90%;
    margin-left: 5%;
}
.w-30per{
    width: 30% !important;
}
.blogs .blog{
}
.blog-title{
    font-size: 24px;
}
.blog-page{
    height: 80px;
    margin-top: 30px
}
</style>