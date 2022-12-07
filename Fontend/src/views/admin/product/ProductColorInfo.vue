<template>
    <div>
        <div v-if="title" class="mb-1 font-bold">{{ title }}</div>
        <div class="product-color-info p-5" style="width:100%" :style="{ 'min-height': height + 'px' }">
            <div class="flex align-center">
                <div class="flex-1 product-color">
                    <dq-color-picker :title="'Màu sắc sản phẩm'" @change="changeColor"
                        :value="color.color_name"></dq-color-picker>
                </div>
                <div class="flex-2 ml-4">
                    <dq-combobox :class="'w-100'" :title="'Loại size'" :classTitle="'h-mb-5 font-bold'"
                        :placeholder="'Loại size'" :data="sizes" :keyData="'id'" :display="'value'"
                        :value.sync="color.size_name" :defaultValue="sizeDefault" ref="sizeName">
                    </dq-combobox>
                </div>
                <div class="flex-2 number-product ml-4">
                    <dq-input class="w-100" ref="firstInput" :title="'Số lượng'" placeholder="Số lượng" :type="'number'"
                        v-model="color.amount"></dq-input>
                </div>
            </div>
            <div class="btn-add-color flex justify-end mt-3" :title="'Thêm'">
                <dq-button class="dq-mgl-10" style="min-width:150px;width:150px" :title="'Thêm'" @click="addColorInfo">
                </dq-button>
            </div>
            <div class="colors" v-if="colors && colors.length > 0">
                <div class="color mb-2 font-bold" v-for="(colorInfo, index) in colors" :key="index">
                    <div class="flex align-center relative">
                        <div class="flex align-center">Màu sắc:<div class="color_name ml-1"
                                :style="{ 'background-color': `${colorInfo.color_name}` }"></div>
                        </div>
                        <div class="size_name ml-2">Size: {{ colorInfo.size_name }} - Số lượng: {{ colorInfo.amount }}
                        </div>
                        <div title="Xóa" class="icon dq-icon-24 icon-close cursor-pointer ml-4" @click="removeColorInfo(colorInfo)">
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "ProductColorInfo",
    components: {

    },
    props: {
        title: {
            typeof: String,
            default: ""
        },
        height: {
            typeof: Number,
            default: 200
        },
        value: null,
    },
    data() {
        return {
            sizes: [],
            color: {},
            colors: [],
        }
    },
    created() {
        const me = this;
        me.initData();
        if (me.value && (!me.colors || me.colors.length <= 0)) {
            me.colors = [...me.value];
            me.updateColorInfo(me.colors);
        }
    },
    watch: {
        colors(newV, oldV) {
            const me = this;
            if (newV != oldV) {
                me.updateColorInfo(newV);
            }
        }
    },
    computed: {
        sizeDefault() {
            const me = this;
            if (me.sizes && me.sizes.length > 0) {
                if (!me.color.size_name) {
                    me.color.size_name = me.sizes[0].id;
                }
                return me.sizes[0].id;
            }
            return '';
        }
    },
    methods: {
        initData() {
            const me = this;
            me.initDataStatic();
        },
        initDataStatic() {
            const me = this;
            me.sizes = [
                {
                    id: 'XS',
                    value: 'XS'
                },
                {
                    id: 'S',
                    value: 'S'
                },
                {
                    id: 'M',
                    value: 'M'
                },
                {
                    id: 'L',
                    value: 'L'
                },
                {
                    id: 'XL',
                    value: 'XL'
                },
                {
                    id: 'XXL',
                    value: 'XXL'
                },
                {
                    id: 'XXXL',
                    value: 'XXXL'
                },
            ]
        },
        updateColorInfo(colors) {
            const me = this;
            me.$emit('updateColorInfo', colors);
        },
        addColorInfo() {
            const me = this;
            if (!me.color.color_name) me.color.color_name = "#000000";
            let indexColor = me.colors.findIndex(x => {
                return x.size_name == me.color.size_name;
            });

            if(indexColor >= 0){
                me.colors[indexColor] = me.color;
                me.colors = [...me.colors];
            }else{
                me.colors = [...me.colors, me.color];
            }
            me.color = { ...me.color };
        },

        changeColor(color_h) {
            const me = this;
            me.color.color_name = color_h;
        },
        removeColorInfo(color) {
            const me = this;
            me.colors = [...me.colors.filter(x => x != color)];
        }
    }

}
</script>

<style lang="scss" scoped>
.product-color-info {
    border: 1px solid #e5e5e5;
}

.color_name {
    border-radius: 50%;
    width: 50px;
    height: 50px;
}
</style>