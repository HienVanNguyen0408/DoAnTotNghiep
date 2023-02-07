import { BASE_URL } from '@/api/url';
import axios from 'axios';
const keyJwt = "Jwt";
const keyUser = "UserInfo";
class Auth {
    setUser(user) {
        if (user) {
            localStorage.setItem(keyUser, JSON.stringify(user));
        }
    }
    deleteUserStorage() {
        localStorage.removeItem(keyUser);
    }
    getUserStorage() {
        let user = localStorage.getItem(keyUser);
        if (user) {
            user = JSON.parse(user);
            return user;
        }
        return user;
    }
    setToken(data) {
        if (data) {
            localStorage.setItem(keyJwt, JSON.stringify(data));
        }
    }
    deleteTokenStorage() {
        localStorage.removeItem(keyJwt);
    }
    getTokenStorage() {
        let token = localStorage.getItem(keyJwt);
        if (token) {
            token = JSON.parse(token);
            return token;
        }
        else {
            return null;
        }
    }
    getHeader(header = {}) {
        if (!header) return header;
    }
    async getTokenUser(params) {
        let url = BASE_URL + '/UserInfo/authenticate';
        let token = null;
        await axios.post(url, params)
            .then(res => {
                token = res.data;
            })
            .catch(err => Promise.reject(err)
            );
        if (token) {
            this.setToken(token.data);
            return token.data;
        }
        return token;
    }
    async loginUser(params) {
        let url = BASE_URL + '/UserInfo/login';
        let resToken = this.getTokenStorage();
        let dataRes = null;
        if (!resToken) {
            resToken = await this.getTokenUser(params);
        }
        if (resToken) {
            let config = {
                headers: {
                    'Authorization': `Bearer ${resToken}`
                }
            }
            url = BASE_URL + '/UserInfo/login';
            await axios.post(url, params, config)
                .then(res => {
                    this.setToken(resToken);
                    dataRes = res.data;
                    this.setUser(dataRes.data);

                })
                .catch(err => Promise.reject(err)
                );
        }
        return dataRes;
    }
    logout() {
        this.deleteTokenStorage();
        this.deleteUserStorage();
    }
    async registerUser(params) {
        let dataRes = null;
        let url = BASE_URL + '/UserInfo/register';
        await axios.post(url, params)
            .then(res => {
                dataRes = res.data;
            })
            .catch(err => Promise.reject(err)
            );
        return dataRes;
    }

    checkLogin() {
        let token = this.getTokenStorage();
        let user = this.getUserStorage();
        return token && user;
    }
}
export default new Auth();