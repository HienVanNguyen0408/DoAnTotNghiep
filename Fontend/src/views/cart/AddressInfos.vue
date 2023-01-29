<template>
    <div>
        <div class="flex justify-between">
            <div class="font-bold title-address">Danh sách địa chỉ</div>
            <div>
                <dq-button class="btn-add-address font-bold" :title="'Thêm địa chỉ'" @click="insertAddress">
                </dq-button>
            </div>
        </div>
        <div></div>
        <div class="mt-5">
            <div class="grid-address-infos">
                <dq-grid ref="gridAddress" :data="AddressInfos" :columns="columns" serial="true"
                    @dbclick="editAddressInfo">
                </dq-grid>
            </div>
        </div>
        <div v-if="showFormAddress">
            <AddressInfoDetail @closePopup="setStateFormAddress(false)" @resetData="resetData"
            :mode="mode" :userInfo="userInfo"
                :addressInfo="addressInfo" />
        </div>
    </div>
</template>

<script>
import AddressInfoDetail from './AddressInfoDetail.vue';
import { mapActions, mapGetters } from 'vuex';
import { ModuleUser } from '@/store/module-const';
export default {
    name: "AddressInfos",
    components: {
        AddressInfoDetail
    },
    data() {
        return {
            columns: [],
            userInfo: {},
            showFormAddress: false,
            mode: this.$enum.Mode.Add,
            addressInfo: {}
        }
    },
    computed: {
        ...mapGetters(ModuleUser, [
            "AddressInfos",
            "AddressInfo"
        ])
    },
    created() {
        const me = this;
        let user = me.$commonFunc.getUserInfo();
        if (user) {
            me.userInfo = user;
        }
        me.initData();
    },
    methods: {
        ...mapActions(ModuleUser, [
            "getAddressInfosAsync",
            "getAddressInfoAsync"
        ]),
        async initData() {
            const me = this;
            me.initDataStatic();
            if (me.userInfo && me.userInfo.id) {
                let payload = {
                    user_id: me.userInfo.id
                };
                await me.getAddressInfosAsync(payload);
            }
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Họ tên',
                    dataField: 'full_name',
                },
                {
                    title: 'Địa chỉ nhà riêng',
                    dataField: 'address',
                },
                {
                    title: 'Thông tin địa chỉ',
                    dataField: 'address_info',
                },
                {
                    title: 'Số điện thoại',
                    dataField: 'phone_number',
                }
            ]
        },
        editAddressInfo(value) {
            const me = this;
            me.mode = me.$enum.Mode.Edit;
            me.setStateFormAddress(true);
            me.addressInfo = value;
        },
        /**
         * Sự kiện click button thêm địa chỉ
         */
        insertAddress() {
            const me = this;
            me.setStateFormAddress(true);
        },

        setStateFormAddress(statusForm) {
            const me = this;
            me.showFormAddress = statusForm;
        },
        resetData(){
            const me = this;
            me.addressInfo = {};
        }
    }
}
</script>

<style scoped>
.title-address {
    font-size: 22px;
}

.btn-add-address {
    width: 130px;
}
</style>