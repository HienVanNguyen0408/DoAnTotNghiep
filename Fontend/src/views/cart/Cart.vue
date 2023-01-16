<template>
    <div class="cart-products">
        <div class="flex justify-center align-center font-bold">Giỏ hàng của bạn</div>
        <div v-if="selected && selected.length > 0" class="text-select mb-5">
            <div>
                Đã chọn <span class="font-bold">{{ selected.length }}</span> sản phẩm
            </div>
            <div class="flex text-center ml-4" @click="deleteCart">
                <dq-button class="font-bold" :title="'Xóa'">
                </dq-button>
            </div>
        </div>
        <div v-if="CartProducts && CartProducts.length > 0">
            <div class="flex">
                <div class="dq-grid mt-5 flex-5 mr-10">
                    <dq-grid ref="gridProduct" :data="CartProducts" :columns="columns" serial="true" checkbox="true"
                        :textPage="'Sản phẩm'" @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
                    </dq-grid>
                </div>
                <div class="flex-2 form-confirm-order">
                    <div class="address-info">
                        <div class="font-bold">Địa điểm</div>
                        <div></div>
                    </div>
                    <div class="payment-info">
                        <div class="font-bold mt-2 mb-4">Thông tin đơn hàng</div>
                        <div class="ml-3">
                            <div class="flex align-center justify-between mb-4">
                                <div>Tạm tính( <span>{{ selected && selected.length > 0 ? selected.length : 0 }}</span>
                                    sản phẩm )</div>
                                <div>{{ totalMoney | formatMoney}}đ</div>
                            </div>
                            <div class="flex align-center justify-between mb-4">
                                <div>Phí vận chuyển</div>
                                <div>{{ totalFeeShip | formatMoney}}đ</div>
                            </div>
                            <div class="flex align-center justify-between mb-4">
                                <div>Tổng cộng</div>
                                <div class="color-totalamount">{{ totalFeeShip + totalMoney | formatMoney}}đ</div>
                            </div>
                        </div>
                        <div class="btn-confirm-order">
                            <dq-button
                                :title="`Xác nhận giỏ hàng(${selected && selected.length > 0 ? selected.length : 0})`"
                                @click="confirmPayment">
                            </dq-button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div v-else class="not-oder-cart">
            <div>
                <div class="text-not-order">Không có sản phẩm nào trong giỏ hàng của bạn</div>
                <dq-button @click="buyProduct" :title="'Tiếp tục mua hàng'">
                </dq-button>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions, mapGetters
} from 'vuex';
export default {
    name: "Cart",
    data() {
        return {
            orders: [],
            selectMul: false,
            ordersSelect: [],
            columns: [],
            params: {
                pageSize: 20,
                pageIndex: 1,
                filter: "",
                totalPages: 0
            },
            selected: [],
        }
    },
    created() {
        const me = this;
        me.initData();
        me.getOrders();
    },
    beforeDestroy() {
        const me = this;
        // me.updateCart();
    },
    mounted() { },
    watch: {},
    computed: {
        ...mapGetters(["CartProducts"]),
        totalAmount() {
            const me = this;
            if (me.CartProducts && me.CartProducts.length > 1) {
                return me.CartProducts.reduce((a, {
                    number
                }) => a + number, 0);
            }
            if (me.CartProducts && me.CartProducts.length == 1) {
                return me.CartProducts[0].number;
            }
            return 0;
        },
        totalMoney(){
            const me = this;
            if (me.selected && me.selected.length > 0) {
                if(me.selected.length > 1){
                    return me.selected.reduce((a, {
                        total_amount
                    }) => a + total_amount, 0);
                }
                else if(me.selected.length == 1){
                    return me.selected[0].total_amount;
                }
            }
            return 0;
        },
        totalFeeShip(){
            const me = this;
           
            return 0;
        }
    },
    methods: {
        ...mapActions(["getCartByUser"]),
        initData() {
            const me = this;
            me.initDataStatic();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Tên sản phẩm',
                    dataField: 'product_name',
                },
                {
                    title: 'Đơn giá',
                    dataField: 'sale_price',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Số lượng',
                    dataField: 'number',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Thành tiền',
                    dataField: 'total_amount',
                    format: me.$enum.Format.Money
                }
            ]
        },

        /**
         * Lấy đanh sách đơn hàng trrong giỏ
         */
        async getOrders() {
            const me = this;
            let userName = me.$commonFunc.getUserName();
            await me.getCartByUser(userName);
        },
        /**
         * Xóa đơn hàng
         */
        removeOrder(index) {
            const me = this;
            me.orders.splice(index, 1);
        },
        /**
         * Hàm sử lí việc giảm sản phẩm của từng dòng 
         */
        minusOrder(index) {
            const me = this;
            if (me.orders[index].amount > 1) {
                me.orders[index].amount -= 1;
            } else {
                me.removeOrder(index);
            }
        },
        /**
         * Hàm sử lí việc thêm sản phẩm của từng dòng 
         */
        plusOrder(index) {
            const me = this;
            if (me.orders[index].amount <= 100) {
                me.orders[index].amount += 1;
            }
        },
        /**
         * tiếp tục mua
         */
        buyProduct() {
            const me = this;
            me.$router.push("/category")
        },

        resetCart() {
            const me = this;
            if (me.$commonFunc.getUserName()) {
                me.$commonFunc.resetCartByUser(me.$commonFunc.getUserName());
            }
        },
        /**
         * Hàm sử lí việc cập nhật lại giỏ hàng
         */
        async updateCart() {
            const me = this;
            me.resetCart();
            if (me.orders) {
                for (let i = 0; i < me.orders.length; i++) {
                    me.$commonFunc.addCart(me.$commonFunc.getUserName(), me.orders[i]);
                }
            }
            await me.getOrders();
        },
        /**
         * hàm sử lí xác nhận thanh toán
         */
        confirmPayment() {
            const me = this;
            if (me.totalMoney != 0) {
                me.$router.push("/cart-pay");
                me.updateCart();
            }
        },
        clickMultiple() {
            const me = this;
            if (!me.selectMul) {
                me.selectOrders(true);
            }
            else {
                me.selectOrders(false);
            }
        },
        selectOrders(status) {
            const me = this;
            if (me.orders && me.orders.length > 0) {
                me.orders = me.orders.map((x) => {
                    return {
                        selected: status,
                        amount: x.amount,
                        product: x.product
                    }
                })
            }
        },
        deleteCart() {
            const me = this;
            me.orders = [...me.orders.filter(x => !x.selected)];
            me.updateCart();
        },
        /**
         * Check row grid
         */
        checkboxOne(selected) {
            const me = this;
            if (!selected || selected.length <= 0) me.selected = [];
            me.selected = [...selected];
        },

        /**
         * Check all data in grid
         * @param {*} selecteds 
         */
        checkboxMulti(selected) {
            const me = this;
            if (!selected || selected.length <= 0) me.selected = [];
            me.selected = [...selected];
        },
    }
}
</script>

<style scoped>
.text-select {
    font-size: 20px;
    display: flex;
    margin-top: 20px;
    align-items: center;
}
.form-confirm-order {
    border: 2px solid #e5e5e5;
    padding: 30px;
}

.color-totalamount {
    color: orange;
}

.btn-confirm-order {}
</style>