<template>
    <div>
        <div v-if="title" class="mb-1 font-bold">{{ title }}</div>
        <v-input-colorpicker v-model="color"/>
    </div>
</template>

<script>
export default {
    name: "DQColorPicker",
    components: {
    },
    props: {
        title: {
            typeof: String,
            default: ""
        },
        height: {
            typeof: Number,
            default: 150
        },
        disabled: {
            typeof: Boolean,
            default: false
        },
        value: null
    },
    data() {
        return {
            color: "#000000"
        }
    },
    watch: {
        color(newV, oldV){
            const me = this;
            if(newV != oldV){
                me.$emit('change',newV);
            }
        }
    },
    methods:{
    }
}
</script>

<style lang="scss" scoped>

</style>