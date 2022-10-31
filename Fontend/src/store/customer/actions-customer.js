import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import CustomerClient from '@/api/customer/customer-client';
const controllerName = "UserInfo"
const customerClient = new CustomerClient();
export default {
    /**
     * Lấy danh sách khách hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getCustomers: async function (context, payload) {
        var res = await customerClient.getAsync({
            url : customerClient.url,
            queries : payload 
        });
        if(res && res.Data){
            context.commit("updateCustomers",res.Data);
        }
        return res;
    },
    
    /**
     * Lấy danh sách khách hàng theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getCustomersPagging: async function (context, payload) {
        var res = await customerClient.postAsync({
            url : `${customerClient.url}/customers/pagging`,
            data : payload
        });

        if(res && res.Data){
            context.commit("updateCustomersPagging",res);
        }
        return res;
    },

    /**
     * Thông tin khách hàng theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getCustomerById: async function (context, payload) {
        var res = await customerClient.getAsync({
            url : `${customerClient.url}/${payload}`,
        });
        return res;
    },
    
    /**
     * Cập nhật thông tin của khách hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateCustomerAsync: async function (context, payload) {
        var res = await customerClient.getAsync({
            url : `${customerClient.url}/update/${payload}`,
            data : payload
        });
        return res;
    },

    /**
     * Xóa thông tin khách hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteCustomerAsync: async function (context, payload) {
        let customerClient = new customerClient(); 
        var res = await customerClient.getAsync({
            url : `${customerClient.url}/delete/${payload}`,
        });
        return res;
    },

    /**
     * Xoá nhiều khách hàng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyCustomerAsync: async function (context, payload) {
        let customerClient = new customerClient(); 
        var res = await customerClient.getAsync({
            url : `${customerClient.url}/delete-many`,
            data : payload
        });
        return res;
    },
}