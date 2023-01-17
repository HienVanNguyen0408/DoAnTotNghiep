export default{
    updateUsers : async function(state,res){
        state.Users = [...res];
    },
    updatePaggingUsers : async function(state,res){
        state.UserPage = {...res};
        if(res && res.data){
            state.Users = res.data;
        }
        else{
            state.Users = [];
        }
    },
    updateTotalPage : async function(state,res){
        state.TotalPage = res;
    },
    updateTotalRecords: async function(state,res){
        state.TotalRecords = res;
    },

    updateUserLogin : async function(state,res){
        state.User = {...res};
    },
}