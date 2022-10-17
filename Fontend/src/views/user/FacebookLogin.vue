<template>
    <div>
         <facebook-login class="button"
            :appId="appId"
            @login="getUserData"
            @logout="onLogout"
            @get-initial-status="getUserData">
        </facebook-login>
    </div>
</template>

<script>
import facebookLogin from 'facebook-login-vuejs';
    export default {
        components:{
            facebookLogin
        },
        data(){
            return{
                //app id : app in develop facebook
                appId : "1662534250613517",

            }
        },
        methods:{
            getUserData(){
                // const me = this;
                // me.FB.api('/me','GET',{fields : 'id,name,email'},
                // userInformation =>{
                //     console.warn("get data from FB",userInformation);
                //     console.log("id",userInformation.Id);
                //     console.log("email",userInformation.email);
                //     console.log("name",userInformation.name);
                // })
            },
            onLogout(){

            }
        }
    }
</script>

<style scoped>

</style>