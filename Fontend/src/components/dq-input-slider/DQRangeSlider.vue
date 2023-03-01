<template>
    <range-slider class="slider" :min="min" :max="max" :step="step" v-model="sliderValue" @input="handleChange">
    </range-slider>
</template>
   
<script>
import RangeSlider from 'vue-range-slider'
// you probably need to import built-in style
import 'vue-range-slider/dist/vue-range-slider.css'

export default {
    props: {
        min : {
            typeof : Number,
            default : 1000
        },
        max : {
            typeof : Number,
            default : 1000000
        },
        step : {
            typeof : Number,
            default : 1000
        }
    },
    data() {
        return {
            sliderValue : 0,
            value : 0
        }
    },
    components: {
        RangeSlider
    },
    methods:{
        handleChange(){
            const me = this;
            me.$emit("changeValue", me.sliderValue);            
        }
    }
}
</script> 
   
<style scoped>
.slider {
    /* overwrite slider styles */
    width: 200px;
}
</style> 