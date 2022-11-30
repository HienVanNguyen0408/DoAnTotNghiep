<template>
    <div class="dq-editor">
        <div v-if="title" class="mb-1 text-title">{{ title }}</div>
        <div class="mt-2" style="width:100%" :style="{ 'min-height': height + 'px' }">
            <vue-editor v-model="htmlContent" :disabled="disabled"
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
        editorToolbar : null,
        value : null
    },
    created(){
        const me = this;
        if(me.value && !me.htmlContent){
            me.htmlContent = me.value;
        }
    },
    watch: {
        htmlContent(newV,oldV){
            if(newV != oldV){
                this.$emit('updateData',newV);
            }
        }
    },
    data() {
        return {
            htmlContent : null
        }
    },
    methods: {
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