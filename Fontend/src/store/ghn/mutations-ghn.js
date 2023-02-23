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
    updateFeeInfo : async function(state,res){
        state.Fee = {...res};
    },
    updateLeadTimeInfo : async function(state,res){
        state.LeadTime = {...res};
    },
}