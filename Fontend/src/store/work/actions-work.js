import WorkClient from '@/api/work/work-client';
const controllerName = "Work"
const url = '';
const queries = '';
export default {
    getWorks: async function (context, payload) {
        let workClient = new WorkClient(); 
        var res = await workClient.getAsync({
            url : workClient.url,
            queries : payload 
        });
        return res;
    },
    
    getWorksPagging: async function (context, payload) {
        let workClient = new WorkClient(); 
        var res = await workClient.postAsync({
            url : `${workClient.url}/works`,
            data : payload
        });
        if(res && res.data){
            context.commit("updateWorks",res);
        }
        return res;
    },

    insertWorkAsync: async function (context, payload) {
        let workClient = new WorkClient(); 
        var res = await workClient.postAsync({
            url : `${workClient.url}/insert`,
            data : payload
        });
        return res;
    },
    udateWorkAsync: async function (context, payload) {
        let workClient = new WorkClient(); 
        var res = await workClient.postAsync({
            url : `${workClient.url}/update`,
            data : payload
        });
        return res;
    },
}