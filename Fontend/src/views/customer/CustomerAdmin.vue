<template>
    <div class="dq-todolist">
        <div class="todolist-header">
            <div class="todolist-title">
                Danh sách thông tin khách hàng
            </div>
            <div class="flex align-center dq-mgt-20 jus-between">
                <div class="flex filter-todolist">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" v-model="params.filter"></dq-input>
                    </div>
                    <div class="filter dq-mgl-20" @click="filterToDoList">
                        <div class="icon dq-icon-24 icon-filter"></div>
                        <div class="text-filter">Lọc</div>
                    </div>
                    <div class="dq-mgl-20">
                        <dq-date-range 
                            :periodData="$enum.PeriodFilter"
                            :fromDate.sync="params.fromDate"
                            :toDate.sync="params.toDate"
                        >
                        </dq-date-range>
                    </div>
                </div>
                <div class="add-todo" style="width:200px;height:36px">
                    <dq-button 
                        :classButton="'btn-add-todo'"
                        :title="$t('i18nToDoList.AddToDo')"
                        @click="addToDo"
                    ></dq-button>
                </div>
            </div>
            <div class="grid-todolist dq-mgt-20">
                <dq-grid
                    :data="Customers"
                    :columns="columns"
                    serial="true"
                    checkbox="true"
                    pagination="true"
                    :dataPagination="params"
                    :textPage="$t('i18nToDoList.ToDo')"
                    @dbclick="editDataWork"
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
import { ModuleCustomer } from '@/store/module-const';
    export default {
        name:"CustomerAdmin",
        components:{
            // ToDoListDetail
        },
        data(){
            return {
                params:{
                    fromDate: this.$dateRange.getDateDefault(),
                    toDate: this.$dateRange.getDateDefault(),
                    pageSize : 10,
                    pageIndex : 1,
                    totalRecord : 0,
                    filter : "",
                    totalPages : 0
                },
                customers : [],
                columns : [],
                isShow: false,
                mode : this.$enum.Mode.Add,
                customer:{}
            }
        },
        computed:{
            ...mapGetters(ModuleCustomer, [
                "CustomersPagging",
                "Customers"
            ]),
        },
        created(){
            const me = this;
            me.initDataStatic();
        },
        methods:{
            ...mapActions(ModuleCustomer, [
                "getCustomersPagging"
            ]),
            // Khởi tạo dữ liệu tĩnh
            async initDataStatic(){
                const me = this;
                me.initDataColumns();
                await me.loadDataCustomers();
            },

            async loadDataCustomers(){
                const me = this;
                let params = {
                    Pagination : me.params
                };
                await me.CustomersPagging(params);
                if(me.CustomersPagging){
                    me.params.pageIndex = me.CustomersPagging.pageIndex;
                    me.params.pageSize = me.CustomersPagging.pageSize;
                    me.params.totalRecord = me.CustomersPagging.totalRecord;
                    me.params.totalPages = me.CustomersPagging.totalPages;
                }
            },
            // Khởi tạo dữ liệu cho cột
            initDataColumns(){
                const me = this;
                me.columns = [
                    {
                        title : 'Mã khách hàng',
                        dataField : 'customerId',
                    },
                    {
                        title : 'Giới tính',
                        dataField : 'gender',
                        align : 'center',
                        format : me.$enum.Format.Gender
                    },
                    {
                        title : 'Người cao tuổi không',
                        dataField : 'seniorCitizen',
                        align : 'center'
                    },
                    {
                        title : 'Có bảo mật trực tuyến không',
                        dataField : 'onlineSecurity',
                        align : 'center' 
                    },
                    {
                        title : 'Có sao lưu trực tuyến không',
                        dataField : 'onlineBackup',
                        align : 'center' ,
                        enum : 'WorkPriority'
                    },
                    {
                        title : 'Thời hạn hợp đồng',
                        dataField : 'contract'
                    },
                    {
                        title : 'Phương thức thanh toán',
                        dataField : 'paymentMethod'
                    },
                    {
                        title : 'Tiền thanh toán hàng tháng',
                        dataField : 'monthlyCharges',
                        format : me.$enum.Format.Money
                    },
                    {
                        title : 'Tổng tiền thanh toán',
                        dataField : 'totalCharges',
                        format : me.$enum.Format.Money
                    },
                    {
                        title : 'Khách hàng có rời bỏ dịch vụ hay không',
                        dataField : 'churn'
                    },
                ];
            },

            /*
            *Hàm lọc danh sách khách hàng
            */
            filterToDoList(){
                const me = this;
            },
            /*
            * Hàm xử lý thêm thông khách hàng
            */
            addCustomer(){
                const me = this;
                me.setStatePopup(true);
            },
            /*
            * Hàm xử set trạng thái ẩn hiện form detail
            */
            setStatePopup(state){
                const me = this;
                me.isShow = state;
            },

            async saveCustomer(mode){
                
            },

            /**
             * Hàm xử lý sửa đổi thông tin khách hàng
             */
            editDataCustomer(customer){ 
            }
        }
    }
</script>

<style scoped lang="scss">
@import "@/assets/contents/scss/views/todolist/todolist.scss";
</style>