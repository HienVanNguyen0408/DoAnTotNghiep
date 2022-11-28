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
                        <div class="h-col flex-1">
                            <dq-input class="w-100" :title="'Tên loại bài viết'" placeholder="Tên loại bài viết"
                                v-model="blogCategory.name"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-textarea class="w-100" :title="'Mô tả loại'" :height="200" placeholder="Mô tả loại"
                                v-model="blogCategory.description"></dq-textarea>
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
import { ModuleBlog } from "@/store/module-const";
export default {
    name: "AdminBlogCategoryDetail",
    props: {
        isShow: {
            typeof: Boolean,
            default: false
        },
        blogCategory: {
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
                return me.$t('i18nAdmin.AddBlogCategory');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditBlogCategory');
            }
            return "";
        }
    },
    methods: {
        ...mapActions(ModuleBlog, [
            "insertBlogCategoryAsync",
            "updateBlogCategoryAsync"
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
                await me.insertBlogCategoryAsync(me.blogCategory);
            }
            // Sửa
            else if (me.mode == me.$enum.Mode.Edit) {
                await me.updateBlogCategoryAsync(me.blogCategory);
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

<style lang="scss" scoped>
@import url('@/assets/contents/scss/views/admin/detail/detail.scss');
</style>