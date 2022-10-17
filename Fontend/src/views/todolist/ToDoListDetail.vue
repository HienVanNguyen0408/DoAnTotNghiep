<template>
    <div class="todolist-detail" v-if="isShow">
        <dq-popup  @closePopup="closePopup" :width="600" :height="500" >
            <template slot="header">
                <div class="pop-titlte">
                    {{ titlleMode }}
                </div>
            </template>
            <template slot="content">
                <div class="dq-content-todo">
                    <div class="flex w-100">
                        <dq-input
                            class="w-100"
                            :title="$t('i18nToDoList.ToDoName')"
                            v-model="todo.workName"
                        >
                        </dq-input>
                    </div>
                    <div class="flex w-100 dq-mgt-20">
                        <div class="flex-1 dq-mgr-10">
                            <dq-input-date
                                :title="$t('i18nToDoList.StartDate')"
                                :dateFormat="'DD/MM/YYYY HH:mm:ss'"
                                class="w-100"  
                                :value.sync="todo.startDate"
                            >
                            </dq-input-date>
                        </div>
                        <div class="flex-1">
                            <dq-input-date 
                                :title="$t('i18nToDoList.FinishDate')"
                                :dateFormat="'DD/MM/YYYY HH:mm:ss'"
                                class="w-100" 
                                :value.sync="todo.finishDate"
                            >
                            </dq-input-date>
                        </div>
                    </div>
                    <div class="flex w-100 dq-mgt-20">
                        <dq-textarea
                            class="w-100"
                            :title="$t('i18nCommon.Description')"
                             v-model="todo.description"
                        >
                        </dq-textarea>
                    </div>
                    <div class="flex w-100 dq-mgt-20">
                       <div class="flex flex-1 dq-mgr-10">
                             <dq-combobox
                                :class="'w-100'"
                                :title="'Mức độ ưu tiên'"
                                :classTitle="'h-mb-5 font-bold'"
                                :placeholder="'Mức độ ưu tiên'"
                                :data="getDataWorkPriority"
                                :keyData="'key'"
                                :display="'value'"
                                :value.sync="todo.workPriority"
                                :defaultValue="getDataWorkPriority[0].key"
                                ref="period"
                            >
                            </dq-combobox>
                       </div>
                       <div class="flex flex-1">
                             <dq-combobox
                                :class="'w-100'"
                                :title="'Trạng thái công việc'"
                                :classTitle="'h-mb-5 font-bold'"
                                :placeholder="'Trạng thái công việc'"
                                :data="getDataWorkStatus"
                                :keyData="'key'"
                                :display="'value'"
                                :value.sync="todo.workStatus"
                                :defaultValue="getDataWorkStatus[0].key"
                                ref="period"
                            >
                            </dq-combobox>
                       </div>
                    </div>
                    
                </div>
            </template>
            <template slot="footer">
                <div class="w-100">
                    <div class="flex jus-right">
                        <dq-button 
                            class="dq-mgr-10"
                            :classButton="'btn-cancel'"
                            :title="$t('i18nCommon.Cancel')"
                            :type="'secondary'"
                            @click="closePopup"
                        ></dq-button>
                        <dq-button 
                            :classButton="'btn-save'"
                            :title="$t('i18nCommon.Save')"
                            :type="'primary'"
                            @click="saveToDo"
                        ></dq-button>
                    </div>
                </div>
            </template>
        </dq-popup>
    </div>
</template>

<script>
    export default {
        name:"ToDoListDetail",
        props:{
            isShow:false,
            mode : null,
            todo:{
                typeof:Object,
                default:{}
            }
        },
        data(){
            return{
                dataGroupWorks : []
            }
        },
        computed:{
            titlleMode(){
                const me = this;
                if(me.mode == me.$enum.Mode.Edit) return me.$t('i18nToDoList.EditToDo');
                return me.$t('i18nToDoList.AddToDo');
            },
            getDataWorkStatus(){
                const me = this;
                return me.$commonFunc.getDataEnum('WorkStatus');
            },
            getDataWorkPriority(){
                const me = this;
                let workPriorities = me.$commonFunc.getDataEnum('WorkPriority');
                return workPriorities;
            }
        },
        created(){
            const me = this;
        },
        methods:{
                /*Hàm xử lý đóng popup**/
            closePopup(){
                const me = this;
                me.$emit('close');
            },

            /*Hàm xử việc lưu công việc**/
            saveToDo(){
                const me = this;
                me.$emit('save',me.mode);
            }
        },

    }
</script>

<style lang="scss" scoped>
@import "@/assets/contents/scss/views/todolist/todolist-detail.scss";
</style>