export default{
    updateCart : async function(state,res){
        state.CartProducts = [...res];
    }
}