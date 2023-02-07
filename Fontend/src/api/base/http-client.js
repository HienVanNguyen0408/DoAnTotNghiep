import axios from 'axios';
import { BASE_URL } from '@/api/url';
export default class HttpClient{
    controllerName = '';
    url = '';
    intance = null;
    constructor(controllerName){
        const keyJwt = "Jwt";
        const resToken = localStorage.getItem(keyJwt) ? JSON.parse(localStorage.getItem(keyJwt)) : localStorage.getItem(keyJwt);
        this.intance = axios.create({
            headers: {
                'Authorization': `Bearer ${resToken}`
            }
        });
        this.controllerName = controllerName;
        if(controllerName){
            this.url = `${BASE_URL}/${controllerName}`;
        }
        else{
            this.url = `${BASE_URL}/${this.controllerName}`;
        }
    }
    
    async getAsync(params) {
        this.setIntance();
        if(!params.url) params.url = this.url;
        let me = this;
        if(params.queries){
            url += `/${me.getQueryString(queries)}`;
        }
        let config = {};
        if(params.headers){
            config = {
                headers: headers
            };
        }
        let res = await this.intance.get(params.url,config).then(res => {
            return Promise.resolve(res.data);
        }).catch(err => Promise.reject(err));
        if(res){
            return res;
        }
        return null;
    }

    async postAsync(params) {
        this.setIntance();
        if(!params) return null;
        if(!params.url) params.url = this.url;
        if(params.queries){
            params.url += `/${me.getQueryString(queries)}`;
        }
        
        let config = {};
        if(params.headers){
            config = {
                headers: headers
            };
        }
        let res = await this.intance.post(params.url, params.data,config)
        .then(res => {
            return Promise.resolve(res.data);
        })
        .catch(err => Promise.reject(err)
        );
        return res;
    }

    getQueryString(query){
        if(!query) return '';
        let queryArr = [];
        Object.keys(query).forEach((key) => {
            if(query[key]){
                queryArr.push(`${key}=${query[key]}`);
            }
        });
        return queryArr.join('&');
    }

    setIntance(){
        const keyJwt = "Jwt";
        const resToken = localStorage.getItem(keyJwt) ? JSON.parse(localStorage.getItem(keyJwt)) : localStorage.getItem(keyJwt);
        this.intance = axios.create({
            headers: {
                'Authorization': `Bearer ${resToken}`
            }
        });
    }
}
