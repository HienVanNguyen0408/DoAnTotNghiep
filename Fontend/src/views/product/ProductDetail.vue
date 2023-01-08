<template>
    <div class="product-detail" v-if="ProductUser">
        <div class="p-16 flex">
            <div class="product-view flex-1">
                <div class="mt-3 flex" v-if="ProductUser && ProductUser.files && ProductUser.files.length > 0">
                    <div class="images-product mt-3">
                        <div class="image-product mr-2 cursor-pointer" v-for="(file, index) in ProductUser.files"
                            :key="index" @click="changeImageView(index)">
                            <div class="mt-2">
                                <img class="w-44 h-32" :src="file.path" />
                            </div>
                        </div>
                    </div>
                    <div class="ml-4 image-product-view flex items-center cursor-pointer">
                        <img class="w-80" :src="ProductUser.files[indexProductView].path" />
                    </div>
                </div>
                <div class="images-product">

                </div>
                <div class="image-product-view">

                </div>
            </div>
            <div class="product-infomation flex-1 ml-6">
                <div class="product-name mt-3 mb-3 font-bold border-bottom">{{ ProductUser.product_name }}</div>
                <div class="product-price mt-3 mb-3 border-bottom font-bold">
                   <span> {{ ProductUser.original_price | formatMoney }}đ</span> <span class="ml-2 line-through"> {{ ProductUser.original_price | formatMoney}}đ</span>
                </div>
                <div class="options-size mt-3 mb-3 border-bottom">

                </div>
                <div class="options-color mt-3 mb-3 border-bottom">

                </div>
                <div class="option-number mt-3 mb-3 border-bottom">

                </div>
                <div class="action-buy-product mt-4">
                    <div class="add-cart"></div>
                    <div class="payment-product"></div>
                </div>
                <div class="description-product" v-html="ProductUser.description">
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
import { ModuleProduct } from '@/store/module-const';
export default {
    name: "ProductDetailUser",
    data() {
        return {
            indexProductView: 0,
            indexProductViewPrev: 0
        }
    },
    computed: {
        ...mapGetters(ModuleProduct, [
            'ProductUser',
        ]),
    },
    created() {
        const me = this;
    },
    methods: {
        changeImageView(index) {
            const me = this;
            me.indexProductView = index;
        },
    }
}
</script>
<style scoped>
.product-detail{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 80%;
    margin-left: 10%;
}

.product-name{
    font-size: 20px;
}
.product-price{
    color: red;
}
.border-bottom{
   border-bottom: 1px solid #e5e5e5;
}
</style>