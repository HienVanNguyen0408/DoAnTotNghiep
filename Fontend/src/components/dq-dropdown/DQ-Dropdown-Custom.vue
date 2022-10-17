<template>
<div class="h-dropdown h-display-flex">
    <a-dropdown class="" :trigger="['click']">
        <a class="ant-dropdown-link">
            <div class="icon-drop-down icon16" @click="clickIcon($event)" v-click-outside="removeActiveAction"></div>
        </a>
        <a-menu slot="overlay">
                <a-menu-item class="h-menu">
                    <div>Sửa</div>
                </a-menu-item>
                <a-menu-item class="h-menu" >
                    <div class="div">Xóa</div>
                </a-menu-item>
        </a-menu>
         <a-menu slot="overlay" v-if="typeObject != 'payment_voucher'">
                <a-menu-item class="h-menu" v-for="(item,index) in textDropdown" :key="index" @click="clickDropdown(index)">
                <div>{{ item }}</div>
            </a-menu-item>
        </a-menu>
    </a-dropdown>
</div>
</template>

<script>
import EnumDropdown from '../../../enum/enumDropdown.js'
import TypeObject from '../../../enum/typeObject.js'
import StateEnum from '../../../enum/stateEnum.js'
export default {
    data() {
        return {
            routers : ["/paymentDetail/","/paymentDetail/","/cash/revenueExpenditure/"]
        
        }
    },
    props: {
        /**
         * Trạng thái của drop down
         */
        isShowDropdown: {
            typeof: Boolean,
            default: false
        },
        /**
         * Tên loại action
         */
        text: {
            typeof: String,
            default: ""
        },
        /**
         * Text trong drop down
         */
        textDropdown: {
            typeof: Array,
            default: []
        },
        object :{
            typeof : Object,
            default :null
        },
        typeObject : {
            typeof : String,
            default : ""
        },
        isOutline : {
            typeof:Boolean,
            default:false
        },
        paymentVoucherId : {
            typeof : String,
            default : ""
        }
        
    },
 
    created() {
        
    },
    methods: {
        /**
         * Xóa bản ghi đang được chọn 
         * Created BY : NVHIEN 17/5/2021
         */
        btnDeleteClick() {
            // ẩn các action
            this.$emit('closeDropdown')
            //hiện dialog confirm
            this.$emit("showDialogConfirm")
            //set thông báo confirm 
            this.$emit("setInfoDialogConfirm")
        },
        /**
         * Click bttuon nhân bản nhân viên 
         * Created BY : NVHIEN 17/5/2021
         */
        copyEmployee() {
            this.$emit('copyEmployee')
        },
        /**
         * click icon dropdown
         * Created BY : NVHIEN 26/5/2021
         */
        clickIcon(event) {
            // add class outline cho icon
            if(this.isOutline == false){
                 event.currentTarget.classList.add('active-action');
            }
            this.$emit("clickIcon")
            
            // Lấy ra thông tin của đối tượng tại row đ
        },
        /**
         * Xóa bỏ outline các icon drop down k phải focus
         * Created BY : NVHIEN 26/5/2021
         */
        removeActiveAction(event) {
            if(this.isOutline == false){
                if (event.target.classList.contains("icon-drop-down")) {
                    let activeIcon = document.querySelectorAll('.active-action');
                    activeIcon.forEach((activeElement) => {
                        activeElement.classList.remove('active-action');
                    });
                    //Sau đó border cho mũi tên vừa click
                    event.target.classList.add('active-action')
                } else {
                    //Nếu chỗ click ko phải mũi tên thì loại bỏ border cho mũi tên
                    let activeIcon = document.querySelectorAll('.active-action');
                    activeIcon.forEach((activeElement) => {
                        activeElement.classList.remove('active-action');
                    });
                }
            }
        },
        /**
         * Click text trong drop down 
         * created by : NVHIEN 7/6/2021
         */
        textClick(){
            if(this.typeObject == TypeObject.ACCOUNT_SYSTEM){
                this.$emit("editClick")
            }
            if(this.typeObject == TypeObject.PAYMENT_VOUCHER){
                this.$emit("viewClick")
            }
        },
        clickDropdown(index){
            if(this.textDropdown[index] == EnumDropdown.DELETE){
                this.$emit("showDialogConfirm")
                let msg = ""
                if(this.typeObject == TypeObject.SUPPLIER){
                    msg = "Bạn có thực sự muốn xóa Nhà cung cấp <"+ `${this.object.supplier_code}`+ "> không ?"
                }
                if(this.typeObject == TypeObject.ACCOUNT_SYSTEM){
                    msg = "Bạn có thực sự muốn xóa Tài khoản <"+ `${this.object.account_number}`+ "> không ?"
                }
                if(this.typeObject == TypeObject.PAYMENT_VOUCHER){
                    msg = "Bạn có thực sự muốn xóa Phiếu chi <"+ `${this.object.voucher_number}`+ "> không ?"
                }
                this.$emit("setMsg",msg)
            }
            if(this.textDropdown[index] == EnumDropdown.EDIT){
                //Lấy dữ liệu
                // if(this.typeObject == TypeObject.SUPPLIER){
                //     // this.$emit("clickButtonEdit",this.object.supplier_id)
                    
                // }
                // if(this.typeObject == TypeObject.ACCOUNT_SYSTEM){
                //     this.$emit("clickButtonEdit",this.object.account_system_id)
                // }
                this.$emit("setStateFormMode",StateEnum.formEdit,()=>{})
                this.$emit('showDialog');
            }
            if(this.textDropdown[index] == EnumDropdown.VIEW){
                if(this.typeObject == TypeObject.SUPPLIER || this.typeObject == TypeObject.PAYMENT_VOUCHER){
                    // this.$emit("clickButtonEdit",this.object.supplier_id)
                    this.$emit("setStateFormMode",2,()=>{})
                    this.$emit('showDialog');
                }
            }
            // Nhân bản
            if(this.textDropdown[index] == EnumDropdown.COPY){
                if(this.typeObject == TypeObject.PAYMENT_VOUCHER){
                    // let payment_voucher = {...this.object}
                    this.$emit("copyPaymentVoucher",this.object)
                }
            }
            // Cất và thêm
            if(this.textDropdown[index] == EnumDropdown.SAVE_ADD){
                this.$emit("savePaymentVoucherAdd")
            }
            // Cất và đóng
            if(this.textDropdown[index] == EnumDropdown.SAVE_CLOSE){
                this.$emit("saveCloseClick")
            }
        }
    }
}
</script>

<style scoped>
.hide-dropdown {
    display: none;
}
.h-display-flex {
    display: flex;
}
.h-dropdown .h-text {
    font-weight: 600;
    color: #0075c0;
    transition: all .25s ease;
    white-space: nowrap;
    font-size: 13px;
    cursor: pointer;
}
.action-dropdown {
    position: absolute;
    min-width: 130px;
    top: 40px;
    left: 48px;
    background-color: #fff;
    border: 1px solid #c7c7c7;
    z-index: 20;
}
.div{
    color: #000000;;
}
.action-dropdown .li {
    list-style-type: none;
    margin: 0;
    padding: 0;
    text-transform: none;
    text-decoration: none;
    font-weight: 400 !important;
    padding: 5px 0 5px 10px;
    font-size: 13px
}
.action-dropdown .li:hover {
    background-color: #babec5;
    color: #2ca01c;
}
.action-dropdown .icon-drop-down {
    outline: 1px solid #0075c0 !important;
}
.active-action {
    outline: 1px solid #0075c0 !important;
}
.ant-dropdown-menu-item {
    color: #111;
}
.ant-dropdown-menu-item:hover {
    background-color: #babec5;
    color: #2ca01c;
}
</style>