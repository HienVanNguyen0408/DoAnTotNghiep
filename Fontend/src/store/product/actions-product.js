import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import ProductClient from '../../api/product/product-client';
const productClient = new ProductClient();
export default {
    /**
     * Lấy danh sách sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProducts: async function (context, payload) {
        var res = await productClient.getAsync({
            url : productClient.url,
            queries : payload 
        });
        return res;
    },
    
    /**
     * Lấy danh sách sản phẩm theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProductsPagging: async function (context, payload) {
        var res = await productClient.postAsync({
            url : `${productClient.url}/pagging`,
            data : payload
        });
        return res;
    },

    /**
     * Thông tin sản phẩm theo id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProductById: async function (context, payload) {
        var res = await productClient.getAsync({
            url : `${productClient.url}/${payload}`,
        });
        return res;
    },


    /**
     * Thêm sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertProductAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url : `${productClient.url}/insert`,
            data: payload
        });
        return res;
    },

    /**
     * Cập nhật thông tin của sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateProductAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url : `${productClient.url}/update`,
            data : payload
        });
        return res;
    },

    /**
     * Xóa thông tin sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteProductAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url : `${productClient.url}/delete/${payload}`,
        });
        return res;
    },

    /**
     * Xoá nhiều sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyProductAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url : `${productClient.url}/delete-many`,
            data : payload
        });
        return res;
    },
}