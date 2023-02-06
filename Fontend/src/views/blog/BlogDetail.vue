<template>
    <div class="blog-detail" v-if="Blog && Blog.id">
        <div>
            <div>
                <div class="blog-detail-view" v-if="Blog.files && Blog.files.length > 0">
                    <img :src="Blog.files[0].path" alt="">
                </div>
            </div>
            <div class="blog-title-info font-bold mt-6">{{  Blog.title }}</div>
            <div class="blog-summary mt-6">{{  Blog.summary }}</div>
            <div class="blog-contentInfo mt-6" v-html="Blog.content"></div>
            <div class="mt-6">
                <div v-if="Blog.files && Blog.files.length > 1">
                    <div v-for="(files,index) in Blog.files" :key="index" class="mt-6 flex justify-center">
                        <div v-if="index >= 1">
                            <img :src="files.path" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div v-else class="font-bold">Không có dữ liệu</div>
</template>

<script>
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleBlog, ModuleUser } from '@/store/module-const';
export default {
    name: "BlogDetailUser",
    data() {
        return {
        }
    },
    computed: {
        ...mapGetters(ModuleUser, [
            'User',
        ]),
        ...mapGetters(ModuleBlog, [
            'Blog',
        ]),
    },
    async created() {
        const me = this;
        if (!me.Blog || !me.Blog.id) {
            if (me.$route.query && me.$route.query.blog) {
                let payload = {
                    id: me.$route.query.blog
                };
                await me.getBlogAsync(payload);
            }
        }
        if (!me.Blog || !me.Blog.id) {
            me.$router.push({ path: 'blog' })
        }

        if (me.Blog && me.Blog.id) {
            me.initData();
        }
    },
    methods: {
        ...mapActions(ModuleBlog, [
            'getBlogAsync',
        ]),

        async initData() {
            const me = this;
        },
    }
}
</script>
<style scoped>
.blog-detail{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 90%;
    margin-left: 10%;
}
</style>