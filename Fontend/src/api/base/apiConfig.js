let host = process.env.VUE_APP_SERVERHOST
let enpoint = process.env.VUE_APP_BASE_API
const apiConfigDevLocal = {
    api : `${host}:5002${enpoint}`
}


const apiConfigProduction = {
    api : `${host}:5001${enpoint}`
}

const api = {
    develop : apiConfigDevLocal,
    prod : apiConfigProduction
}

export default api[process.env.NODE_ENV];