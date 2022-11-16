import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import BlogClient from '../../api/blog/blog-client';
const blogClient = new BlogClient();
export default {
    /**
     * Lấy danh sách bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogs: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : blogClient.url,
            queries : payload 
        });
        return res;
    },
    
    /**
     * Lấy danh sách bài viết theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogsPagging: async function (context, payload) {
        var res = await blogClient.postAsync({
            url : `${blogClient.url}/pagging`,
            data : payload
        });
        return res;
    },

    /**
     * Thông tin bài viết theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogById: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : `${blogClient.url}/${payload}`,
        });
        return res;
    },

    /**
     * Thêm bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertBlogAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : `${blogClient.url}/insert`,
            data: payload
        });
        return res;
    },

    /**
     * Cập nhật thông tin của bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateBlogAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : `${blogClient.url}/update`,
            data : payload
        });
        return res;
    },

    /**
     * Xóa thông tin bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteBlogAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : `${blogClient.url}/delete/${payload}`,
        });
        return res;
    },

    /**
     * Xoá nhiều bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteManyBlogAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url : `${blogClient.url}/delete-many`,
            data : payload
        });
        return res;
    },
}