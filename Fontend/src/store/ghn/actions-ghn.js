import { BASE_URL } from '@/api/url';
import BaseFuncApi from '@/api/base/commonFunc-api';
import Enum from '@/enum/enum';
import GHNClient from '../../api/ghn/ghn-client.js';
const ghnClient = new GHNClient();
export default {
    getProvincesAsync: async function (context, payload) {
        var res = await ghnClient.getAsync({
            url : `${ghnClient.url}/provinces`,
        });
        
        if(res && res.data){
            context.commit('updateProvinces',res.data);
            return res.data;
        }
        return res;
    },

    getDistrictsAsync: async function (context, payload) {
        var res = await ghnClient.getAsync({
            url : `${ghnClient.url}/district/${payload.province_id}`,
        });
        
        if(res && res.data){
            context.commit('updateDistricts',res.data);
            return res.data;
        }
        return res;
    },

    getWardsAsync: async function (context, payload) {
        var res = await ghnClient.getAsync({
            url : `${ghnClient.url}/ward/${payload.district_id}`
        });
        
        if(res && res.data){
            context.commit('updateWards',res.data);
            return res.data;
        }
        return res;
    },

    getFeeInfoAsync: async function (context, payload) {
        var res = await ghnClient.postAsync({
            url : `${ghnClient.url}/calculatorfee`,
            data : payload
        });
        
        if(res && res.data){
            context.commit('updateFeeInfo',res.data);
            return res.data;
        }
        return res;
    },
    
    
}