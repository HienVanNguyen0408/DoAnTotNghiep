<template>
    <div class="product-view p-3">
        <div>
            <div class="product-image">
                <img src="" alt="">
            </div>
            <div class="mt-3" v-if="product && product.files && product.files.length > 0">
                <div class="image-product-view flex items-center cursor-pointer" @mouseover="hoverImageView" @click="viewDetailProduct(product.id)"> 
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
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProduct } from '@/store/module-const';
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
    created(){
        const me = this;
        
    },
    methods: {
        ...mapActions(ModuleProduct, [
            'getProductAsync',
        ]),
        changeImageView(index) {
            const me = this;
            me.indexProductView = index;
        },
        hoverImageView() {
            const me = this;
            me.indexProductViewPrev = me.indexProductView;
            me.indexProductView = Math.floor(Math.random() * me.product.files.length);
        },
        
        /**
         * Xem thông tin chi tiết của sản phẩm
         */
        async viewDetailProduct(productId){
            const me = this;
            let payload = {
                productId: productId,
                isUser : true
            };
            await me.getProductAsync(payload);

            this.$router.push({ path: 'product-detail', query: { product: productId }})
            //load view detail
            // me.$router.push('product-detail');
        }
    }
}
</script>

<style scoped>
.price-sale {
    color: #f94c43;
}
</style>