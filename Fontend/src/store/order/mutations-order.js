export default{
    updateOrderPage : async function(state,res){
        state.OrderPage = {...res};
        if(res && res.data){
            state.Orders = res.data;
        }
    },
    updateOrder : async function(state,res){
        state.Order = {...res};
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },
}