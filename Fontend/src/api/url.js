// export const BASE_URL = "https://vanhien.online/api/v1";
import apiConfig from "./base/apiConfig";

const urlName = 'api'
export const BASE_URL = `${apiConfig[urlName]}`;
export const API_TRANSLATE = "https://translate.api.cloud.yandex.net/translate/v2/translate";