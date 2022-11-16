export default{
    updateWorks : async function(state,res){
        state.works = [...res];
    }
}