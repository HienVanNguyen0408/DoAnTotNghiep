export default{
    updateBlogPage : async function(state,res){
        state.BlogPage = {...res};
        if(res && res.data){
            state.Blogs = res.data;
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
}