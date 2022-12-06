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
                            <dq-combobox :class="'w-100'" :title="'Loại bài viết'" :classTitle="'h-mb-5 font-bold'"
                                :placeholder="'Loại bài viết'" :data="BlogCategories" :keyData="'id'" :display="'name'"
                                :value.sync="blog.blog_category_id" :defaultValue="blogCategoryDefault"
                                ref="blogCategory">
                            </dq-combobox>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-input class="w-100" ref="firstInput" :title="'Tiêu đề'" placeholder="Tiêu đề"
                                v-model="blog.title"></dq-input>
                        </div>
                    </div>
                    <div class="h-row flex dq-mgt-10">
                        <div class="h-col flex-1">
                            <dq-textarea ref="firstInput" :height="150" :title="'Tóm tắt bài viết'"
                                placeholder="Tóm tắt bài viết" v-model="blog.summary"></dq-textarea>
                        </div>
                    </div>
                    <div class="h-row flex mt-3 mb-5">
                        <div class="h-col flex-1">
                            <!-- <dq-textarea ref="firstInput" :height="200" :title="'Nội dung bài viết'"
                                placeholder="Nội dung bài viết" v-model="blog.content"></dq-textarea> -->
                            <dq-editor id="editor" :height="200" :title="'Nội dung bài viết'"
                                :editorToolbar="customToolbar" v-model="blog.content" @updateData="updateContentBlog"
                                :value="blog.content">
                            </dq-editor>
                        </div>
                    </div>
                    <div class="mt-5">
                        <dq-input-file-many class="mt-5" :title="'Ảnh bài viết'" @change="changeImage" :value="blog.files">
                        </dq-input-file-many>
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
import { mapActions, mapGetters, mapMutations } from "vuex";
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
            customToolbar: this.$commonFunc.getToolBarEditor()

        }
    },
    watch: {
    },
    mounted() {
    },
    computed: {
        ...mapGetters(ModuleBlog, [
            "BlogCategories",
        ]),
        titlleMode() {
            const me = this;
            if (me.mode == me.$enum.Mode.Add) {
                return me.$t('i18nAdmin.AddBlog');
            }
            if (me.mode == me.$enum.Mode.Edit) {
                return me.$t('i18nAdmin.EditBlog');
            }
            return "";
        },

        blogCategoryDefault() {
            const me = this;
            if (me.BlogCategories && me.BlogCategories.length > 0) {
                if(!me.blog.blog_category_id){me.blog.blog_category_id =me.BlogCategories[0].id;}
                return me.BlogCategories[0].id;
            }
            return '';
        }
    },
    created() {
        const me = this;
        me.getDataForm();
    },
    methods: {
        ...mapActions(ModuleBlog, [
            "insertBlogAsync",
            "updateBlogAsync",
            'getBlogCategories'
        ]),

        async getDataForm() {
            const me = this;
            await me.getBlogCategories();
        },

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
                await me.insertBlogAsync(me.blog);
            }
            // Sửa
            else if (me.mode == me.$enum.Mode.Edit) {
                await me.updateBlogAsync(me.blog);
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
        changeImage(files) {
            const me = this;
            // let data = {
            //     file_name: param.fileName,
            //     data: param.file,
            //     content_type: param.contentType
            // };
            me.$emit("updateBlog", { ...me.blog,files : files  });
        },
        updateContentBlog(content){
            const me = this;
            me.$emit("updateBlog", { ...me.blog,content : content  });
        }
    }
}
</script>

<style lang="scss" scoped>

</style>