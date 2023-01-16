<template>
    <div class="address-info">
        <dq-popup @closePopup="closePopup" :width="600" :height="500" :isFull="true">
            <template slot="header">
                <div class="dq-titlte">
                    Cập nhật địa chỉ nhận hàng
                </div>
            </template>
            <template slot="content">
                <div>
                    <div class="flex">
                        <div>
                            <div>
                                <dq-input class="w-100" :title="'Họ tên'" placeholder="Họ tên"
                                    v-model="addressInfo.full_name"></dq-input>
                            </div>
                            <div>
                                <dq-input class="w-100" :title="'Số điện thoại'" placeholder="Số điện thoại"
                                    v-model="addressInfo.phone_number"></dq-input>
                            </div>
                        </div>
                        <div>
                            <div>
                                <dq-input class="w-100" :title="'Địa chỉ nhận hàng'" placeholder="Địa chỉ nhận hàng"
                                    v-model="addressInfo.address"></dq-input>
                            </div>
                            <div>
                                <dq-combobox :class="'w-100'" :title="'Tỉnh/Thành phố'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Tỉnh/Thành phố'" :data="Provinces" :keyData="'id'"
                                    :display="'name'" :value.sync="addressInfo.province"
                                    :defaultValue="productCategoryDefault" ref="productCategory">
                                </dq-combobox>
                            </div>
                            <div>
                                <dq-combobox :class="'w-100'" :title="'Quận/Huyện'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Quận/Huyện'" :data="Districts" :keyData="'id'"
                                    :display="'name'" :value.sync="addressInfo.district"
                                    :defaultValue="productCategoryDefault" ref="productCategory">
                                </dq-combobox>
                            </div>
                            <div>
                                <dq-combobox :class="'w-100'" :title="'Phường/Xã'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Phường/Xã'" :data="Wards" :keyData="'id'"
                                    :display="'name'" :value.sync="addressInfo.ward"
                                    :defaultValue="productCategoryDefault" ref="productCategory">
                                </dq-combobox>
                            </div>
                        </div>
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
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleGHN } from '@/store/module-const';
export default {
    name: "AddressInfo",
    data() {
        return {
            addressInfo: {

            }
        }
    },
    created(){
        const me = this;
    },
    computed:{
        ...mapGetters(ModuleGHN, [
            'Provinces',
            'Districts',
            'Wards',
        ]),
    },
    methods:{
        ...mapActions(ModuleGHN, [
            'getProvincesAsync',
            'getDistrictsAsync',
            'getWardsAsync'
        ]),
        async initData(){
            const me = this;

        },

        async getDataGHN(){
            const me = this;
            await me.getProvincesAsync();
        }

    }

}
</script>

<style lang="scss" scoped>

</style>