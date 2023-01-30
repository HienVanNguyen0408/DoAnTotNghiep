<template>
    <div>
        <div class="flex">
            <div class="text-widget delete" @click="widgetEvent($enum.Action.Edit)">Sửa</div>
            <div class="text-widget delete ml-3" @click="widgetEvent($enum.Action.Delete)">Xóa</div>
            <div class="text-widget set-default ml-3" v-if="data && !data.is_default" @click="widgetEvent($enum.Action.SetDefault)">Đặt mặc định
            </div>
            <div class="text-widget set-default ml-3" v-if="data && data.is_default" @click="widgetEvent($enum.Action.UnSetDefault)">Bỏ mặc định
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "WidgetAddress",
    props: {
        data: {}
    },
    data() {
        return {

        }
    },
    methods: {
        widgetEvent(action) {
            const me = this;
            let payload = {
                action : action,
                data : me.data
            };
            me.$emit("widgetEvent",payload)
        },
    }
}
</script>

<style scoped>
.text-widget {
    color: #00aab7;
    cursor: pointer;
}
</style>