<template>
    <div>
        <div class="dq-input">
            <div v-if="title" class="dq-mgb-5 text-title">{{ title }}</div>
            <a-date-picker 
                class="w-100"
                :placeholder="dateFormat"
                :disabled="disabled" 
                :defaultValue="isDefaultValue ? moment(valueDefault,dateFormat) : null" 
                ref="inputDate" 
                :format="dateFormat" 
                v-model="dateOfB" 
                @change="handleChange"
            />
            <div v-if="icon" :class="icon" class="h-icon-input"></div>
        </div>
    </div>
</template>

<script>
    // import moment from 'moment';
    export default {
        props:{
            value : {},
            icon:{
                typeof:String,
                default:""
            },
            title:{
                typeof:String,
                default:""
            },
            isDefaultValue : {
                typeof : Boolean,
                default :false
            },
            valueDefault : {
                typeof : String,
                default : ""
            },
            minW : {
                typeof : Number,
                default : 200
            },
            disabled: {
                typeof : Boolean,
                default :false
            },
            dateFormat:{
                typeof:String,
                default: "DD/MM/YYYY"
            }
        },
        computed: {
            dateOfB: {
                get() { return this.dob; },
                set(value) { this.dob = value;}
            },
        },
        watch:{
        },
        updated() {},
        mounted() {},
        data(){
            return{
                dob : this.$dateRange.convertDateToMoment(this.value,this.dateFormat),
            }
        },
        created(){
            const me = this;
            me.initData();
        },
        methods:{
            initData(){
                const me = this;
                if(me.value){
                    me.dob = me.$dateRange.convertDateToMoment(me.value,this.dateFormat);
                }
            },
            handleChange(value){
                const me = this;
                // let valueString = me.$dateRange.convertDate(value);
                me.$emit("update:value",value);
                me.dob = value;
                me.$emit("change");
            }
        }
    }
</script>

<style scoped>
.h-input{
    position: relative;
    box-sizing: border-box;
    min-width: 200px;
}
.input{
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    padding-left: 10px;
}
.h-icon-input{
    position: absolute;
    top: 8px;
    right: 10px;
}
.text-title{
    font-weight: bold;
}
</style>