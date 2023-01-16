const keyOrderStorage = "Web-Order";
export default {
    FB_Parse() {
        setTimeout(() => {
            window.FB.XFBML.parse()
        }, 0)
    },

    /**
     * Dữ liệu product trong cart
     */
    getCartByUser: async function(context, payload) {
        // Lấy dữ liệu trên storgare
        let store = localStorage.getItem(keyOrderStorage);
        if (!store) {
            context.commit("updateCart", []);
            return [];
        }

        // convert dữ liệu
        let orderStorage = store ? JSON.parse(store) : {};
        if (!orderStorage | !orderStorage[payload]) {
            context.commit("updateCart", []);
            return [];
        }
        if (orderStorage[payload] && orderStorage[payload].orders && orderStorage[payload].orders.length > 0) {
            context.commit("updateCart", orderStorage[payload].orders);
            return Promise.resolve(orderStorage[payload].orders);
        }
        context.commit("updateCart", []);
        return [];
    }
}