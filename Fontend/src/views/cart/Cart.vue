<template>
    <div class="cart-products">
        <div class="flex justify-center align-center font-bold text-cart">Giỏ hàng của bạn</div>
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
                        <div class="flex">
                            <div class="font-bold">Địa điểm</div>
                            <div v-if="!AddressInfo || !AddressInfo.id" class="ml-3 text-add-address font-bold" @click="insertAddress">Thêm địa chỉ</div>
                            <div v-else class="ml-3">{{ AddressInfo.address_info }}</div>
                        </div>
                        <div v-if="AddressInfo && AddressInfo.address_info"  class="text-edit-address">
                            <span class="cursor-pointer " @click="editInfoAddress">Chỉnh sửa</span>
                        </div>
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
                                <div>
                                    <div>Phí vận chuyển</div>
                                    <div>(Đơn vị vận chuyển: GHN)</div>
                                </div>
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
                <div class="text-not-order flex justify-center align-center mt-8">Không có sản phẩm nào trong giỏ hàng của bạn</div>
                <div class="flex justify-center align-center mt-8">
                    <dq-button @click="buyProduct" class="continue-buy" :title="'Tiếp tục mua hàng'">
                    </dq-button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions, mapGetters
} from 'vuex';
import { ModuleUser, ModuleGHN } from '@/store/module-const';
export default {
    name: "Cart",
    components:{
    },
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
        ...mapGetters(ModuleUser, [
            "AddressInfo",
            "User"
        ]),
        ...mapGetters(ModuleGHN, [
            "Fee"
        ]),
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
        totalMoney() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                if (me.selected.length > 1) {
                    return me.selected.reduce((a, {
                        total_amount
                    }) => a + total_amount, 0);
                }
                else if (me.selected.length == 1) {
                    return me.selected[0].total_amount;
                }
            }
            return 0;
        },
        totalFeeShip() {
            const me = this;
            if(me.Fee && me.Fee.total > 0) return me.Fee.total;
            return 0;
        }
    },
    methods: {
        ...mapActions(["getCartByUser"]),
        ...mapActions(ModuleUser, [
            "getAddressInfoDefaultAsync",
        ]),
        ...mapActions(ModuleGHN, [
            "getFeeInfoAsync"
        ]),
        async initData() {
            const me = this;
            me.initDataStatic();
            await me.getAddressInfoDefault();
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
         * Lấy thông tin địa chỉ mặc định
         */
        async getAddressInfoDefault(){
            const me = this;
            if (me.User && me.User.id) {
                let payload = {
                    user_id: me.User.id
                };
                await me.getAddressInfoDefaultAsync(payload);
                //Tính fee đơn hàng
                if(me.AddressInfo && me.AddressInfo.id){
                    payload = {
                        to_ward_code : me.AddressInfo.ward_code,
                        to_district_id : me.AddressInfo.district_id
                    }
                    await me.getFeeInfoAsync(payload);
                }
            }
        },
        /**
         * Lấy đanh sách đơn hàng trrong giỏ
         */
        async getOrders() {
            const me = this;
            if(me.User && me.User.user_name){
                await me.getCartByUser(me.User.user_name);
            }
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
            me.$router.push("/product")
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
            if (me.selected && me.selected.length > 0) {
                let paymentOrder = {
                    products : me.selected,
                    total_ship : me.totalFeeShip,
                    total_amount : me.totalMoney,
                    address_info : me.AddressInfo
                }
                me.$commonFunc.addOrderPayment(paymentOrder);
                me.$router.push("/cartpay");
                // me.updateCart();
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
        /**
         * Thêm địa chỉ nhận hàng
         */
        insertAddress(){
            const me = this;
            me.$router.push("/address-info");
        },

        editInfoAddress(){
            const me = this;
            me.$router.push("/address-info");
        }

    }
}
</script>

<style scoped>
.text-cart{
    font-size: 30px;
}
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
.text-add-address{
    cursor: pointer;
    color: #00aab7;
}
.text-add-address:hover{
    color: #1dcddb;
}

.text-edit-address{
    cursor: pointer;
    color: #00aab7;
}
.text-edit-address:hover{
    color: #1dcddb;
}
.continue-buy{
    width: 150px;
}
</style>