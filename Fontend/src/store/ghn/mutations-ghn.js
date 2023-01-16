export default{
    updateProvinces : async function(state,res){
        state.Provinces = [...res];
    },
    updateDistricts : async function(state,res){
        state.Districts = [...res];
    },
    updateWards : async function(state,res){
        state.Wards = [...res];
    },
}