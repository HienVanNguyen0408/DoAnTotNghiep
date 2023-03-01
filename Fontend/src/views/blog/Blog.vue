<template>
    <div class="blog-view p-3 w-full">
        <div @click="viewDetailBlog(blog.id)" class="cursor-pointer">
            <div class="flex justify-center align-center" v-if="blog && blog.files && blog.files.length > 0">
                <div class="image-blog-view flex items-center cursor-pointer" @mouseover="hoverImageView">
                    <img class="image-blog image-transition" :src="blog.files[indexBlogView].path" />
                </div>
            </div>
            <div class="content-info mt-3">
                <div class="font-bold blog-title flex justify-center align-center">{{ blog.title }}</div>
                <div class="mt-4 flex justify-center" v-html="blog.summary"></div>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions
} from 'vuex';
import { ModuleBlog } from '@/store/module-const';
export default {
    name: "BlogUser",
    props: {
        blog: {}
    },
    data() {
        return {
            indexBlogView: 0,
            indexBlogViewPrev: 0
        }
    },
    created() {
        const me = this;

    },
    methods: {
        ...mapActions(ModuleBlog, [
            'getBlogAsync',
        ]),
        changeImageView(index) {
            const me = this;
            me.indexBlogView = index;
        },
        hoverImageView() {
            const me = this;
            me.indexBlogViewPrev = me.indexBlogView;
            me.indexBlogView = Math.floor(Math.random() * me.blog.files.length);
        },

        /**
         * Xem thông tin chi tiết của sản phẩm
         */
        async viewDetailBlog(id) {
            const me = this;
            let payload = {
                id: id
            };
            await me.getBlogAsync(payload);
            this.$router.push({ path: 'blog-detail', query: { blog: id } })
        }
    }
}
</script>

<style scoped>

.blog-view{
    /* border: 1px solid; */
    padding: 20px;
    min-height: 550px;
}
.image-blog{
    width: 80%;
    margin-left: 10%;
    height: 300px;
}
.blog-title{
    min-height: 50px;
}
.price-sale {
    color: #f94c43;
}

.content-info {
    /* height: 80px;
    overflow: hidden;
    text-overflow: ellipsis; */
}

/* .image-blog-view {
    height: 250px;
    width: 250px;
} */
</style>