<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex-1">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterOrders">
                        </dq-input>
                    </div>
                </div>
                <!-- <div class="flex-1 flex jus-right">
                    <div class="btn-add">
                        <dq-button :title="'Thêm đơn hàng'"></dq-button>
                    </div>
                </div> -->
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridOrder" :data="Orders" :columns="columns" serial="true" checkbox="true"
                pagination="true" :dataPagination="params" :textPage="'Đơn hàng'" @dbclick="editDataOrder"
                @getData="getDataPagging" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleOrder } from '@/store/module-const';
export default {
    name: "AdminOrder",
    components: {},
    props: {},
    data() {
        return {
            params: {
                fromDate: this.$dateRange.getDateDefault(),
                toDate: this.$dateRange.getDateDefault(),
                pageSize: 20,
                pageIndex: 1,
                filter: "",
                totalPages: 0
            },
            columns: [],
            isShow: false,
            mode: this.$enum.Mode.Add,
            selected: []
        }
    },
    computed: {
        ...mapGetters(ModuleOrder, [
            'OrderPage',
            'Orders',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleOrder, [
            'getOrders',
            'getOrderPageAsync',
            'getOrderAsync',
            'insertOrderAsync',
            'updateOrderAsync',
            'deleteOrderAsync',
            'deleteManyOrderAsync'
        ]),

        initData() {
            const me = this;
            me.initDataStatic();
            me.loadDataOrders();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Địa chỉ nhận hàng',
                    dataField: 'address',
                },
                {
                    title: 'SDT người nhận',
                    dataField: 'phone_number',
                },
                {
                    title: 'Người nhận hàng',
                    dataField: 'receiver_name',
                },
                {
                    title: 'Tổng tiền đơn hàng',
                    dataField: 'total_amount',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Phương phức thanh toán',
                    dataField: 'payment_method',
                    format: me.$enum.Format.PaymentMethods
                },
                {
                    title: 'Thời gian dự tính giao hàng',
                    dataField: 'estimated_date'
                },
                {
                    title: 'Thời gian cập nhật quá trình vận chuyển',
                    dataField: 'delivery_update_date',
                },
                {
                    title: 'Trạng thái đơn hàng',
                    dataField: 'order_status',
                    format: me.$enum.Format.OrderStatus
                },
                {
                    title: 'Ghi chú đơn hàng',
                    dataField: 'content',
                },
            ]
        },

        async loadDataOrders() {
            const me = this;
            let params = me.getPayload()
            await me.getOrderPageAsync(params);
            if (me.OrderPage) {
                me.params.pageIndex = me.OrderPage.pageIndex;
                me.params.pageSize = me.OrderPage.pageSize;
                me.params.totalRecord = me.OrderPage.totalRecord;
                me.params.totalPages = me.OrderPage.totalPages;
            }
        },
        getPayload() {
            const me = this;
            return {
                PageIndex: me.params.pageIndex,
                PageSize: me.params.pageSize,
                Filter: me.params.filter
            };
        },

        async getDataPagging(params) {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getOrderPageAsync(params);
        },

        /*
        *Hàm lọc danh sách
        */
        filterOrders: _.debounce(async function () {
            const me = this;
            await me.loadDataOrders();
        }, 1000),
        /**
         * Xóa nhiều
         */
        async deleteManyOrder() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    orderIds: me.selected.map(x => x.order_id)
                }
                let res = await me.deleteManyOrderAsync(params);
                if (res) {
                    me.loadDataOrders();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        editDataOrder() {
            const me = this;
        },

        /**
        * Check row grid
        */
        checkboxOne(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },

        /**
         * Check all data in grid
         * @param {*} selecteds 
         */
        checkboxMulti(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },


    }
}
</script>

<style scoped>

</style>