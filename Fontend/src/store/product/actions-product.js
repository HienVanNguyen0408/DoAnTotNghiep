import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import ProductClient from '../../api/product/product-client';
const productClient = new ProductClient();
export default {

    /**
     * Lấy danh sách sản phẩm theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProductPageAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/pagging`,
            data: payload
        });

        if (res) {
            context.commit('updateProductPage',res.data);
            return res.data;
        }
        return res;
    },

    /**
     * Thông tin sản phẩm theo id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProductAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url: `${productClient.url}/${payload}`,
        });

        if (res) {
            context.commit('updateProduct',res.data);
            return res.data;
        }
        return res;
    },


    /**
     * Thêm sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertProductAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/insert`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Cập nhật thông tin của sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateProductAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/update`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteProductAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/delete`,
            data : payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xoá nhiều sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyProductAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/delete-many`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },


    //=======================================
    //Loại sản phẩm
    /**
    * Lấy danh sách loại sản phẩm phân trang
    * @param {*} context 
    * @param {*} payload 
    * @returns 
    */
    getPageProductCategoriesAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/pagging`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },


    /**
     * Thông tin loại sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getProductCategoryAsync: async function (context, payload) {
        var res = await productClient.getAsync({
            url: `${productClient.url}/productcategory/${payload}`,
        });

        if (res) {
            return res.data;
        }
        return res;
    },


    /**
     * Thêm loại sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertProductCategoryAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/insert-productcategory`,
            data: payload
        });
        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Cập nhật thông tin loại sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateProductAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/update-productcategory`,
            data: payload
        });
        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin loại sản phẩm
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteProductCategoryAsync: async function (context, payload) {
        var res = await productClient.postAsync({
            url: `${productClient.url}/delete-productcategory`,
        });
        if (res) {
            return res.data;
        }
        return res;
    },
}