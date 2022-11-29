<template>
    <div class="dq-editor">
        <div v-if="title" class="mb-1 text-title">{{ title }}</div>
        <div class="mt-2" style="width:100%" :style="{ 'min-height': height + 'px' }">
            <vue-editor @imageAdded="handleImageAdded" v-model="htmlContent" :disabled="disabled"
            :editorToolbar="editorToolbar"
            >
            </vue-editor>
        </div>
    </div>
</template>
 
<script>
  import { VueEditor } from 'vue2-editor'
export default {
    name: 'DQEditor',
    components: {
        VueEditor
    },
    props: {
        title: {
            typeof: String,
            default: ""
        },
        height: {
            typeof: Number,
            default: 300
        },
        disabled: {
            typeof: Boolean,
            default: false
        },
        editorToolbar : null
    },
    data() {
        return {
            htmlContent: 'Heloo Hiến',
        }
    },
    methods: {
        handleImageAdded: function (file, Editor, cursorLocation, resetUploader) {
            console.log(file);
            console.log(Editor);
            console.log(cursorLocation);
            console.log(resetUploader);
            // An example of using FormData
            // NOTE: Your key could be different such as:
            // formData.append('file', file)

        }
    }
}
</script>

<style lang="scss" scoped>
.dq-editor {}

.dq-editor .quillWrapper {
    height: 100% !important;
}

.text-title {
    font-weight: bold;
}
</style>