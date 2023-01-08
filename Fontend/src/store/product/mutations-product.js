export default{
    updateProductPage : async function(state,res){
        state.ProductPage = {...res};
        if(res && res.data){
            state.Products = res.data;
        }
        else{
            state.Products = [];
        }
    },

    updateProduct : async function(state,res){
        state.Product = {...res};
    },

    updateProductUser : async function(state,res){
        state.ProductUser = {...res};
    },

    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },

    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },

    updateProductCategoryPage : async function(state,res){
        state.ProductCategoryPage = {...res};
        if(res && res.data){
            state.ProductCategories = res.data;
        }
        else{
            state.ProductCategories = [];
        }
    },

    updateProductCategories: async function(state,res){
        state.ProductCategories = res;
    },

    updateProductCategory : async function(state,res){
        state.ProductCategory = {...res};
    },

    updateCategoryTotalPage : async function(state,res){
        state.CategoryTotalPage = res;
    },
    
    updateCategoryTotalRecords: async function(state,res){
        state.CategoryTotalRecords = res;
    },
}