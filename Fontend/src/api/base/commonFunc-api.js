import BaseAPI from '@/api/base/base-api';
import Enum from '@/enum/enum';
export default{
    getDataPagging: async function (url, payload) {
        if (payload) {
            url += `?PageIndex=${payload.pageIndex ? payload.pageIndex : 1}&PageSize=${payload.pageSize ? payload.pageSize : 10}&TextSearch=${payload.filter ? payload.filter : ''}`;
        }
        let res = await BaseAPI.getAsync(url, payload);
        if (res) {
            return res.data;
        }
        return res;
    },
    getData: async function (url) {
        let res = await BaseAPI.getAsync(url);
        if (res) {
            return res.data;
        }
        return res;
    },
    updateDataAsync: async function (url, payload,type = Enum.UpdateType.Insert) {
        let res = null;
        if(type == Enum.UpdateType.Edit){
            res = await BaseAPI.putAsync(url, payload);
            if (res) {
                return res.data;
            }
            return res;
        }
        res = await BaseAPI.postAsync(url, payload);
        if (res) {
            return res.data;
        }
        return res;
    },
    deleteDataAsync: async function(url) {
        let res = await BaseAPI.deleteAsync(url);
        if (res) {
            return res.data;
        }
        return res;
    },
    deleteManyDataAsync: async function(url,payload) {
        let res = await BaseAPI.postAsync(url, payload);
        if (res) {
            return res.data;
        }
        return res;
    },

}