<template>
    <div class="flex">
        <!-- <div class="w-20per p-5 bg-page">
            <BlogNew />
        </div> -->
        <div class="w-90 blogs bg-page ml-6">
            <BlogList />
        </div>
    </div>
</template>

<script>
import BlogNew from './BlogNew.vue'
import BlogList from '@/views/blog/BlogList.vue';
export default {
    name: "BlogPage",
    components: {
        BlogList,
        BlogNew
    }
}
</script>

<style scoped>
.w-20per {
    width: 20%;
}

.w-90 {
    width: 90%;
}

.blogs {
    margin-left: 5%;
}

.bg-page{
    border-radius: 10px;
    box-shadow: 0 0 30px #a19595;
}
</style>