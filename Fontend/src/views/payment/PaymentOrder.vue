<template>
    <div @click="paymentOrder" class="payment-order">
        Thanh toán
    </div>
</template>

<script>
export default {
    name: "PaymentOrder",
    data() {
        return {

        }
    },
    methods: {
        /**
         * Hàm sử lí thánh toán momo
         */
        paymentOrder() {
            const me = this;
        }
    }
}
</script>

<style scoped>
.payment-order{
    cursor: pointer;
    font-size: 30px;
    font-weight: bold;
}
</style>