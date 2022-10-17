import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import MomoClient from '@/api/momo/momo-client';
const controllerName = "Momo"
const momoClient = new MomoClient();
export default {
    /**
     * Thanh toán đơn hàng bằng momo
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    paymentOrderMomo: async function (context, payload) {
        var res = await momoClient.postAsync({
            url : `${momoClient.url}/payment-momo`,
            data : payload
        });
        return res;
    },

    
}