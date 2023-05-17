import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import OrderClient from '../../api/order/order-client';
const controllerName = "Order"
const orderClient = new OrderClient();
export default {
    /**
     * Lấy danh sách đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getOrders: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : orderClient.url,
            queries : payload 
        }, true);
        return res;
    },
    
    /**
     * Lấy danh sách đơn hàng theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getOrderPageAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/pagging`,
            data : payload
        }, true);

        if(res && res.data){
            context.commit('updateOrderPage',res.data);
        }
        return res;
    },

    getOrderUserPageAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/orderuser/${payload.user_id}/${payload.status}`,
            data : payload
        } , true);

        if(res && res.data){
            context.commit('updateOrderPage',res.data);
        }
        return res;
    },
    /**
     * Thông tin đơn hàng theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getOrderAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/${payload.id}`,
        });

        if(res && res.data){
            return res.data;
        }
        return res;
    },


    /**
     * Thêm đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertOrderAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/insert`,
            data: payload
        }, true);
        return res;
    },

    /**
     * Cập nhật thông tin đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateOrderAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/update`,
            data : payload
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteOrderAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/delete/${payload}`,
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Xoá nhiều đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyOrderAsync: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/delete-many`,
            data : payload
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Xoá nhiều đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getSalesStatisticAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/salesstatistics?periodType=${payload}`
        }, true);
        if(res && res.data){
            context.commit('updateSalesStatistic', res.data);
            return res.data;
        }
        return res;
    },
}