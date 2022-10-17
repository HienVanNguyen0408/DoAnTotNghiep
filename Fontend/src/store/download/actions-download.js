import BaseAPI from '@/api/base/base-api';
import { BASE_URL } from '@/api/url';

export default{
     saveFileToStorage : async function(context,payload){
        let url = BASE_URL + '/Download';
        let res = await BaseAPI.postAsync(url,payload);
        if(res){
            // context.commit("updateOrders");
        }
        return res;
    },
}