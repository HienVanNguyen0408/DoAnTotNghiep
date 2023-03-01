<template>
    <div class="flex">
        <div class="w-20per">
            <ProductCategory />
        </div>
        <div class="w-80per products">
            <ProductList />
        </div>
    </div>
</template>

<script>
import ProductCategory from './ProductCategory.vue'
import ProductList from '@/views/product/ProductList.vue';
export default {
    name: "ProductPage",
    components: {
        ProductList,
        ProductCategory
    }
}
</script>

<style scoped>
.w-20per {
    width: 20%;
}

.w-80per {
    width: 80%;
}

.products {
}
</style>