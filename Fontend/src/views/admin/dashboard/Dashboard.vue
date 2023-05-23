<template>
    <div>
        <div class="period-report">
            <dq-combobox :class="'w-100'" :title="'Kỳ báo cáo'" :classTitle="'h-mb-5 font-bold'"
                :placeholder="'Kỳ báo cáo'" :data="periods" :keyData="'id'" :display="'name'"
                :value.sync="period" :defaultValue="period" ref="period" @change="handleChangePeriod">
            </dq-combobox>
        </div>
        <dq-bar-chart :chartdata="chartData" :options="chartOptions"></dq-bar-chart>
    </div>
</template>

<script>
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleOrder } from '@/store/module-const';

export default {
    data() {
        return {
            chartData: {
                labels: [
                    "Tháng 1",
                    "Tháng 2",
                    "Tháng 3",
                    "Tháng 4",
                    "Tháng 5",
                    "Tháng 6",
                    "Tháng 7",
                    "Tháng 8",
                    "Tháng 9",
                    "Tháng 10",
                    "Tháng 11",
                    "Tháng 12",
                ],
                datasets: [
                    {
                        label: "Doanh thu của cửa hàng",
                        backgroundColor: '#f87979',
                        data: [10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                    },
                    {
                        label: "Số lượng đơn hàng",
                        backgroundColor: '#000',
                        data: [10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                    }
                ]
            },
            chartOptions: {
                responsive: true,
                maintainAspectRatio: false
            },
            period: this.$enum.PeriodType.Last7Days,
            periods : []
        }
    },
    created() {
        const me = this;
        me.initDataStatic();
        me.loadDataSales();
    },
    computed: {
        ...mapGetters(ModuleOrder, [
            'SalesStatistic'
        ])
    },
    methods: {
        ...mapActions(ModuleOrder, [
            'getSalesStatisticAsync'
        ]),

        initDataStatic() {
            const me = this;
            me.periods = [
                {
                    id:  this.$enum.PeriodType.Last7Days,
                    name: 'Tuần này'
                },
                {
                    id:  this.$enum.PeriodType.ThisMonth,
                    name: 'Tháng này'
                },
                {
                    id:  this.$enum.PeriodType.ThisYear,
                    name: 'Năm nay'
                }
            ];
        },
        /**
         * Lấy thông tin để thống kê
         */
        async loadDataSales() {
            const me = this;
            await me.getSalesStatisticAsync(me.period);
            me.updateDataChart();
        },
        updateDataChart() {
            const me = this;
            if (me.SalesStatistic) {
                me.chartData.datasets[0].data = me.SalesStatistic.orderInfos.map(x => x.sales / 1000000);
                me.chartData.datasets[1].data = me.SalesStatistic.orderInfos.map(x => x.numberOrder);
                me.chartData.labels = me.SalesStatistic.saleStatisticText;
            }
        },

        handleChangePeriod(){
            const me = this;
            me.loadDataSales();
        }
    }
}
</script>

<style scoped>
.period-report{
    width: 300px;
    padding: 20px;
}
</style>