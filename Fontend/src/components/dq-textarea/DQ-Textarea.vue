<template>
    <div>
        <div class="h-input">
            <div v-if="title" class="dq-mgb-5 text-title">{{ title }}</div>
            <textarea style="width:100%" :style="{height : height+'px'}" class="input" type="text" v-bind="$attrs" v-on="inputListeners"></textarea>
        </div>
    </div>
</template>

<script>
    export default {
        name:"DQTextarea",
        props:{
            title:{
                typeof:String,
                default:""
            },

            height:{
                typeof:Number,
                default : 100
            }, 
            
        },
        computed: {
            inputListeners: function () {
            var vm = this
            // `Object.assign` merges objects together to form a new object
            return Object.assign({},
                // We add all the listeners from the parent
                this.$listeners,
                // Then we can add custom listeners or override the
                // behavior of some listeners.
                {
                // This ensures that the component works with v-model
                input: function (event) {
                    vm.$emit('input', event.target.value)
                }
                }
            )
            }
        },
    }
</script>

<style scoped>
.h-input{
    box-sizing: border-box;
    
}
.input{
    border: 1px solid #e5e5e5;
    border-radius: 4px;
    padding-left: 10px;
    outline: none !important;
}
.text-title{
    font-weight: bold;
}
</style>