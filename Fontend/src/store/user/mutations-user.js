export default{
    updateUsers : async function(state,res){
        state.Users = [...res];
    },
    updatePaggingUsers : async function(state,res){
        state.UserPage = {...res};
        state.Users = res.data;
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },
}