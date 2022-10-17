export default{
    updateWorks : async function(state,res){
        state.works = [...res.data];
        state.workPagging = {
            pageIndex : res.pageIndex,
            pageSize : res.pageSize,
            totalRecord : res.totalRecord,
            totalPages : res.totalPages
        };  
    }
}