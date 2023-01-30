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
                    @dbclick="editAddressInfo" :widgetLeft="widgetLeft" @widgetLeftEvent="widgetLeftEvent">
                </dq-grid>
            </div>
        </div>
        <div v-if="showFormAddress">
            <AddressInfoDetail @closePopup="setStateFormAddress(false)" @resetData="resetData" :mode="mode"
                :userInfo="userInfo" :addressInfo="addressInfo" @loadData="loadData"/>
        </div>
    </div>
</template>

<script>
import AddressInfoDetail from './AddressInfoDetail.vue';
import { mapActions, mapGetters } from 'vuex';
import { ModuleUser } from '@/store/module-const';
import WidgetAddress from "./WidgetAddress.vue";
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
            addressInfo: {},
            widgetLeft: {}
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
            "getAddressInfoAsync",
            "setAddressInfoAsync",
            "deleteAddressInfoAsync"
        ]),
        async initData() {
            const me = this;
            me.initDataStatic();
            await me.loadData();
        },

        async loadData() {
            const me = this;
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
            ];

            me.widgetLeft = {
                components: WidgetAddress
            }
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

        async setAddressInfo(params) {
            const me = this;
            if (me.userInfo && me.userInfo.id) {
                let payload = {
                    user_id: me.userInfo.id,
                    id: params.id,
                    is_default: params.is_default
                };
                await me.setAddressInfoAsync(payload);
            }
        },

        async deleteAddressInfo(id) {
            const me = this;
            if (me.userInfo && me.userInfo.id) {
                let payload = {
                    id: id
                };
                await me.deleteAddressInfoAsync(payload);
            }
        },
        resetData() {
            const me = this;
            me.addressInfo = {};
        },
        async widgetLeftEvent(payload) {
            const me = this;
            switch (payload.action) {
                case me.$enum.Action.Edit:
                    await me.editAddressInfo(payload.data);
                    break;
                case me.$enum.Action.Delete:
                    if (payload.data && !payload.data.is_default) {
                        await me.deleteAddressInfo(payload.data.id);
                    }
                    break;
                case me.$enum.Action.SetDefault:
                    if (payload.data) {
                        let params = {
                            id: payload.data.id,
                            is_default: payload.data.is_default
                        }
                        await me.setAddressInfo(params);
                    }
                    break;
                case me.$enum.Action.UnSetDefault:
                    if (payload.data) {
                        let params = {
                            id: payload.data.id,
                            is_default: payload.data.is_default
                        }
                        await me.setAddressInfo(params);
                    }
                    break;
            }
            await me.loadData();
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