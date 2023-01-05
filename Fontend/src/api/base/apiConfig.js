let host = process.env.VUE_APP_SERVERHOST

const apiConfigDevLocal = {
    api : `${host}:5001`
}


const apiConfigProduction = {
    api : `${host}/api`
}

const api = {
    develop : apiConfigDevLocal,
    prodution : apiConfigProduction
}

export default  api[process.env.NODE_ENV];