export default{
    updateCart : async function(state,res){
        state.orders = [...res];
    }
}