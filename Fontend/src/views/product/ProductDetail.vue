<template>
    <div class="product-detail" v-if="ProductUser && ProductUser.id">
        <div class="flex">
            <div class="product-view flex-1">
                <div class="mt-3 flex" v-if="ProductUser && ProductUser.files && ProductUser.files.length > 0">
                    <div class="images-product mt-3">
                        <div class="image-product mr-2 cursor-pointer" v-for="(file, index) in ProductUser.files"
                            :key="index" @click="changeImageView(index)">
                            <div class="mt-2" v-if="file.path">
                                <img class="w-44 h-32" :src="file.path" />
                            </div>
                        </div>
                    </div>
                    <div class="ml-4 image-product-view flex items-center cursor-pointer"
                        v-if="ProductUser.files[indexProductView] && ProductUser.files[indexProductView].path">
                        <img class="image-product-view" :src="ProductUser.files[indexProductView].path" />
                    </div>
                </div>
            </div>
            <div class="product-infomation flex-1 ml-6">
                <div class="product-name mt-3 pb-4 font-bold border-bottom">{{ ProductUser.product_name }}</div>
                <div class="product-price mt-3 pb-4 border-bottom font-bold">
                    <span> {{ ProductUser.sale_price | formatMoney }}đ</span>
                    <span class="ml-2 line-through">{{ ProductUser.original_price | formatMoney }}đ</span>
                </div>
                <div class="options-color mt-3 pb-4 border-bottom" v-if="ProductUser && ProductUser.colors">
                    <div class="colors flex">
                        <div class="color cursor-pointer ml-2" v-for="(color_name, index) in getColorsProduct" :key="index"
                            @click="selectColor(color_name)"
                            :class="[colorNameSelect == color_name ? 'color-product-active' : '']">
                            <div class="color_name" :style="{ 'background-color': `${color_name}` }"></div>
                        </div>
                    </div>
                </div>
                <div class="options-size mt-3 pb-4 border-bottom" v-if="colorsProductSize && colorsProductSize.length > 0">
                    <div class="sizes-product flex">
                        <div :class="[sizeSelect == color.size_name ? 'size-product-active' : '']"
                            class="size-product cursor-pointer mr-3" v-for="(color, index) in colorsProductSize"
                            :key="index" @click="selectSize(color)">
                            <div>{{ color.size_name }}</div>
                        </div>
                    </div>
                </div>
                <div v-else class="font-bold options-size mt-3 pb-4 border-bottom">
                    Hết size
                </div>
                <div class="option-number mt-3 pb-4 border-bottom">
                    <div class="font-bold mb-3">Chọn số lượng</div>
                    <dq-input :type="'number'" v-model="product.number"></dq-input>
                </div>
                <div class="action-buy-product mt-4 pb-5">
                    <div class="add-cart">
                        <dq-button :title="'Thêm giỏ hàng'" @click="addProductCart"
                            :disabled="!(colorsProductSize && colorsProductSize.length > 0)"></dq-button>
                    </div>
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
import { ModuleProduct, ModuleUser } from '@/store/module-const';
export default {
    name: "ProductDetailUser",
    data() {
        return {
            indexProductView: 0,
            indexProductViewPrev: 0,
            sizes: [],
            colorSelect: {},
            colorsProductSize: [],
            product: {
                number: 1
            },
            sizeSelect: "",
            colorNameSelect: ""
        }
    },
    computed: {
        ...mapGetters(ModuleUser, [
            'User',
        ]),
        ...mapGetters(ModuleProduct, [
            'ProductUser',
        ]),
        getColorsProduct() {
            const me = this;
            if (!me.ProductUser || !me.ProductUser.colors || me.ProductUser.colors.length <= 0) return [];
            return [... new Set(me.ProductUser.colors.map(data => data.color_name))]
        },
    },
    async created() {
        const me = this;
        if (!me.ProductUser || !me.ProductUser.id) {
            if (me.$route.query && me.$route.query.product) {
                let payload = {
                    productId: me.$route.query.product,
                    isUser: true
                };
                await me.getProductAsync(payload);
            }
        }
        if (!me.ProductUser || !me.ProductUser.id) {
            me.$router.push({ path: 'product' })
        }

        if (me.ProductUser && me.ProductUser.id) {
            me.initData();
        }
    },
    methods: {
        ...mapActions(["getCartByUser"]),
        ...mapActions(ModuleProduct, [
            'getProductAsync',
        ]),

        async initData() {
            const me = this;
            me.sizes = me.$commonFunc.getSizeProduct(me.ProductUser.product_size_type);
            if (me.ProductUser.colors && me.ProductUser.colors.length > 0) {
                me.colorNameSelect = me.ProductUser.colors[0].color_name;
                me.sizeSelect = me.ProductUser.colors[0].size_name;
                me.colorsProductSize = [...me.getColorByName(me.colorNameSelect)];
            }
        },
        changeImageView(index) {
            const me = this;
            me.indexProductView = index;
        },

        /**
        * Check size, màu để hiển thị lựa chọn
        */
        checkExistProduct() {
            const me = this;
        },

        selectSize(color) {
            const me = this;
            me.sizeSelect = color.size_name;
        },

        selectColor(color_name) {
            const me = this;
            me.colorNameSelect = color_name;
            me.colorsProductSize = [...me.getColorByName(color_name)];
            if (me.colorsProductSize && me.colorsProductSize.length > 0) {
                me.sizeSelect = me.colorsProductSize[0].size_name;
            }
        },

        getColorByName(color_name) {
            const me = this;
            if (!me.ProductUser || !me.ProductUser.colors || me.ProductUser.colors.length <= 0) return [];
            return [...me.ProductUser.colors.filter(x => x.color_name == color_name && x.amount > 0)];
        },

        async addProductCart() {
            const me = this;
            if (me.product.number >= 0) me.product.number = parseInt(me.product.number);
            let product = {
                id: me.ProductUser.id,
                sale_price: me.ProductUser.sale_price,
                product_name: me.ProductUser.product_name,
                size_name: me.sizeSelect,
                color_name: me.colorNameSelect,
                total_amount: me.product.number * me.ProductUser.sale_price
            }
            me.product = { ...me.product, ...product };
            if (me.User && me.User.id) {
                me.$commonFunc.addCart(me.User.user_name, me.product);
                //load lại giỏ hàng
                await me.getCartByUser(me.User.user_name);
            } else {
                // me.$router.push("/login");
            }
        }
    }
}
</script>
<style scoped>
.product-detail {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 90%;
    margin-left: 10%;
}

.image-product-view {
    width: 500px;
    height: 500px;
}

.product-name {
    font-size: 20px;
}

.product-price {
    color: red;
}

.sizes-product {}

.size-product {
    border: 1px solid #e5e5e5;
    color: #000;
    font-weight: bold;
    height: 45px;
    width: 45px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.size-product-active {
    color: #fff;
    background-color: #000;
}

.color-product-active {
    border: 1px solid #e5e5e5;
    display: flex;
    align-items: center;
    justify-content: center;
}

.border-bottom {
    border-bottom: 1px solid #e5e5e5;
}

.color_name {
    border-radius: 50%;
    width: 50px;
    height: 50px;
}
</style>