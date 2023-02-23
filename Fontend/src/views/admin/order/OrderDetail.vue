<template>
    <div class="dq-detail" v-if="isShow">
        <dq-popup @closePopup="closePopup" :width="400" :height="200">
            <template slot="header">
                <div class="dq-titlte">
                    {{ titlleMode }}
                </div>
            </template>
            <template slot="content">
                <div class="h-row flex dq-mgt-10">
                    <div class="h-col flex-1 dq-mgr-10">
                        <dq-combobox :class="'w-100'" :title="'Trạng thái đơn hàng'" :classTitle="'h-mb-5 font-bold'"
                            :placeholder="'Trạng thái đơn hàng'" :data="orderLstStatus" :keyData="'id'"
                            :display="'name'" :value.sync="order.order_status"
                            :defaultValue="orderStatusDefault" ref="orderStatus">
                        </dq-combobox>
                    </div>
                </div>
            </template>
            <template slot="footer">
                <div style="width:100%">
                    <div class="flex jus-right">
                        <dq-button
                            :title="'Hủy bỏ'"
                            @click="closePopup"
                        >
                        </dq-button>
                        <dq-button
                            class="dq-mgl-10"
                            :title="'Cập nhật'"
                            @click="saveDataAsync"
                        >
                        </dq-button>
                    </div>
                </div>
            </template>
        </dq-popup>
    </div>
</template>
<script>
import { mapActions } from "vuex";
import { ModuleOrder } from "@/store/module-const";
export default {
    name: "AdminOrderDetail",
    props: {
        isShow: {
            typeof: Boolean,
            default: false
        },
        order: {
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
            orderLstStatus : []
        }
    },
    watch: {
    },
    mounted() {
    },
    computed: {
        titlleMode() {
            const me = this;
            if (me.mode == me.$enum.Mode.Add) {
                return me.$t('i18nAdmin.AddOrder');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditOrder');
            }
            return "";
        },
        orderStatusDefault() {
            const me = this;
            if (me.orderLstStatus && me.orderLstStatus.length > 0) {
                if (!me.order.order_status) { me.order.order_status = me.orderLstStatus[0].id; }
                return me.orderLstStatus[0].id;
            }
            return '';
        },
    },
    created(){
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleOrder, [
            "updateOrderAsync",
        ]),
        initData(){
            const me = this;
            me.initDataStatic();
        },
        initDataStatic(){
            const me = this;
            me.orderLstStatus = [
                {
                    id: me.$enum.OrderStatus.Order,
                    name: 'Đặt hàng'
                },
                {
                    id: me.$enum.OrderStatus.Transfering,
                    name: 'Đang vận chuyển'
                },
                {
                    id: me.$enum.OrderStatus.Success,
                    name: 'Thành công'
                },
                {
                    id: me.$enum.OrderStatus.Fail,
                    name: 'Thất bại'
                },
                {
                    id: me.$enum.OrderStatus.Cancel,
                    name: 'Hủy'
                },
            ];
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
            if (me.mode == me.$enum.Mode.Edit) {
                await me.updateOrderAsync(me.order);
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
        },

        resetData(){
            const me = this;
            me.$emit('resetData');
        }
    }
}
</script>

<style scoped>
@import url('@/assets/contents/css/views/admin/detail/detail.css');
</style>