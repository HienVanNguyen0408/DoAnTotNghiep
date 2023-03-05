<template>
  <div class="">
    <ProductList class="product-list-home" />
    <BlogList class="blog-list-home" />
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
.product-list-home {
  border-radius: 10px;
  box-shadow: 0 0 30px #a19595;
}

.blog-list-home {
  border-radius: 10px;
  box-shadow: 0 0 30px #a19595;
}
</style>