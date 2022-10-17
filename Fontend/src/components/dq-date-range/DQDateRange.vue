<template>
    <div class="dq-daterange">
        <div class="dq-period flex">
            <div class="dq-mgr-10" style="min-width:200px">
                <dq-combobox
                    :class="'w-100'"
                    :title="''"
                    :classTitle="'h-mb-5 font-bold'"
                    :placeholder="'Kỳ'"
                    :data="dataPeriods"
                    :keyData="'key'"
                    :display="'value'"
                    :value.sync="params.period"
                    :defaultValue="$enum.PeriodFilter.ToDay"
                    @change="changeCombobox"
                    ref="period"
                >
                </dq-combobox>
            </div>
            <div class="flex w-100">
                <div class="flex-1 dq-mgr-10">
                    <dq-input-date
                        class="w-100"
                        ref="fromDate" 
                        @change="changeFromDate" 
                        :value.sync="params.fromDate"
                    >
                    </dq-input-date>
                </div>
                <div class="flex-1">
                    <dq-input-date 
                        class="w-100" 
                        ref="toDate"
                        @change="changeToDate" 
                        :value.sync="params.toDate"
                    >
                    </dq-input-date>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name:"DateRange",
        components:{},
        props:{
            periodData: {},
            typeDateRange: {
                typeof:Number,
                default : 1
            },
            fromDate : {},
            toDate: {}
        },
        computed:{ 
        },
        watch:{
            'params.fromDate': function(newVal, oldVal) {
                const me = this;
                if(me.$refs && me.$refs.fromDate){
                    me.$refs.fromDate.dob = newVal;
                    me.$emit("update:fromDate",newVal);
                }
            },
            'params.toDate': function(newVal, oldVal) {
                const me = this;
                if(me.$refs && me.$refs.toDate){
                    me.$refs.toDate.dob = newVal;
                    me.$emit("update:toDate",newVal);
                }
            },
            'params.period': function(newVal, oldVal) {
                const me = this;
                if(me.$refs && me.$refs.period){
                    me.$refs.period.valuePeriod = newVal;
                }
            }
        },
        data(){
            return{
                dataPeriods : [],
                params :{}
            }
        },
        created(){
            const me = this;
            me.initDataStatic();
        },
        methods:{
            initDataStatic(){
                const me = this;
                //Khởi tạo dữ liệu lọc theo kỳ
                me.initDataPeriod();
            },
            initDataPeriod(){
                const me = this;
                let x = me.$t("i18nDateRange");
                let period = me.periodData;
                if(period){
                    for (var key in period) {
                        let dataPeriod = {
                            key : period[key],
                            value : x[`${key}`]
                        };
                        me.dataPeriods.push(dataPeriod);
                    }
                    if(me.dataPeriods && me.dataPeriods.length > 0){
                        me.params.period = me.dataPeriods[0].key;
                        
                        me.params.fromDate =  me.fromDate;
                        if(me.params.fromDate){
                            me.params.fromDate = this.$dateRange.getDateDefault();
                        }

                        me.params.toDate = me.toDate;
                        if(me.params.toDate){
                            me.params.toDate = this.$dateRange.getDateDefault();
                        }
                    }
                }
            },
            changeCombobox(){
                const me = this;
                if(me.params && me.params.period){
                    let dateRange = this.$dateRange.calculatorDateRange(me.params.fromDate,me.params.toDate,me.params.period);
                    this.params = {
                        fromDate : dateRange.fromDate,
                        toDate : dateRange.toDate,
                        period : me.period
                    };
                }
            },
            changeFromDate(){
                const me = this;
                let period = me.$dateRange.calculatorPeriod(me.params.fromDate,me.params.toDate,me.dataPeriods);
                me.params = {
                    fromDate : me.fromDate,
                    toDate : me.toDate,
                    period : period
                };
            },
            changeToDate(){
                const me = this;
                let period = me.$dateRange.calculatorPeriod(me.params.fromDate,me.params.toDate,me.dataPeriods);
                me.params = {
                    fromDate : me.fromDate,
                    toDate : me.toDate,
                    period : period
                };
            },
        }
    }
</script>

<style lang="scss" scoped>
@import "@/assets/contents/scss/components/daterange/daterange.scss";
</style>