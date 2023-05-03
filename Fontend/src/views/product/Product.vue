<template>
    <div class="product-view p-3">
        <div class="product-container cursor-pointer" @click="viewDetailProduct(product.id)">
            <div class="product-image">
                <span class="hover-link"></span>
                <div class="product-link">Xem chi tiết</div>
                <img v-if="product.files && product.files[indexProductView] && product.files[indexProductView].path" class="img-responsive" :src="product.files[indexProductView].path" alt="">
            </div>
            <div class="product-description">
                <div class="product-label">
                    <div class="product-name">
                        <div class="">{{ product.product_name }}</div>
                        <div class="price mt-2">{{ product.sale_price | formatMoney }}đ</div>
                    </div>
                </div>
                <div class="product-option">
                    <div class="product-size mt-2">
                        <h3>Kích thước</h3>
                        <p>XS,S,M,L,XL,XXL</p>
                    </div>
                    <div class="product-color mt-2">
                        <h3>Màu sắc</h3>
                        <ul>
                            <li class="red"></li>
                            <li class="blue"></li>
                            <li class="green"></li>
                            <li class="gray"></li>
                            <li class="black"></li>
                            <li class="dark-blue"></li>
                        </ul>
                    </div>
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
    created() {
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
        async viewDetailProduct(productId) {
            const me = this;
            let payload = {
                productId: productId,
                isUser: true
            };
            await me.getProductAsync(payload);

            this.$router.push({ path: 'product-detail', query: { product: productId } })
            //load view detail
            // me.$router.push('product-detail');
        }
    }
}
</script>

<style scoped>
.product-view {
    transition: .5s;
    border-radius: 10px;
    background-color: #fff;
    overflow: hidden;
    position: relative;
    margin-bottom: 20px;
    height: 500px;
}

.product-view:hover {
    box-shadow: 0 0 30px #f5eded;
}

.price-sale {
    color: #f94c43;
}



.tag-sale {
    background-color: #4fdaa4;
    width: 86px;
    height: 98px;
    position: absolute;
    color: #fff;
    right: -41px;
    z-index: 9;
    top: -44px;
    transform: rotate(137deg);
}

.tag-sale::before {
    content: "SALE";
    color: #fff;
    font-weight: bold;
    display: block;
    transform-origin: top center;
    transform: rotate(222.5deg) translateX(-28px) translateY(-37px);
}

.product-description {
    background-color: #F7F7F7;
    border-top: 1px solid #EFEFEF;
    padding: 10px 20px;
    color: #797979;
    height: 200px;
}

.product-image {
    /* padding: 20px; */
    height: 250px;
    position: relative;
    overflow: hidden;
    transition: 1s;
}

.product-link {
    position: absolute;
    background: #fff;
    width: 100px;
    height: 100px;
    color: #4FDAA4;
    border-radius: 50%;
    font-size: 25px;
    text-align: center;
    padding: 22px 0;
    line-height: 25px;
    left: calc(50% - 50px);
    top: calc(50% - 50px);
    opacity: 0;
    transition: 1s;
    font-style: italic;
}

.product-link:hover {
    text-decoration: none;
    color: #4FDAA4;
}


.hover-link {
    background-color: #4FDAA4;
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
    width: 100%;
    height: 100%;
    transition: 0.5s;
}

.product-image img {
    width: 100%;
}

.product-description h1 {
    font-size: 23px;
    margin-bottom: 5px;
    margin-top: 0;
    display: inline-block;
    width: 78%;
}

.product-description p {
    color: #C4C4C4;
}

.product-description .price {
    font-size: 15px;
    font-weight: bold;
    color: #2DD493;
    margin-bottom: 5px;
}

.product-option {
    border-top: 1px solid #D2D2D2;
}

.product-option h3 {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 3px;
}

.product-option .product-color ul {
    list-style-type: none;
    padding: 0;
}

.product-option .product-color li {
    display: inline-block;
    width: 15px;
    height: 15px;
}

.product-color li.red {
    background-color: #F75375;
}

.product-color li.blue {
    background-color: #53A0F7;
}

.product-color li.green {
    background-color: #59CFAF;
}

.product-color li.gray {
    background-color: #C7C7C7;
}

.product-color li.black {
    background-color: #4E5156;
}

.product-color li.dark-blue {
    background-color: #2060AF;
}

.product-container:hover {
    box-shadow: 0px 10px 25px -2px rgba(0, 0, 0, 0.36);
}

.product-container:hover .product-image {
    height: 180px;
    transition: 1s;
}

.product-container:hover .product-option {
    display: block;
}

.product-container:hover .hover-link {
    opacity: 0.5;
}

.product-container:hover .product-link {
    opacity: 1;
}

.product-link:hover {
    -webkit-animation: hovering 1000ms linear both;
    animation: hovering 1000ms linear both;
}

@-webkit-keyframes hovering {
    0% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    2.3% {
        -webkit-transform: matrix3d(1.102, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.102, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    4.6% {
        -webkit-transform: matrix3d(1.136, 0, 0, 0, 0, 1.136, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.136, 0, 0, 0, 0, 1.136, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    7.41% {
        -webkit-transform: matrix3d(1.099, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.099, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    10.21% {
        -webkit-transform: matrix3d(1.023, 0, 0, 0, 0, 1.023, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.023, 0, 0, 0, 0, 1.023, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    13.01% {
        -webkit-transform: matrix3d(0.962, 0, 0, 0, 0, 0.962, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.962, 0, 0, 0, 0, 0.962, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    15.72% {
        -webkit-transform: matrix3d(0.942, 0, 0, 0, 0, 0.942, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.942, 0, 0, 0, 0, 0.942, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    18.52% {
        -webkit-transform: matrix3d(0.958, 0, 0, 0, 0, 0.958, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.958, 0, 0, 0, 0, 0.958, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    21.32% {
        -webkit-transform: matrix3d(0.99, 0, 0, 0, 0, 0.99, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.99, 0, 0, 0, 0, 0.99, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    24.12% {
        -webkit-transform: matrix3d(1.016, 0, 0, 0, 0, 1.016, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.016, 0, 0, 0, 0, 1.016, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    26.83% {
        -webkit-transform: matrix3d(1.025, 0, 0, 0, 0, 1.025, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.025, 0, 0, 0, 0, 1.025, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    32.43% {
        -webkit-transform: matrix3d(1.004, 0, 0, 0, 0, 1.004, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.004, 0, 0, 0, 0, 1.004, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    38.04% {
        -webkit-transform: matrix3d(0.989, 0, 0, 0, 0, 0.989, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.989, 0, 0, 0, 0, 0.989, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    49.15% {
        -webkit-transform: matrix3d(1.005, 0, 0, 0, 0, 1.005, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.005, 0, 0, 0, 0, 1.005, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    60.26% {
        -webkit-transform: matrix3d(0.998, 0, 0, 0, 0, 0.998, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.998, 0, 0, 0, 0, 0.998, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    71.37% {
        -webkit-transform: matrix3d(1.001, 0, 0, 0, 0, 1.001, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.001, 0, 0, 0, 0, 1.001, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    82.48% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    93.59% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    100% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }
}

@keyframes hovering {
    0% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    2.3% {
        -webkit-transform: matrix3d(1.102, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.102, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    4.6% {
        -webkit-transform: matrix3d(1.136, 0, 0, 0, 0, 1.136, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.136, 0, 0, 0, 0, 1.136, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    7.41% {
        -webkit-transform: matrix3d(1.099, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.099, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    10.21% {
        -webkit-transform: matrix3d(1.023, 0, 0, 0, 0, 1.023, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.023, 0, 0, 0, 0, 1.023, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    13.01% {
        -webkit-transform: matrix3d(0.962, 0, 0, 0, 0, 0.962, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.962, 0, 0, 0, 0, 0.962, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    15.72% {
        -webkit-transform: matrix3d(0.942, 0, 0, 0, 0, 0.942, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.942, 0, 0, 0, 0, 0.942, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    18.52% {
        -webkit-transform: matrix3d(0.958, 0, 0, 0, 0, 0.958, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.958, 0, 0, 0, 0, 0.958, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    21.32% {
        -webkit-transform: matrix3d(0.99, 0, 0, 0, 0, 0.99, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.99, 0, 0, 0, 0, 0.99, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    24.12% {
        -webkit-transform: matrix3d(1.016, 0, 0, 0, 0, 1.016, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.016, 0, 0, 0, 0, 1.016, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    26.83% {
        -webkit-transform: matrix3d(1.025, 0, 0, 0, 0, 1.025, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.025, 0, 0, 0, 0, 1.025, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    32.43% {
        -webkit-transform: matrix3d(1.004, 0, 0, 0, 0, 1.004, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.004, 0, 0, 0, 0, 1.004, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    38.04% {
        -webkit-transform: matrix3d(0.989, 0, 0, 0, 0, 0.989, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.989, 0, 0, 0, 0, 0.989, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    49.15% {
        -webkit-transform: matrix3d(1.005, 0, 0, 0, 0, 1.005, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.005, 0, 0, 0, 0, 1.005, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    60.26% {
        -webkit-transform: matrix3d(0.998, 0, 0, 0, 0, 0.998, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(0.998, 0, 0, 0, 0, 0.998, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    71.37% {
        -webkit-transform: matrix3d(1.001, 0, 0, 0, 0, 1.001, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1.001, 0, 0, 0, 0, 1.001, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    82.48% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    93.59% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }

    100% {
        -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
        transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
    }
}</style>