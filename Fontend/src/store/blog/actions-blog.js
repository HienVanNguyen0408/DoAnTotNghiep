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
            url: blogClient.url,
            queries: payload
        }, true);

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Lấy danh sách bài viết theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogPageAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/pagging`,
            data: payload
        }, true);

        if (res && res.data) {
            context.commit('updateBlogPage', res.data);
            return res.data;
        }
        return res;
    },

    /**
     * Thông tin bài viết theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url: `${blogClient.url}/${payload.id}`,
        }, true);

        if (res) {
            context.commit("updateBlog", res.data);
            return res.data;
        }
        return res;
    },

    /**
     * Thêm bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertBlogAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/insert`,
            data: payload
        }, true);

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Cập nhật thông tin của bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateBlogAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/update`,
            data: payload
        }, true);

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteBlogAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/delete`,
            data: payload
        }, true);

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
     deleteBlogsAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/delete-many`,
            data: payload
        }, true);

        if (res) {
            return res.data;
        }
        return res;
    },


    //======================
    //Loại bài viết
    /**
     * Lấy danh sách loại bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogCategories: async function (context, payload) {
        var res = await blogClient.getAsync({
            url: `${blogClient.url}/categories`,
            queries: payload
        });

        if (res) {
            context.commit('updateBlogCategores', res.data);
            return res.data;
        }
        return res;
    },

    /**
     * Lấy danh sách loại bài viết phân trang
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBlogCategoryPageAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/category-pagging`,
            data: payload
        });

        if (res) {
            context.commit('updateBlogCategoryPage', res.data);
            return res.data;
        }
        return res;
    },

    /**
     * Thông tin chi tiết loại bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getBLogCategoryAsync: async function (context, payload) {
        var res = await blogClient.getAsync({
            url: `${blogClient.url}/category/${payload}`,
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Thêm loại bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    insertBlogCategoryAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/category-insert`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Cập nhật thông tin của bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateBlogCategoryAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/category-update`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin loại bài viết
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    deleteBlogCategoryAsync: async function (context, payload) {
        var res = await blogClient.postAsync({
            url: `${blogClient.url}/category-delete`,
            data: payload
        });

        if (res) {
            return res.data;
        }
        return res;

    },
}