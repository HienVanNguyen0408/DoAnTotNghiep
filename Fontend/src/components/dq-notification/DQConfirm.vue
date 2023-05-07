<template>
    <div>
        <a-popconfirm title="Are you sure delete this task?" :ok-text="textOk" :cancel-text="textCancel" @confirm="confirm"
            @cancel="cancel">
        </a-popconfirm>
    </div>
</template>

<script>
export default {
    props:{
        textOk : {
            default : 'Có',
            typeof : String
        },
        textCancel : {
            default : 'Không',
            typeof : String
        }
    },
    methods :{
        confirm(){

        },
        cancel(){

        }
    }
}
</script>

<style lang="scss" scoped></style>