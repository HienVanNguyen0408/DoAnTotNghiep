<template>
  <div>
    <div class="h-input">
      <div v-if="title" class="h-mb-5 text-title">{{ title }}</div>
      <input
        v-show="false"
        ref="inputFile"
        class="input"
        type="file"
        v-bind="$attrs"
        @change="changImage($event)"
        :accept="extentions"
      />
      <div class="custom-input-file">
        <div class="file-select text-center" @click="clickSelectFile()">
          <img class="icon-select h-flex" :src="srcIcon" alt="" />
          <div class="text-center h-mt-20 file-name font-20" v-if="fileName">
            {{ fileName }}
          </div>
          <div class="text-center h-mt-20 font-20" v-else>
            Chọn file tại đây
          </div>
        </div>
        <div class="prev-img text-center dq-mgt-10" v-if="srcImg && !isAudio">
          <img width="200px" height="200px" :src="srcImg" />
        </div>
        <div v-if="srcImg && isAudio" class="dq-mgt-10">
          <audio controls style="width: 100%">
            <source :src="srcImg" type="audio/mpeg" />
          </audio>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
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
    isAudio: {
      typeof: Boolean,
      default: false,
    },
    fileData: {
      typeof: String,
      default: "",
    },
    srcImg: {
      typeof: Object,
      default: null,
    },
  },
  data() {
    return {
      fileName: null,
    };
  },
  mounted() {
    const me = this;
    me.fileName = me.name;
  },
  created(){
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
            // me.$attrs.val = e.target.files[0].name;
            me.$emit("input", e.target.value);
            me.fileName = e.target.files[0].name;
            let file = e.target.files[0];
            me.srcImg = await this.$commonFunc.getBase64FromImage(file);
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
  updated() {},
  methods: {
    clickSelectFile() {
      this.$refs.inputFile.click();
    },
    async changImage(e) {
      const me = this;
      me.fileName = e.target.files[0].name;
      let file = e.target.files[0];
      me.srcImg = await this.$commonFunc.getBase64FromImage(file);
      let dataFile = await this.$commonFunc.getFileToByte(file);
      let prams = {
        file: dataFile,
        fileName: me.fileName,
      };
      this.$emit("change", prams);
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