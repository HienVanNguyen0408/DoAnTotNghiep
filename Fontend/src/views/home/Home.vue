<template>
  <div class="">
      <ProductList />
      <BlogList/>
  </div>
</template>
<script>
import ProductList from '@/views/product/ProductList.vue';
import BlogList from '@/views/blog/BlogList.vue';
export default {
  name: "Home",
  components: {
    ProductList,
    BlogList
  },
  data() {
    return {};
  },
  computed: {
  
  },
  created() {
  },
  methods: {
    
  },
};
</script>

<style scoped>
</style>