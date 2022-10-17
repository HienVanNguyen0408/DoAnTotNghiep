import axios from 'axios';
/**
 * GET
 * @param {Url api} url 
 */
const keyJwt = "Jwt";
const resToken = localStorage.getItem(keyJwt) ? JSON.parse(localStorage.getItem(keyJwt)) : localStorage.getItem(keyJwt);
const intance = axios.create({
    headers: {
        'Authorization': `Bearer ${resToken}`
    }

});
export const getAsync = async (url) =>
    await intance.get(url).then(res => {
        return Promise.resolve(res.data);
    }).catch(err => Promise.reject(err));



/**
 * DELETE
 * @param {*} url 
 */
export const deleteAsync = async (url) => {
    await intance.delete(url)
        .then(res => {
            return Promise.resolve(res.data);
        })
        .catch(err => {
            return Promise.reject(err)
        });
}

/***
 * PUT
 */
export const putAsync = async (url, data) => {
    await intance.put(url, data)
        .then(res => {
            return Promise.resolve(res.data);
        })
        .catch(err => {
            return Promise.reject(err)
        });
}

/**
 * POST
 */
export const postAsync = async (url, dataBody) => {
    await intance.post(url, dataBody)
        .then(res => {
            return Promise.resolve(res.data);
        })
        .catch(err => Promise.reject(err)
        );
}

export default { getAsync, putAsync, deleteAsync, postAsync }