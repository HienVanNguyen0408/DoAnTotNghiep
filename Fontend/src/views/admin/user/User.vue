<template>
    <div class="dq-content">
        <div class="dq-content-header">
            <div class="flex">
                <div class="flex flex-1 align-center">
                    <div class="filter-search">
                        <dq-input icon="icon dq-icon-24 icon-look-for" :placeholder="''" v-model="params.filter"
                            @keyup="filterUsers">
                        </dq-input>
                    </div>
                    <div class="ml-2.5" v-if="selected && selected.length > 0">
                        <div class="icon icon-delete dq-icon-24"></div>
                    </div>
                </div>
                <div class="flex-1 flex justify-end">
                    <div class="btn-add">
                        <dq-button :title="'Thêm người dùng'" @click="addUserAsync"></dq-button>
                    </div>
                </div>
            </div>
        </div>
        <div class="dq-grid mt-5">
            <dq-grid ref="gridUser" :data="Users" :columns="columns" serial="true" checkbox="true" pagination="true"
                :dataPagination="params" :textPage="'Người dùng'" @dbclick="editDataUser" @getData="getDataPagging"
                @checkboxOne="checkboxOne" @checkboxMulti="checkboxMulti">
            </dq-grid>
        </div>
        <UserDetail :isShow="isShow" :user="user" :mode="mode" @closePopup="setStateDetail(false)"
            @showPopup="setStateDetail(true)" @resetData="resetDataDetail" @loadData="loadDataUsers"/>
    </div>
</template>

<script>
import _ from 'lodash';
import {
    mapActions,
    mapGetters
} from 'vuex';
import { ModuleUser } from '@/store/module-const';
import UserDetail from './UserDetail.vue';
export default {
    name: "AdminUser",
    components: {
        UserDetail
    },
    props: {},
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
            columns: [],
            isShow: false,
            mode: this.$enum.Mode.Add,
            selected: [],

            isShow: false,
            user: {}
        }
    },
    computed: {
        ...mapGetters(ModuleUser, [
            'UserPage',
            'Users',
            'TotalPage',
            'TotalRecords'
        ]),
    },
    created() {
        const me = this;
        me.initData();
    },
    methods: {
        ...mapActions(ModuleUser, [
            'getUsers',
            'getUsersPagging',
            'getUserById',
            'getUserByUserName',
            'updateUserAsync',
            'deleteUserAsync'
        ]),

        initData() {
            const me = this;
            me.initDataStatic();
            me.loadDataUsers();
        },
        initDataStatic() {
            const me = this;
            me.columns = [
                {
                    title: 'Tài khoản',
                    dataField: 'user_name',
                },
                {
                    title: 'Họ và tên',
                    dataField: 'full_name',
                },
                {
                    title: 'Địa chỉ',
                    dataField: 'address',
                },
                {
                    title: 'SDT',
                    dataField: 'phone_number',
                },
                {
                    title: 'Email',
                    dataField: 'email',
                },
                {
                    title: 'Ngày sinh',
                    dataField: 'date_of_birth',
                    align: 'center',
                    format: me.$enum.Format.Date
                },
            ]
        },

        async loadDataUsers() {
            const me = this;
            let params = me.getPayload()
            await me.getUsersPagging(params);
            if (me.UserPage) {
                me.params.pageIndex = me.UserPage.pageIndex;
                me.params.pageSize = me.UserPage.pageSize;
                me.params.totalRecord = me.UserPage.totalRecord;
                me.params.totalPages = me.UserPage.totalPages;
            }
        },
        getPayload() {
            const me = this;
            return {
                PageIndex: me.params.pageIndex,
                PageSize: me.params.pageSize,
                Filter: me.params.filter
            };
        },
        async getDataPagging(params) {
            const me = this;
            me.params.pageIndex = params.pageIndex;
            me.params.pageSize = params.pageSize;
            me.params.filter = params.filter;
            me.params.totalRecord = params.totalRecord;
            me.params.totalPages = params.totalPages;
            await me.getUsersPagging(params);
        },

        /*
        *Hàm lọc danh sách khách hàng
        */
        filterUsers: _.debounce(async function () {
            const me = this;
            await me.loadDataUsers();
        }, 1000),
        /**
         * Xóa nhiều Users
         */
        async deleteManyUser() {
            const me = this;
            if (me.selected && me.selected.length > 0) {
                let params = {
                    userIds: me.selected.map(x => x.user_id)
                }
                let res = await me.deleteUserAsync(params);
                if (res) {
                    me.loadDataCustomers();
                    me.selected = [];
                    if (me.$refs && me.$refs.gridCustomer) {
                        me.$refs.gridCustomer.resetSelect();
                    }
                }
            }
        },

        editDataUser(item) {
            const me = this;
            me.setStateDetail(true);
            me.mode = me.$enum.Mode.Edit;
            me.user = {...item};
        },

        /**
        * Check row grid
        */
        checkboxOne(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },

        /**
         * Check all data in grid
         * @param {*} selecteds 
         */
        checkboxMulti(seleteds) {
            const me = this;
            if (!seleteds || seleteds.length <= 0) me.selected = [];
            me.selected = [...seleteds];
        },

        addUserAsync() {
            const me = this;
            me.isShow = true;
        },

        setStateDetail(isShow) {
            const me = this;
            me.isShow = isShow;
        },
        resetDataDetail(){
            const me = this;
            me.user = {};
        }

    }
}
</script>

<style scoped>

</style>