export default{
    updateProductPage : async function(state,res){
        state.ProductPage = {...res};
        if(res && res.data){
            state.Products = res.data;
        }
    },
    updateProduct : async function(state,res){
        state.Product = {...res};
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },
}