<template>
    <div class="mt-2">
        <div v-if="isButton">
            <dq-button :title="'Chọn file'" @click="clickSelectFile()"></dq-button>
            <input v-show="false" ref="inputFile" class="input" type="file" v-bind="$attrs" @change="changImage($event)"
                :accept="extentions" />
        </div>
        <div class="h-input" v-else>
            <div v-if="title" class="h-mb-5 text-title">{{ title }}</div>
            <input v-show="false" ref="inputFile" class="input" type="file" v-bind="$attrs" @change="changImage($event)"
                :accept="extentions" />
            <div class="custom-input-file">
                <div class="file-select flex justify-center align-center" @click="clickSelectFile()">
                    <div>
                        <div class="flex justify-center align-center">
                            <img class="icon-select mb-5" :src="srcIcon" alt="" />
                        </div>
                        <div class="text-lg font-bold">
                            Chọn file tại đây
                        </div>
                    </div>
                </div>
                <div class="flex justify-center align-center" v-if="files && files.length > 0">
                    <div class="images flex justify-center align-center">
                        <div class="image flex-1 border border-b-gray-400 flex-wrap w-24 h-24" v-for="(file, index) in files" :key="index">
                            <div>
                                <div class="font-20 mb-5 text-lg font-bold" v-if="fileName">
                                    {{ fileName }}
                                </div>
                            </div>
                            <img class="w-24 h-24" :src="file.srcImage" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script>
export default {
    name: 'DQInputFileMany',
    props: {
        icon: {
            typeof: String,
            default: "",
        },
        title: {
            typeof: String,
            default: "",
        },
        extentions: {
            typeof: String,
            default: ".jpg, .png, .jpeg, .gif",
        },
        name: {
            typeof: String,
            default: "",
        },
        fileData: {
            typeof: String,
            default: "",
        },
        isButton: {
            typeof: Boolean,
            default: false
        },
    },
    data() {
        return {
            fileName: null,
            srcImg: null,
            files: []
        };
    },
    mounted() {
        const me = this;
        me.fileName = me.name;
    },
    created() {
    },
    computed: {
        inputListeners: function () {
            var me = this;
            // `Object.assign` merges objects together to form a new object
            return Object.assign(
                {},
                // We add all the listeners from the parent
                this.$listeners,
                {
                    // This ensures that the component works with v-model
                    input: async function (e) {
                        // let srcImage = await this.$commonFunc.getBase64FromImage(file);
                        // me.srcFiles.push(srcImage);

                        me.fileName = e.target.files[0].name;
                        // let file = e.target.files[0];
                        // let dataFile = await this.$commonFunc.getFileToByte(file);
                        // me.files.push({
                        //     file: dataFile,
                        //     fileName: me.fileName,
                        //     contentType: file.type
                        // });
                        me.$emit("input", e.target.value);

                    },
                    click: (event) => {
                        this.$emit("click", event);
                    },
                    change: () => {
                        this.$emit("change", this.value);
                    },
                    // focus : () =>{
                    //   this.focus();
                    // },
                    // blur:()=>{
                    //   this.onBlur();
                    // }
                }
            );
        },
        srcIcon() {
            return require("@/assets/contents/icon/icon-upload.png");
        },
    },
    updated() { },
    methods: {
        clickSelectFile() {
            this.$refs.inputFile.click();
        },
        async changImage(e) {
            const me = this;
            let file = e.target.files[0];
            let srcImage = await this.$commonFunc.getBase64FromImage(file);
            me.fileName = e.target.files[0].name;
            let dataFile = await this.$commonFunc.getFileToByte(file);
            me.files.push({
                file: dataFile,
                fileName: me.fileName,
                contentType: file.type,
                srcImage : srcImage
            });
            me.$emit("input", e.target.value);
            this.$emit("change", me.files);
        },
    },

    beforeDestroy() {
        this.srcImg = null;
    },
};
</script>
  
<style scoped>
.h-input {
    position: relative;
    box-sizing: border-box;
}

.input {
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    padding-left: 10px;
}

.h-icon-input {
    position: absolute;
    top: 8px;
    right: 10px;
}

.custom-input-file {
    border: 1px solid #e5e5e5;
    padding: 20px;
}

.icon-select {
    cursor: pointer;
}

.text-title {
    font-weight: bold;
}

.prev-img {
    margin-top: 20px;
    margin-bottom: 20px;
}

.file-name {
    font-weight: bold;
    font-size: 20px;
}
</style>