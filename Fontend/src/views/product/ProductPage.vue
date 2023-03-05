<template>
    <div class="flex">
        <div class="w-20per p-5 bg-page">
            <ProductCategory @loadDataByCategory="loadDataByCategory"/>
        </div>
        <div class="w-80per products bg-page ml-6">
            <div class="filter-product-page mt-8 ml-20 flex">
                <div class="filter-search">
                    <dq-input v-model="params.filter" :placeholder="'Nhập tên sản phẩm để tìm kiếm'" @keydown="filterDataProducts">
                    </dq-input>
                </div>
                <div class="ml-10">
                    <div  class="flex align-center">
                        <div  class="mr-5 font-bold" style="width: 200px;">Lọc theo giá tiền:</div>
                        <dq-combobox :class="'w-100'" :classTitle="'h-mb-5 font-bold'" :placeholder="'Lọc theo giá tiền'"
                            :data="filterPrices" :keyData="'sort'" :display="'text'" :value.sync="params.sort"
                            :defaultValue="filterPriceDefault" ref="filterPrices" @change="changeSortPrice">
                        </dq-combobox>
                    </div>
                </div>
                <div>

                </div>
            </div>
            <div>
                <ProductList ref="productList"/>
            </div>
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
    },
    data() {
        return {
            params: {
                filter: "",
                sort: ""
            },
            filterPrices: []
        }
    },
    computed: {
        filterPriceDefault() {
            const me = this;
            if (me.filterPrices && me.filterPrices.length > 0) {
                if (!me.params.sort) { me.params.sort = me.filterPrices[0].sort; }
                return me.filterPrices[0].sort;
            }
            return '';
        },
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        initData() {
            const me = this;
            me.initDataStatic();
        },

        initDataStatic() {
            const me = this;
            me.filterPrices = [
                {
                    text: 'Mặc định',
                    sort: 'default'
                },
                {
                    text: 'Giá giảm dần',
                    sort: 'sale_price;desc'
                },
                {
                    text: 'Giá tăng dần',
                    sort: 'sale_price;asc'
                },
            ]
        },
        async loadDataByCategory(param){
            const me = this;
            me.params = {
                ...me.params,
                categoryId : param.id,
                salePrice : param.sale_price
            }
            await me.loadDataProduct(me.params);
        },

        async loadDataProduct(payload){
            const me = this;
            await me.$refs.productList.loadDataProducts(payload);
        },
        /*
        *Hàm lọc danh sách
        */
        filterDataProducts: _.debounce(async function () {
            const me = this;
            await me.loadDataProduct(me.params);
        }, 1000),

        async changeSortPrice(){
            const me = this;
            await me.loadDataProduct(me.params);
        }
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

.products {}

.bg-page {
    border-radius: 10px;
    box-shadow: 0 0 30px #a19595;
}

.filter-search {
    width: 300px;
}
</style>