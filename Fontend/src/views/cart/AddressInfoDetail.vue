<template>
    <div class="address-info">
        <dq-popup @closePopup="closePopup" :width="800" :height="500">
            <template slot="header">
                <div class="dq-titlte">
                    Cập nhật địa chỉ nhận hàng
                </div>
            </template>
            <template slot="content">
                <div>
                    <div class="flex">
                        <div class="flex-1">
                            <div>
                                <dq-input class="w-100" :title="'Họ tên'" placeholder="Họ tên"
                                    v-model="addressInfo.full_name"></dq-input>
                            </div>
                            <div class="mt-4">
                                <dq-input class="w-100" :title="'Số điện thoại'" placeholder="Số điện thoại"
                                    v-model="addressInfo.phone_number"></dq-input>
                            </div>
                        </div>
                        <div class="flex-1 ml-4">
                            <div>
                                <dq-input class="w-100" :title="'Địa chỉ nhận hàng'" placeholder="Địa chỉ nhận hàng"
                                    v-model="addressInfo.address"></dq-input>
                            </div>
                            <div class="mt-4">
                                <dq-combobox :class="'w-100'" :title="'Tỉnh/Thành phố'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Tỉnh/Thành phố'" :data="Provinces" :keyData="'provinceName'"
                                    :display="'provinceName'" :value.sync="addressInfo.province" ref="Province"
                                    @change="changeProvince"
                                    :defaultValue="addressInfo.province">
                                </dq-combobox>
                            </div>
                            <div class="mt-4">
                                <dq-combobox :class="'w-100'" :title="'Quận/Huyện'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Quận/Huyện'" :data="Districts" :keyData="'districtName'"
                                    :display="'districtName'" :value.sync="addressInfo.district" ref="District"
                                    :disabled="disabledDistrict" @change="changeDistrict" :defaultValue="addressInfo.district">
                                </dq-combobox>
                            </div>
                            <div class="mt-4">
                                <dq-combobox :class="'w-100'" :title="'Phường/Xã'" :classTitle="'h-mb-5 font-bold'"
                                    :placeholder="'Phường/Xã'" :data="Wards" :keyData="'wardName'" :display="'wardName'"
                                    :value.sync="addressInfo.ward" ref="Ward" :disabled="disabledWard"
                                    @change="changeWard" :defaultValue="addressInfo.ward">
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
import { ModuleGHN, ModuleUser } from '@/store/module-const';
export default {
    name: "AddressInfoDetail",
    data() {
        return {
        }
    },
    props: {
        isShow: {
            default: false,
            Type: Boolean
        },
        userInfo:{},
        addressInfo: {},
        mode:{
            default : false,
            Type: Boolean
        }
    },
    created() {
        const me = this;
        me.initData();
    },
    computed: {
        ...mapGetters(ModuleGHN, [
            'Provinces',
            'Districts',
            'Wards',
        ]),
        disabledDistrict() {
            const me = this;
            if (!me.addressInfo.province) return true;
            return false;
        },
        disabledWard() {
            const me = this;
            if (!me.addressInfo.district) return true;
            return false;
        },
    },
    methods: {
        ...mapActions(ModuleGHN, [
            'getProvincesAsync',
            'getDistrictsAsync',
            'getWardsAsync'
        ]),
        ...mapActions(ModuleUser, [
            'updateAddressInfoAsync',
            'insertAddressInfoAsync'
        ]),

        async initData() {
            const me = this;
            me.getDataGHN();
        },

        async getDataGHN() {
            const me = this;
            await me.getProvincesAsync();
        },

        closePopup() {
            const me = this;
            me.$emit('closePopup');
            me.$emit('resetData');
        },

        async changeProvince(value) {
            const me = this;
            if (me.Provinces && me.Provinces.length > 0) {
                let province = me.Provinces.find(x => x.provinceName == value);
                if (province) {
                    let payload = {
                        province_id: province.provinceID
                    };
                    await me.getDistrictsAsync(payload);
                }
            }
        },

        async changeDistrict(value) {
            const me = this;
            if (me.Districts && me.Districts.length > 0) {
                let district = me.Districts.find(x => x.districtName == value);
                if (district) {
                    let payload = {
                        district_id: district.districtID
                    };
                    me.addressInfo.district_id = district.districtID;
                    await me.getWardsAsync(payload);
                }
            }
        },

        async changeWard(value) {
            const me = this;
            if (me.Wards && me.Wards.length > 0) {
                let ward = me.Wards.find(x => x.wardName == value);
                if (ward) {
                    me.addressInfo.ward_code = ward.wardCode;
                }
            }
        },

        async saveDataAsync() {
            const me = this;
            let payload = {};
            if (me.userInfo && me.userInfo.id) {
                payload = { user_id : me.userInfo.id };
            };
            payload = {
                ...payload, ...me.addressInfo
            };
            //Thêm 
            if(me.mode == me.$enum.Mode.Add){
                await me.insertAddressInfoAsync(payload);
            }
            else{ //Sửa
                await me.updateAddressInfoAsync(payload);
            }
            me.$emit("loadData");
            me.closePopup();
        }

    }

}
</script>

<style lang="scss" scoped>

</style>