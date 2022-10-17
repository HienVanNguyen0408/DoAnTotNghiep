import Vue from 'vue';
import Enum from '@/enum/enum';
import moment from 'moment';
const formatMoney = Vue.filter('formatMoney', function (money) {
    return new Intl.NumberFormat().format(money).replaceAll(",",".");
});
 
const paymentMethods = Vue.filter('paymentMethods', function(payment){
    var methods = "";
    switch(payment){
        case Enum.PaymentMethods.Cash:
            methods = "Tiền mặt";
            break;
        case Enum.PaymentMethods.Transfer:
            methods = "Chuyển khoản";
            break;
    }
    return methods;
});

const color = Vue.filter('color', function(col){
    var color = "";
    switch(col){
        case Enum.Color.Green:
            color = "Màu xanh";
            break;
        case Enum.Color.Brown:
            color = "Màu nâu";
            break;
        case Enum.Color.Yellow:
            color = "Màu vàng";
            break;
        case Enum.Color.DarkBrown:
            color = "Màu nâu sẫm";
            break;
        default:
            color = col;
            break;
    }
    return color;
});

const formatDate = Vue.filter('formatDate', function (date) {
    return moment(date).format("DD/MM/YYYY")
});

const orderStatus = Vue.filter('orderStatus', function(col){
    let status = null;
    switch(col){
        case Enum.OrderStatus.WaitConfirm:
            status = "Chờ xác nhận";
            break;
        case Enum.OrderStatus.WaitProduct:
            status = "Đang lấy hàng";
            break;
        case Enum.OrderStatus.Delivering:
            status = "Đang giao hàng";
            break;
        case Enum.OrderStatus.Fail:
            status = "Giao hàng thất bại";
            break;
        case Enum.OrderStatus.Success:
            status = "Giao hàng thành công";
        break;
        default:
            status = col;
            break;
    }
    return status;
});

const workPriority = Vue.filter('workPriority', function(col){
    let status = null;
    switch(col){
        case Enum.WorkPriority.Work1:
            status = 'Quan trọng, khẩn cấp';
            break;
        case Enum.OrderStatus.Work2:
            status = 'Quan trọng, không khẩn cấp';
            break;
        case Enum.OrderStatus.Work3:
            status = 'Không quan trọng, khẩn cấp';
            break;
        case Enum.OrderStatus.Work4:
            status = 'Không quan trọng, không khẩn cấp';
            break;
        default:
            status = col;
            break;
    }
    return status;
});
export default { formatMoney ,paymentMethods,color,formatDate,orderStatus,workPriority}

