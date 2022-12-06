import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import UserClient from '../../api/user/user-client';
const controllerName = "UserInfo"
const userClient = new UserClient();
export default {
    /**
     * Lấy danh sách người dùng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getUsers: async function (context, payload) {
        var res = await userClient.getAsync({
            url : userClient.url,
            queries : payload 
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },
    
    /**
     * Lấy danh sách người dùng theo điều kiện lọc
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getUsersPagging: async function (context, payload) {
        var res = await userClient.postAsync({
            url : `${userClient.url}/pagging`,
            data : payload
        });
        if(res){
            context.commit('updatePaggingUsers',res.data);
        }
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Thông tin người dùng theo Id
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getUserById: async function (context, payload) {
        var res = await userClient.getAsync({
            url : `${userClient.url}/${payload}`,
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Thông tin người dùng theo tài khoản của người dùng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    getUserByUserName: async function (context, payload) {
        var res = await userClient.getAsync({
            url : `${userClient.url}/userName/${payload}`,
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Đăng ký tài khoản
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    registerUserAsync: async function (context, payload) {
        var res = await userClient.getAsync({
            url : `${userClient.url}/register`,
            data: payload
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Cập nhật thông tin của người dùng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
    updateUserAsync: async function (context, payload) {
        var res = await userClient.postAsync({
            url : `${userClient.url}/update`,
            data : payload
        });

        if(res && res.data){
            return res.data;
        }
        return res;
    },

    /**
     * Xóa thông tin người dùng
     * @param {*} context 
     * @param {*} payload 
     * @returns 
     */
     deleteUserAsync: async function (context, payload) {
        let userClient = new UserClient(); 
        var res = await userClient.getAsync({
            url : `${userClient.url}/delete`,
            data : payload
        });
        if(res && res.data){
            return res.data;
        }
        return res;
    },
}