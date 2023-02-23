<template>
    <div class="dq-content">
        <div class="menus-order flex">
            <div class="menu-order" v-for="(menu,index) in menus" :key="index" :class="menuIndex == index ? 'menu-order-active' : ''" @click="changeMenu(menu)">
                <div>{{ menu.title }}</div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridOrder" :data="Orders" :columns="columns" serial="true" pagination="true"
                :dataPagination="params" :textPage="'Đơn hàng'" @getData="getDataPagging"
                >
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
import { ModuleOrder, ModuleUser } from '@/store/module-const';
export default {
    name: "OrderUser",
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
                totalPages: 0,
                status : this.$enum.OrderStatus.All
            },
            columns: [],
            isShow: false,
            mode: this.$enum.Mode.Add,
            selected: [],
            menus: [],
            menuIndex : 0
        }
    },
    computed: {
        ...mapGetters(ModuleOrder, [
            'OrderPage',
            'Orders',
            'TotalPage',
            'TotalRecords'
        ]),
        ...mapGetters(ModuleUser, [
            'User',
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleOrder, [
            'getOrders',
            'getOrderUserPageAsync',
            'getOrderAsync',
            'insertOrderAsync',
            'updateOrderAsync',
            'deleteOrderAsync',
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
                    title: 'Trạng thái đơn hàng',
                    dataField: 'order_status',
                    format: me.$enum.Format.OrderStatus
                },
                {
                    title: 'Thời gian tạo đơn',
                    dataField: 'created_date',
                    format: me.$enum.Format.Date
                },
            ];

            me.menus = [
                {
                    id: "all",
                    title: "Tất cả",
                    status: me.$enum.OrderStatus.All
                },
                {
                    id: "success",
                    title: "Giao hàng thành công",
                    status: me.$enum.OrderStatus.Success
                },
                {
                    id: "fail",
                    title: "Giao hàng thất bại",
                    status: me.$enum.OrderStatus.Fail
                },
                {
                    id: "transfer",
                    title: "Đang gói vận chuyển",
                    status: me.$enum.OrderStatus.Transfering
                },
                {
                    id: "order",
                    title: "Đặt hàng",
                    status: me.$enum.OrderStatus.Order
                },
            ]
        },

        async loadDataOrders() {
            const me = this;
            let params = me.getPayload()
            await me.getOrderUserPageAsync(params);
            if (me.OrderPage) {
                me.params.pageIndex = me.OrderPage.pageIndex;
                me.params.pageSize = me.OrderPage.pageSize;
                me.params.totalRecord = me.OrderPage.totalRecord;
                me.params.totalPages = me.OrderPage.totalPages;
                me.params.status = me.$enum.OrderStatus.All
            }
        },
        getPayload() {
            const me = this;
            return {
                PageIndex: me.params.pageIndex,
                PageSize: me.params.pageSize,
                Filter: me.params.filter,
                user_id: me.User.id,
                status : me.$enum.OrderStatus.All
            };
        },

        async getDataPagging(params) {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            params.user_id = me.User.id;
            params.status = me.$enum.OrderStatus.All;
            await me.getOrderUserPageAsync(params);
        },
            
        async changeMenu(menu) {
            const me = this;
            let index = me.menus.findIndex(x => x.id == menu.id);
            if(index >= 0){
                me.menuIndex = index;
            }
            let params = me.getPayload();
            params.status = menu.status;
            await me.getOrderUserPageAsync(params);
            if (me.OrderPage) {
                me.params.pageIndex = me.OrderPage.pageIndex;
                me.params.pageSize = me.OrderPage.pageSize;
                me.params.totalRecord = me.OrderPage.totalRecord;
                me.params.totalPages = me.OrderPage.totalPages;
                me.params.status = menu.status;
            }
        },


    }
}
</script>

<style scoped>
.menu-order{
    padding: 15px;
    align-items: center;
    display: flex;
    cursor: pointer;
    border-radius: 6px;
    color: #000;
    font-weight: bold;
}
.menu-order:hover, .menu-order:active{
    color: orange;
}

.menu-order-active{
    color: orange;
}
</style>