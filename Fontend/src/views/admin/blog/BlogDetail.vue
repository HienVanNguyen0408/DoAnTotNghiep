<template>
    <div class="dq-detail" v-if="isShow">
        <dq-popup @closePopup="closePopup" :width="600" :height="500" :isFull="true">
            <template slot="header">
                <div class="dq-titlte">
                    {{ titlleMode }}
                </div>
            </template>
            <template slot="content">
                <div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-input class="w-100" ref="firstInput" :title="'Tiêu đề'" placeholder="Tiêu đề"
                                v-model="blog.title"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-textarea ref="firstInput" :height="200" :title="'Tóm tắt bài viết'" placeholder="Tóm tắt bài viết"
                                v-model="blog.summary"></dq-textarea>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-textarea ref="firstInput" :height="200" :title="'Nội dung bài viết'" placeholder="Nội dung bài viết"
                                v-model="blog.content"></dq-textarea>
                        </div>
                    </div>
                    <div class="image-blog">
                        <dq-input-file :title="'Ảnh bài viết'" v-model="blog.image" @change="changeImage"></dq-input-file>
                    </div>
                </div>
            </template>
            <template slot="footer">
                <div style="width:100%">
                    <div class="flex jus-right">
                        <dq-button :title="'Hủy bỏ'" @click="closePopup">
                        </dq-button>
                        <dq-button class="dq-mgl-10" :title="'Lưu'" @click="saveDataAsync">
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
    name: "BlogDetail",
    props: {
        isShow: {
            typeof: Boolean,
            default: false
        },
        blog: {
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
                return me.$t('i18nAdmin.AddBlog');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditBlog');
            }
            return "";
        }
    },
    created(){
        const me = this;
    },
    methods: {
        ...mapActions(ModuleBlog, [
            "insertBlogAsync",
            "updateBlogAsync"
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
                await me.insertBlogAsync(me.blogCategory);
            }
            // Sửa
            else if (me.mode == me.$enum.Mode.Edit) {
                await me.updateBlogAsync(me.blogCategory);
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

        resetData() {
            const me = this;
            me.$emit('resetData');
        },
        changeImage(prams){
            const me = this;
            console.log(prams);
        }
    }
}
</script>

<style lang="scss" scoped>

</style>