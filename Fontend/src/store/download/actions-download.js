import BaseAPI from '@/api/base/base-api';
import { BASE_URL } from '@/api/url';
import DownloadClient from '@/api/download/download-client';
const downloadClient = new DownloadClient();
export default{
    importDataExcelAsync: async function (context, payload) {
        var res = await downloadClient.postAsync({
            url : `${downloadClient.url}/import-excel`,
            data : payload
        });
        return res;
    },

    exportDataExcelAsync: async function (context, payload) {
        var res = await downloadClient.postAsync({
            url : `${downloadClient.url}/export-excel`,
            data : payload
        });
        return res;
    },
}