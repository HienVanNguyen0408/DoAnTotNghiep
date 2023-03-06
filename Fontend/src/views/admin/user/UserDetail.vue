<template>
    <div class="dq-detail" v-if="isShow">
        <dq-popup @closePopup="closePopup" :width="600" :height="500">
            <template slot="header">
                <div class="dq-titlte">
                    {{ titlleMode }}
                </div>
            </template>
            <template slot="content">
                <div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col w-50">
                            <dq-input class="w-100" ref="firstInput" :title="'Tài khoản'" placeholder="Tài khoản"
                                v-model="user.user_name"></dq-input>
                        </div>
                        <div class="h-col w-50 dq-mgl-10">
                            <dq-input class="w-100" :title="'Mật khẩu'" placeholder="Mật khẩu" v-model="user.password">
                            </dq-input>
                        </div>
                    </div>
                    <!-- <div class="h-row flex dq-mgt-10">
                        <div class="h-col w-50">
                            <dq-input class="w-100" :title="'Họ và tên'" placeholder="Họ và tên"
                                v-model="user.full_name"></dq-input>
                        </div>
                        <div class="h-col w-50 dq-mgl-10">
                            <dq-input class="w-100" :title="'Địa chỉ'" placeholder="Địa chỉ" v-model="user.address">
                            </dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-input class="w-100" :title="'Số điện thoại'" placeholder="Số điện thoại"
                                v-model="user.phone_number"></dq-input>
                        </div>
                    </div> -->
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-input class="w-100" :title="'Email'" placeholder="Email"
                                v-model="user.email"></dq-input>
                        </div>
                    </div>
                </div>
            </template>
            <template slot="footer">
                <div style="width:100%">
                    <div class="flex jus-right">
                        <dq-button
                            :title="'Hủy bỏ'"
                            @click="closePopup"
                        >
                        </dq-button>
                        <dq-button
                            class="dq-mgl-10"
                            :title="'Lưu'"
                            @click="saveDataAsync"
                        >
                        </dq-button>
                    </div>
                </div>
            </template>
        </dq-popup>
    </div>
</template>
<script>
import { mapActions } from "vuex";
import { ModuleUser } from "@/store/module-const";
export default {
    name: "AdminUserDetail",
    props: {
        isShow: {
            typeof: Boolean,
            default: false
        },
        user: {
            typeof: Object,
            default: null
        },
        mode: {
            typeof: String,
            default: null
        }
    },
    data() {
        return {
        }
    },
    watch: {
    },
    mounted() {
    },
    computed: {
        titlleMode() {
            const me = this;
            if (me.mode == me.$enum.Mode.Add) {
                return me.$t('i18nAdmin.AddUser');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditUser');
            }
            return "";
        }
    },
    methods: {
        ...mapActions(ModuleUser, [
            "registerUserAsync",
            "updateUserAsync"
        ]),

        /**
         * Load lại thông tin vừa thay đổi
         */
        async loadData() {
            const me = this;
            await me.$emit("loadData");
        },

        /**
         * Lưu thông tin
         */
        async saveDataAsync() {
            const me = this;
            // Thêm
            if (me.mode == me.$enum.Mode.Add) {
                await me.registerUserAsync(me.user);
            }
            // Sửa
            else if (me.mode == me.$enum.Mode.Edit) {
                await me.updateUserAsync(me.user);
            }
            me.loadData();
            me.closePopup();
        },

        /**
         * Đóng popup
         */
        closePopup() {
            const me = this;
            me.$emit("closePopup");
            me.resetData();
        },

        resetData(){
            const me = this;
            me.$emit('resetData');
        }
    }
}
</script>

<style scoped>
@import url('@/assets/contents/css/views/admin/detail/detail.css');
</style>