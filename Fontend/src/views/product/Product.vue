<template>
    <div class="product-view p-3">
        <div>
            <div class="product-image">
                <img src="" alt="">
            </div>

            <div class="mt-3" v-if="product && product.files && product.files.length > 0">
                <div class="image-product-view flex items-center cursor-pointer" @mouseover="hoverImageView">
                    <img class="w-60 w-full" :src="product.files[indexProductView].path" />
                </div>
                <div class="font-bold mt-3">{{ product.product_name }}</div>
                <div class="images-product flex mt-3">
                    <div class="image-product mr-2 cursor-pointer" v-for="(file, index) in product.files" :key="index"
                        @click="changeImageView(index)">
                        <img class="w-8 h-8" :src="file.path" />
                    </div>
                </div>
            </div>
            <div class="prices mt-3">
                <div class="flex">
                    <div class="font-bold mr-3 price-sale">{{ product.sale_price | formatMoney }} đ</div>
                    <div class="line-through">{{ product.original_price | formatMoney }} đ</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "",
    props: {
        product: {}
    },
    data() {
        return {
            indexProductView: 0,
            indexProductViewPrev: 0
        }
    },
    methods: {
        changeImageView(index) {
            const me = this;
            me.indexProductView = index;
        },
        hoverImageView() {
            const me = this;
            me.indexProductViewPrev = me.indexProductView;
            me.indexProductView = Math.floor(Math.random() * me.product.files.length);
        },
    }
}
</script>

<style scoped>
.price-sale {
    color: #f94c43;
}
</style>