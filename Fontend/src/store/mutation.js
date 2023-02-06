export default {
    updateCart: async function (state, res) {
        if (!res || res.length <= 0) {
            state.CartProducts = []
        } else {
            state.CartProducts = [...res];
        }
    }
}