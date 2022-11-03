<template>
    <div class="dq-todolist">
        <div class="todolist-header">
            <div class="todolist-title">
                Danh sách thông tin khách hàng
            </div>
            <div class="flex align-center dq-mgt-20 jus-between">
                <div class="flex filter-todolist">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter" @keyup="filterCustomer">
                        </dq-input>
                    </div>
                    <div class="dq-mgl-10 icon dq-icon-56 icon-delete-big" @click="deleteManyCustomer" v-if="selected && selected.length > 0"></div>
                    <div class="dq-mgl-10">
                        <dq-input-file :isButton="true" :extentions="'.csv,.xlsx'" @change="selectImportFile"></dq-input-file>
                    </div>
                    <!-- <div class="filter dq-mgl-20" @click="filterCustomer">
                        <div class="icon dq-icon-24 icon-filter"></div>
                        <div class="text-filter">Lọc</div>
                    </div>
                    <div class="dq-mgl-20">
                        <dq-date-range 
                            :periodData="$enum.PeriodFilter"
                            :fromDate.sync="params.fromDate"
                            :toDate.sync="params.foDate"
                        >
                        </dq-date-range>
                    </div> -->
                </div>
                <div class="add-todo" style="width:200px;height:36px">
                    <dq-button :classButton="'btn-add-todo'" :title="'Thêm khách hàng'" @click="addCustomer">
                    </dq-button>
                </div>
            </div>
            <div class="grid-todolist dq-mgt-20">
                <dq-grid
                    ref="gridCustomer"
                     :data="Customers" :columns="columns" serial="true" checkbox="true" pagination="true"
                    :dataPagination="params" :textPage="$t('i18nToDoList.ToDo')" @dbclick="editDataCustomer"
                    @getData="getDataPagging"
                    @checkboxOne="checkboxOne"   
                    @checkboxMulti="checkboxMulti" 
                >
                </dq-grid>
            </div>
        </div>
        <!-- <div>
            <ToDoListDetail 
                :isShow="isShow"
                :mode="mode"
                :todo="todo"
                @close="setStatePopup(false)"
                @save="saveWork"
            />
        </div> -->
    </div>
</template>

<script>
import {
    mapActions,
    mapGetters
} from 'vuex';
// import ToDoListDetail from './ToDoListDetail.vue';
import { ModuleCustomer, ModuleDownload } from '@/store/module-const';
import _ from 'lodash';
export default {
    name: "CustomerAdmin",
    components: {
        // ToDoListDetail
    },
    data() {
        return {
            params: {
                fromDate: this.$dateRange.getDateDefault(),
                toDate: this.$dateRange.getDateDefault(),
                pageSize: 10,
                pageIndex: 1,
                filter: "",
                totalPages: 0
            },
            customers: [],
            columns: [],
            isShow: false,
            mode: this.$enum.Mode.Add,
            customer: {},
            selected : []
        }
    },
    computed: {
        ...mapGetters(ModuleCustomer, [
            "CustomersPagging",
            "Customers"
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleCustomer, [
            'getCustomersPagging',
            'deleteCustomerAsync'
        ]),
        ...mapActions(ModuleDownload, [
           'importDataExcelAsync' 
        ]),
        async initData() {
            const me = this;
            me.initDataStatic();
            await me.loadDataCustomers();
        },
        // Khởi tạo dữ liệu tĩnh
        async initDataStatic() {
            const me = this;
            me.initDataColumns();
        },

        async loadDataCustomers() {
            const me = this;
            let params = me.getPayload()
            await me.getCustomersPagging(params);
            if (me.CustomersPagging) {
                me.params.pageIndex = me.CustomersPagging.pageIndex;
                me.params.pageSize = me.CustomersPagging.pageSize;
                me.params.totalRecord = me.CustomersPagging.totalRecord;
                me.params.totalPages = me.CustomersPagging.totalPages;
            }
        },
        // Khởi tạo dữ liệu cho cột
        initDataColumns() {
            const me = this;
            me.columns = [
                {
                    title: 'Mã khách hàng',
                    dataField: 'customerCode',
                },
                {
                    title: 'Giới tính',
                    dataField: 'gender',
                    align: 'center',
                    format: me.$enum.Format.Gender
                },
                {
                    title: 'Người cao tuổi không',
                    dataField: 'seniorCitizen',
                    align: 'center'
                },
                {
                    title: 'Có bảo mật trực tuyến không',
                    dataField: 'onlineSecurity',
                    align: 'center'
                },
                {
                    title: 'Có sao lưu trực tuyến không',
                    dataField: 'onlineBackup',
                    align: 'center',
                    enum: 'WorkPriority'
                },
                {
                    title: 'Thời hạn hợp đồng',
                    dataField: 'contract'
                },
                {
                    title: 'Phương thức thanh toán',
                    dataField: 'paymentMethod'
                },
                {
                    title: 'Tiền thanh toán hàng tháng',
                    dataField: 'monthlyCharges',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Tổng tiền thanh toán',
                    dataField: 'totalCharges',
                    format: me.$enum.Format.Money
                },
                {
                    title: 'Khách hàng có rời bỏ dịch vụ hay không',
                    dataField: 'churn'
                },
            ];
        },

        /*
        *Hàm lọc danh sách khách hàng
        */
        filterCustomer: _.debounce(async function () {
            const me = this;
            let params = me.getPayload()
            await me.loadDataCustomers();
        }, 1000),
        /*
        * Hàm xử lý thêm thông khách hàng
        */
        addCustomer() {
            const me = this;
            me.setStatePopup(true);
        },
        /*
        * Hàm xử set trạng thái ẩn hiện form detail
        */
        setStatePopup(state) {
            const me = this;
            me.isShow = state;
        },

        async saveCustomer(mode) {

        },

        /**
         * Hàm xử lý sửa đổi thông tin khách hàng
         */
        editDataCustomer(customer) {
        },

        async getDataPagging(params) {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getCustomersPagging(params);
        },

        getPayload() {
            const me = this;
            return {
                PageIndex: me.params.pageIndex,
                PageSize: me.params.pageSize,
                Filter: me.params.filter
            };
        },

        async deleteManyCustomer() {
            const me = this;
            if(me.selected && me.selected.length > 0){
                let params = {
                    customerIds : me.selected.map(x => x.customerId)
                }
                let res = await me.deleteCustomerAsync(params);
                if(res){
                    me.loadDataCustomers();
                    me.selected = [];
                    if(me.$refs && me.$refs.gridCustomer){
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        async selectImportFile(data){
            const me = this;
            if(data){
                let params = {
                    FileData : data.file,
                    FileName : data.fileName
                };
                await me.importDataExcelAsync(params);
                await me.loadDataCustomers();
            }
        },
        /**
         * Check row grid
         */    
        checkboxOne(seleteds){
            const me = this;
            if(!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },
        /**
         * Check all data in grid
         * @param {*} selecteds 
         */
        checkboxMulti(seleteds){
            const me = this;
            if(!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        }

    }
}
</script>

<style scoped lang="scss">
@import "@/assets/contents/scss/views/todolist/todolist.scss";


.icon-delete-big {
    cursor: pointer;
}
</style>