<template>
    <div class="cart-pay-bg">
        <div class="flex font-bold justify-center pt-4 text-cart-pay">Thanh toán đơn hàng</div>
        <div class="cart-pay flex">
            <div class="flex-2">
                <div class="address-info p-5">
                    <div class="flex justify-between align-center">
                        <div class="font-bold">Địa chỉ giao hàng</div>
                        <!-- <div class="edit-address cursor-pointer" @click="editAddress">Chỉnh sửa</div> -->
                    </div>
                    <div class="flex mt-5">
                        <div>
                            Tên người nhận: <span class="font-bold" v-if="addressInfo.full_name">{{
                                addressInfo.full_name
                            }}</span><span class="font-bold" v-else>Không có</span>
                        </div>
                        <div class="ml-10">
                            Số điện thoại người nhận: <span class="font-bold" v-if="addressInfo.phone_number">{{
                                addressInfo.phone_number
                            }}</span><span class="font-bold" v-else>Không có</span>
                        </div>
                    </div>
                    <div class="flex mt-5">
                        <div class="text-address">Địa chỉ nhận hàng</div>
                        <div class="flex align-center ml-5 font-bold">{{ addressInfo.address_info }}</div>
                    </div>
                </div>
                <div class="transfer-product-info mt-3 p-5">
                    <div class="flex justify-between align-center">
                        <div class="font-bold">Gói hàng</div>
                        <div>Được giao bởi <span class="font-bold">VHSTORE</span></div>
                    </div>
                    <div class="mt-5">
                        <div class="font-bold">Tùy chọn giao hàng</div>
                        <div class="info-org-transfer mt-2">
                            <div>Phí vận chuyển: <span class="font-bold mr-2">{{ total_ship | formatMoney }} đ</span>
                            </div>
                            <div>Đơn vị vận chuyển: <span class="font-bold">Giao hàng nhanh</span></div>
                            <!-- <div>Nhận vào: <span class="font-bold">2 tháng 2</span></div> -->
                        </div>
                    </div>
                    <div v-if="products && products.length > 0">
                        <div v-for="(product, index) in products" :key="index" class="mt-8 product-info">
                            <div class="flex">
                                <div class="mr-8 flex-1 font-bold">
                                    <div>{{ product.product_name }}</div>
                                    <div>Kích cỡ : {{ product.size_name }}</div>
                                </div>
                                <div class="mr-8 flex-1 font-bold">{{ product.sale_price | formatMoney }}</div>
                                <div class="flex-1">Số lượng: <span class="font-bold">Số lượng: {{
                                    product.number |
                                        formatMoney
                                }}</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="payment-info flex-1 ml-5 p-5">
                <div class="">
                    <div>
                        <div class="flex font-bold">Phương thức thanh toán</div>
                        <div class="flex payment-method align-center mt-4">
                            <div class="icon-payment-cash h-8 w-8"></div>
                            <div class="ml-6">
                                <div class="font-bold">Thanh toán khi nhận hàng</div>
                                <div>Cash On Delivery</div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-10">
                        <div class="font-bold">Thông tin đơn hàng</div>
                        <div class="flex justify-between mt-4">
                            <div>Tạm tính <span>({{ products && products.length > 0 ? products.length : 0 }} sản
                                    phẩm)</span></div>
                            <div class="font-bold">{{ total_amount | formatMoney }} đ</div>
                        </div>
                        <div class="flex justify-between mt-4">
                            <div>Phí vận chuyển</div>
                            <div class="font-bold">{{ total_ship | formatMoney }} đ</div>
                        </div>
                        <div class="border-b1 mt-2"></div>
                        <div class="flex justify-between mt-6">
                            <div>Tổng cộng</div>
                            <div class="font-bold color-totalamount ">{{ total_amount + total_ship | formatMoney}} đ
                            </div>
                        </div>
                    </div>
                    <div class="mt-6">
                        <dq-button :title="`Đặt hàng`" @click="orderNow">
                        </dq-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {
    mapActions, mapGetters
} from 'vuex';
import { ModuleUser, ModuleGHN, ModuleOrder } from '@/store/module-const';
export default {
    name: "CartPay",
    data() {
        return {
            addressInfo: {},
            products: [],
            total_ship: 0,
            total_amount: 0
        }
    },
    created() {
        const me = this;
        let orderPayment = me.$commonFunc.getOrderPayment();
        if (orderPayment && orderPayment.products) {
            me.addressInfo = orderPayment.address_info;
            me.products = orderPayment.products;
            me.total_ship = orderPayment.total_ship;
            me.total_amount = orderPayment.total_amount;
        } else {
            me.$router.push("/cart");
        }
    },
    beforeDestroy() {
        const me = this;
        me.$commonFunc.removeOrderPayment();
    },
    computed: {
        ...mapGetters(["CartProducts"]),
        ...mapGetters(ModuleUser, [
            "AddressInfo",
            "User"
        ]),
        ...mapGetters(ModuleGHN, [
            "Fee"
        ]),
    },
    methods: {
        ...mapActions(ModuleUser, [
            "getAddressInfoDefaultAsync"
        ]),
        ...mapActions(ModuleGHN, [
            "getFeeInfoAsync"
        ]),
        ...mapActions(ModuleOrder, [
            "insertOrderAsync"
        ]),
        /**
         * Lấy thông tin địa chỉ mặc định
         */
        async getAddressInfoDefault() {
            const me = this;
            if (me.User && me.User.id) {
                let payload = {
                    user_id: me.User.id
                };
                await me.getAddressInfoDefaultAsync(payload);
                //Tính fee đơn hàng
                if (me.AddressInfo && me.AddressInfo.id) {
                    payload = {
                        to_ward_code: me.AddressInfo.ward_code,
                        to_district_id: me.AddressInfo.district_id
                    }
                    await me.getFeeInfoAsync(payload);
                }
            }
        },
        /**
         * Sửa đổi địa chỉ
         */
        editAddress() {
            const me = this;

        },
        /**
         * Order đơn hàng
         */
        async orderNow() {
            const me = this;
            if (me.User && me.User.id && me.CartProducts && me.CartProducts.length > 0) {
                let order_items = [];
                order_items = me.CartProducts.map(x => ({
                    product_id : x.id,
                    product_name : x.product_name,
                    quantity : x.number,
                    unit_price : x.sale_price
                }));
                let payload = {
                    user_id: me.User.id,
                    order_status: 1,
                    total_amount : me.total_amount,
                    total_ship : me.total_ship,
                    estimated_date : null,
                    delivery_update_date : null,
                    address : me.AddressInfo.address_info,
                    phone_number : me.AddressInfo.phone_number,
                    receiver_name : me.AddressInfo.full_name,
                    content : "",
                    order_items : order_items
                };
                let res = await me.insertOrderAsync(payload);
                if(res){
                    me.$commonFunc.updateCartByUserAfterPayment(me.User.user_name, me.products.map(x => x.id));
                    me.$router.push("/cart");
                }
            }
        },
    }
}
</script>

<style scoped>
.text-cart-pay {
    font-size: 30px;
}

.cart-pay-bg {
    width: 100%;
    background: #f4f4f4;
    min-height: 600px;
}

.cart-pay {
    padding: 50px;
    width: 90%;
    margin-left: 5%;
    min-height: 600px;
    border-radius: 6px;
}

.address-info {
    background: #fff;
    min-height: 250px;
    border-radius: 6px;
}

.transfer-product-info {
    background: #fff;
    min-height: 250px;
    border-radius: 6px;
}

.payment-info {
    background: #fff;
    min-height: 500px;
    border-radius: 6px;
}

.border-b1 {
    border-bottom: 1px solid #e5e5e5;
}

.edit-address {
    cursor: pointer;
    color: #00aab7;
}

.edit-address:hover {
    color: #1dcddb;
}

.text-address {
    width: 150px;
    background: #1dcddb;
    color: #fff;
    font-weight: bold;
    padding: 10px;
    border-radius: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
}

.info-org-transfer {
    padding: 20px;
    border: 1px solid #1dcddb;
    width: 350px;
    border-radius: 10px;
    cursor: pointer;
}

.product-info {
    border: 1px solid #1dcddb;
    padding: 20px;
    min-height: 100px;
    border-radius: 10px;
}

.payment-method {
    border: 1px solid #1dcddb;
    padding: 20px;
    min-height: 100px;
    border-radius: 10px;
    cursor: pointer;
}

.color-totalamount {
    color: orange;
}
</style>