<template>
    <div>
        <div>
            <div class="title-category font-bold">DANH MỤC SẢN PHẨM</div>
            <div v-if="ProductCategories && ProductCategories.length > 0">
                <div class="product-categories">
                    <div class="mt-2">
                        <div class="flex">
                            <div class="mr-6">
                                <dq-checkbox @click="clickAll()" :class="['th-checkbox']" :value="checked[0]"></dq-checkbox>
                            </div>
                            <div>
                                Tất cả
                            </div>
                        </div>

                    </div>
                    <div class="mt-2" v-for="(productCategory, index) in ProductCategories" :key="index">
                        <div class="flex">
                            <div class="mr-6">
                                <dq-checkbox @click="clickCheck(index)" :class="['th-checkbox']"
                                    :value="checked[index + 1]"></dq-checkbox>
                            </div>
                            <div>
                                {{ productCategory.name }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="font-bold mt-5">KHOẢNG GIÁ</div>
            <div class="border-bottom1 mt-2 mb-2"></div>
            <dq-range-slider @changeValue="changeValueRange" class="w-100" :max="max" :min="min"></dq-range-slider>
            <div class="flex mt-2">
                <div class="border-1px price-range w-50 mr-5 abnfq">{{ min | formatMoney }} đ</div>
                <div class="border-1px price-range w-50">{{ priceRange | formatMoney }} đ</div>
            </div>
            <div class="filter-price mt-4">
                <dq-button :title="'Lọc'" @click="filterPrice"></dq-button>
            </div>
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleProduct } from '@/store/module-const';
export default {
    name: "ProductCategoryView",
    data() {
        return {
            valuePrice: 0,
            max: 2000000,
            min: 50000,
            optionPrices: [],
            checked: [],
            params : {
                id : '',
                sale_price : 0
            }
        }
    },
    computed: {
        ...mapGetters(ModuleProduct, [
            'ProductCategories',
        ]),
        priceRange() {
            const me = this;
            return me.params.sale_price ? me.params.sale_price : me.max;
        }
    },
    async created() {
        const me = this;
        me.initData();
        await me.getDataProductCategories();

        if (me.ProductCategories && me.ProductCategories.length > 0) {
            me.initDataChecked();
            me.checked[0] = true;
        }

    },
    methods: {
        ...mapActions(ModuleProduct, [
            'getProductCategories'
        ]),
        async getDataProductCategories() {
            const me = this;
            await me.getProductCategories();
        },
        initData() {
            const me = this;

            me.initDataStatic();
        },
        initDataStatic() {
            const me = this;
            me.optionPrices = [

            ]
        },
        changeValueRange(value) {
            const me = this;
            me.params.sale_price = value;
        },
        initDataChecked() {
            const me = this;
            me.checked = [...me.ProductCategories.map(x => false)];
            if(me.checked.length > me.ProductCategories){
                me.checked[0] = false;
            }
            else{
                me.checked.unshift(false);
            }
        },

        clickCheck(index) {
            const me = this;
            me.params.id = me.ProductCategories[index].id;
            me.initDataChecked();
            me.checked[index + 1] = true;
            me.loadDataProductByCategory();
        },
        clickAll() {
            const me = this;
            me.initDataChecked();
            me.checked[0] = true;
            me.params.id = '';
            me.loadDataProductByCategory();
        },

        loadDataProductByCategory(){
            const me = this;
            me.$emit('loadDataByCategory', me.params);
        },

        filterPrice(){
            const me = this;
            me.$emit('loadDataByCategory', me.params);
        }

    }
}
</script>

<style scoped>
.title-category {
    font-size: 22px;
}

.border-bottom1 {
    border-bottom: 1px solid #e5e5e5;
}

.border-1px {
    border: 1px solid;
}

.price-range {
    border-radius: 8px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 30px;
}
</style>