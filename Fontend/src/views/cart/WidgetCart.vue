<template>
    <div>
        <div class="flex">
            <!-- <div class="btn-number btn-minus-number">-</div> -->
            <div class="input-number ml-1">
                <dq-input :min="min" :max="max" :type="'number'" @input="widgetEvent" v-model="data.number"></dq-input>
            </div>
            <!-- <div class="btn-number btn-plus-number ml-1">+</div> -->
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
export default {
    props: {
        max: {
            default: 30,
            typeof: Number
        },
        min: {
            default: 1,
            typeof: Number
        },
        number: {
            default: 1,
            typeof: Number
        },
        data: {}
    },
    data() {
        return {
        }
    },
    created() {

    },
    methods: {
        widgetEvent: _.debounce(async function () {
            const me = this;
            me.$emit("widgetEvent", me.data)
        }, 0),
    }
}
</script>

<style scoped>
.btn-number {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 32px;
    height: 32px;
    background-color: #eff0f5;
    cursor: pointer;
}

.input-number {
    width: 100px;
}

.btn-minus-number {}

.btn-plus-number {}
</style>