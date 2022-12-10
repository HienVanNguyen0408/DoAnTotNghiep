<template>
    <div class="dq-detail" v-if="isShow">
        <dq-popup @closePopup="closePopup" :width="600" :height="500" :isFull="true">
            <template slot="header">
                <div class="dq-titlte">
                    {{ titlleMode }}
                </div>
            </template>
            <template slot="content">
                <div>

                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-combobox :class="'w-100'" :title="'Loại sản phẩm'" :classTitle="'h-mb-5 font-bold'"
                                :placeholder="'Loại sản phẩm'" :data="ProductCategories" :keyData="'id'"
                                :display="'name'" :value.sync="product.product_category_id"
                                :defaultValue="productCategoryDefault" ref="productCategory">
                            </dq-combobox>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-input class="w-100" ref="firstInput" :title="'Tên sản phẩm'" placeholder="Tên sản phẩm"
                                v-model="product.product_name"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="flex-1 dq-mgr-10">
                            <dq-input-date class="w-100" ref="expired_date" :title="'Ngày hết hạn'"
                                :value.sync="product.expired_date">
                            </dq-input-date>
                        </div>
                        <div class="flex-1">
                            <dq-input-date class="w-100" ref="manufacture_date" :title="'Ngày sản xuất'"
                                :value.sync="product.manufacture_date">
                            </dq-input-date>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="flex-1 dq-mgr-10">
                            <dq-input class="w-100" ref="firstInput" :title="'Giá nhập'" placeholder="Giá nhập"
                                :type="'number'" v-model="product.original_price"></dq-input>
                        </div>
                        <div class="flex-1">
                            <dq-input class="w-100" ref="firstInput" :title="'Giá bán'" placeholder="Giá bán"
                                :type="'number'" v-model="product.sale_price"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="flex-1 dq-mgr-10">
                            <dq-input class="w-100" ref="firstInput" :title="'Đơn vị tính'" placeholder="Đơn vị tính"
                                v-model="product.unit_name"></dq-input>
                        </div>
                        <div class="flex-1">
                            <dq-input class="w-100" ref="firstInput" :title="'Mô tả đơn vị'" placeholder="Mô tả đơn vị"
                                v-model="product.unit_description"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-editor id="editor" :height="200" :title="'Mô tả sản phẩm'"
                                :editorToolbar="customToolbar" v-model="product.description"
                                @updateData="updateSummaryProduct" :value="product.description">
                            </dq-editor>
                        </div>
                    </div>
                    <div class="mt-5">
                        <dq-input-file-many class="mt-5" :title="'Ảnh sản phẩm'" @change="changeImage"
                            :value="product.files">
                        </dq-input-file-many>
                    </div>
                    <div class="mt-5">
                        <ProductColorInfo :title="'Màu sắc chi tiết'" @updateColorInfo="updateColorInfo"
                            :value="product.colors" />
                    </div>
                </div>
            </template>
            <template slot="footer">
                <div style="width:100%">
                    <div class="flex jus-right">
                        <dq-button :title="'Hủy bỏ'" @click="closePopup">
                        </dq-button>
                        <dq-button class="dq-mgl-10" :title="'Lưu'" @click="saveDataAsync">
                        </dq-button>
                    </div>
                </div>
            </template>
        </dq-popup>
    </div>
</template>

<script>
import { mapActions, mapGetters, mapMutations } from "vuex";
import { ModuleProduct } from "@/store/module-const";
import ProductColorInfo from './ProductColorInfo.vue';
export default {
    name: "ProductDetail",
    components: {
        ProductColorInfo
    },
    props: {
        isShow: {
            typeof: Boolean,
            default: false
        },
        product: {
            typeof: Object,
            default: null
        },
        mode: {
            typeof: String,
            default: null
        }
    },
    data() {
        return {
            customToolbar: this.$commonFunc.getToolBarEditor(),
        }
    },
    watch: {
    },
    mounted() {
    },
    computed: {
        ...mapGetters(ModuleProduct, [
            "ProductCategories",
        ]),
        titlleMode() {
            const me = this;
            if (me.mode == me.$enum.Mode.Add) {
                return me.$t('i18nAdmin.AddProduct');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditProduct');
            }
            return "";
        },

        productCategoryDefault() {
            const me = this;
            if (me.ProductCategories && me.ProductCategories.length > 0) {
                if (!me.product.product_category_id) { me.product.product_category_id = me.ProductCategories[0].id; }
                return me.ProductCategories[0].id;
            }
            return '';
        }
    },
    created() {
        const me = this;
        me.getDataForm();
    },
    methods: {
        ...mapActions(ModuleProduct, [
            "insertProductAsync",
            "updateProductAsync",
            'getProductCategories'
        ]),

        async getDataForm() {
            const me = this;
            await me.getProductCategories();
        },

        /**
         * Load lại thông tin vừa thay đổi
         */
        async loadData() {
            const me = this;
            await me.$emit("loadData");
        },

        /**
         * Lưu thông tin
         */
        async saveDataAsync() {
            const me = this;
            // Thêm
            if (me.mode == me.$enum.Mode.Add) {
                await me.insertProductAsync(me.product);
            }
            // Sửa
            else if (me.mode == me.$enum.Mode.Edit) {
                await me.updateProductAsync(me.product);
            }
            me.loadData();
            me.closePopup();
        },

        /**
         * Đóng popup
         */
        closePopup() {
            const me = this;
            me.$emit("closePopup");
            me.resetData();
            me.mode = me.$enum.Mode.Add;
        },

        resetData() {
            const me = this;
            me.$emit('resetData');
        },
        async changeImage(files) {
            const me = this;
            await me.updateProduct({ ...me.product, files: files });
        },

        async updateProduct(product) {
            const me = this;
            await me.$emit("updateProduct", product);
        },

        async updateColorInfo(colors) {
            const me = this;
            await me.updateProduct({ ...me.product, colors: colors });
        },
        updateSummaryProduct(description) {
            const me = this;
            me.updateProduct({ ...me.product, description: description });
        }
    }
}
</script>

<style lang="scss" scoped>

</style>