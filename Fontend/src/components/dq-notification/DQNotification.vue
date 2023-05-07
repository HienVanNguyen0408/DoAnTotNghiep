<template>
    <div>
        <a-button @click="() => openNotificationWithIcon('success')" v-if="status== $enum.NotificationStatus.Success">Success</a-button>
        <a-button @click="() => openNotificationWithIcon('info')" v-if="status== $enum.NotificationStatus.Info">Info</a-button>
        <a-button @click="() => openNotificationWithIcon('warning')" v-if="status== $enum.NotificationStatus.Warning">Warning</a-button>
        <a-button @click="() => openNotificationWithIcon('error')" v-if="status== $enum.NotificationStatus.Error">Error</a-button>
    </div>
</template>

<script>
import { notification } from 'ant-design-vue';
export default {
    props: {
        status: {
            default: 1,
            typeof: Number
        },
        message: {
            default: '',
            typeof: String
        },
        title: {
            default: '',
            typeof: String
        },
        duration :{
            default : 1,
            typeof : Number
        },
        icon : {
            default : '',
            typeof : String
        },
        closeIcon : {},
    },
    data(){
        return{
            
        }
    },
    computed : {

    },
    created() {

    },
    methods: {
        openNotificationWithIcon(type) {
            const me = this;
            notification[type]({
                message: `${me.title}`,
                description: `${me.message}`,
                onClick: () => {
                    console.log('Notification Clicked!');
                    this.$emit('onClick')
                },
                duration: me.duration,
            });
        }
    }
}
</script>

<style lang="scss" scoped></style>