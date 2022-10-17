<template>
    <div class="dq-todolist">
        <div class="todolist-header">
            <div class="todolist-title">
                {{ $t('i18nToDoList.ToDoList')}}
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
                    :data="Works"
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
        <div>
            <ToDoListDetail 
                :isShow="isShow"
                :mode="mode"
                :todo="todo"
                @close="setStatePopup(false)"
                @save="saveWork"
            />
        </div>
    </div>
</template>

<script>
import {
    mapActions, 
    mapGetters
} from 'vuex';
import {ModuleWork} from '@/store/module-const';
import ToDoListDetail from './ToDoListDetail.vue';
    export default {
        name:"ToDolist",
        components:{
            ToDoListDetail
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
                todolist : [],
                columns : [],
                isShow: false,
                mode : this.$enum.Mode.Add,
                todo:{}
            }
        },
        computed:{
            ...mapGetters(ModuleWork, [
                "Works",
                "WorkPagging"
            ]),
        },
        created(){
            const me = this;
            me.initDataStatic();
        },
        methods:{
            ...mapActions(ModuleWork, [
                "getWorks", 
                "getWorksPagging",
                "insertWorkAsync",
                "updateWorkAsync"
            ]),
            // Khởi tạo dữ liệu tĩnh
            async initDataStatic(){
                const me = this;
                me.initDataColumns();
                await me.loadDataWorks();
            },

            async loadDataWorks(){
                const me = this;
                let params = {
                    UserId : '',
                    Pagination : me.params
                };
                await me.getWorksPagging(params);
                if(me.WorkPagging){
                    me.params.pageIndex = me.WorkPagging.pageIndex;
                    me.params.pageSize = me.WorkPagging.pageSize;
                    me.params.totalRecord = me.WorkPagging.totalRecord;
                    me.params.totalPages = me.WorkPagging.totalPages;
                }
            },
            // Khởi tạo dữ liệu cho cột
            initDataColumns(){
                const me = this;
                me.columns = [
                    {
                        title : 'Tên công việc',
                        dataField : 'workName',
                    },
                    {
                        title : 'Giờ bắt đầu',
                        dataField : 'startDate',
                        align : 'center',
                        format : me.$enum.Format.Date
                    },
                    {
                        title : 'Giờ hoàn thành',
                        dataField : 'finishDate',
                        align : 'center',
                        format : me.$enum.Format.Date
                    },
                    {
                        title : 'Ngày',
                        dataField : 'createdDate',
                        align : 'center',
                        format : me.$enum.Format.Date
                    },
                    {
                        title : 'Trạng thái công việc',
                        dataField : 'workStatus',
                        align : 'center' ,
                        enum : 'WorkStatus'
                    },
                    {
                        title : 'Mức độ công việc',
                        dataField : 'workPriority',
                        align : 'center' ,
                        enum : 'WorkPriority'
                    },
                    {
                        title : 'Mô tả công việc',
                        dataField : 'description'
                    },
                ];
            },

            /*
            *Hàm lọc danh sách công việc
            */
            filterToDoList(){
                const me = this;
            },
            /*
            * Hàm xử lý thêm công việc
            */
            addToDo(){
                const me = this;
                me.setStatePopup(true);
            },
            /*
            * Hàm xử set trạng thái ẩn hiện form detail công việc
            */
            setStatePopup(state){
                const me = this;
                me.isShow = state;
            },

            async saveWork(mode){
                const me = this;
                //Thêm công việc
                if(mode == this.$enum.Mode.Add){
                    await me.insertWorkAsync(me.todo);
                }else{ // sửa công việc
                    await me.udateWorkAsync(me.todo);
                }
                me.isShow = false;

                await me.loadDataWorks();
            },

            /**
             * Hàm xử lý sửa đổi thông tin công việc
             */
            editDataWork(work){ 
                const me = this;
                me.isShow = true;
                me.mode = this.$enum.Mode.Edit;
                me.todo = work;
            }
        }
    }
</script>

<style scoped lang="scss">
@import "@/assets/contents/scss/views/todolist/todolist.scss";
</style>