export default{
    updateCustomersPagging : async function(state,res){
        state.CustomersPagging = {...res};
        state.Customers = res.data;
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },
    updateCustomer : async function(state,res){
        state.Customer = res;
    }
}