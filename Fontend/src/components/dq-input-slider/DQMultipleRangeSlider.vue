<template>
    <div>
        <div style="display: flex; justify-content: space-between; text-align: center">
            <span style="
                  display: inline-block;
                  padding: 10px;
                  border: solid 1px;
                  border-radius: 5px;
                  width: 100px;
                  margin: 3px;
                ">{{ barMinValue }}</span>
            <span style="
                  display: inline-block;
                  padding: 10px;
                  border: solid 1px;
                  border-radius: 5px;
                  width: 100px;
                  margin: 3px;
                ">{{ barMaxValue }}</span>
        </div>

        <MultiRangeSlider baseClassName="multi-range-slider-bar-only" :minValue="barMinValue" :maxValue="barMaxValue"
            :max="100" :min="0" :step="5" :rangeMargin="0" @input="updateBarValues" />
    </div>
</template>

<script>
import MultiRangeSlider from "multi-range-slider-vue";
export default {
    name: "App",
    components: { MultiRangeSlider },
    data() {
        return {
            barMinValue: 10,
            barMaxValue: 90,
        };
    },
    methods: {
        updateBarValues(e) {
            this.barMinValue = e.minValue;
            this.barMaxValue = e.maxValue;
        },
    },
};
</script>

<style>
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
}

.MultiRangeSliderContainer {
    margin: auto;
    width: 800px;
}
</style>
