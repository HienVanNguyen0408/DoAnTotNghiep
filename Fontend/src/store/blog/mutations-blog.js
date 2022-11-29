export default{
    updateBlogPage : async function(state,res){
        state.BlogPage = {...res};
        if(res && res.data){
            state.Blogs = res.data;
        }
        else{
            state.Blogs = [];
        }
    },
    updateBlog : async function(state,res){
        state.Blog = {...res};
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },


    updateBlogCategoryPage : async function(state,res){
        state.BlogCategoryPage = {...res};
        if(res && res.data){
            state.BlogCategories = res.data;
        }
        else{
            state.BlogCategories = [];
        }
    },

    updateBlogCategores: async function(state,res){
        state.BlogCategories = res;
    },

    updateBlogCategory : async function(state,res){
        state.BlogCategory = {...res};
    },
    updateCategoryTotalPage : async function(state,res){
        state.CategoryTotalPage = res;
    },
    updateCategoryTotalRecords: async function(state,res){
        state.CategoryTotalRecords = res;
    },
}