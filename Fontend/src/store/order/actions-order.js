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
        });
        return res;
    },
    
    /**
     * Lấy danh sách đơn hàng theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getOrdersPagging: async function (context, payload) {
        var res = await orderClient.postAsync({
            url : `${orderClient.url}/pagging`,
            data : payload
        });
        return res;
    },

    /**
     * Thông tin đơn hàng theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getOrderById: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/${payload}`,
        });
        return res;
    },


    /**
     * Thêm đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertOrderAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/insert`,
            data: payload
        });
        return res;
    },

    /**
     * Cập nhật thông tin đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateUserAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/update`,
            data : payload
        });
        return res;
    },

    /**
     * Xóa thông tin đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteOrderAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/delete/${payload}`,
        });
        return res;
    },

    /**
     * Xoá nhiều đơn hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyOrderAsync: async function (context, payload) {
        var res = await orderClient.getAsync({
            url : `${orderClient.url}/delete-many`,
            data : payload
        });
        return res;
    },
}