// import { readdir } from 'fs';
import Enum from '@/enum/enum';
import moment from 'moment';
import i18nEnum from '@/i18n/vi/enum/i18nEnum';
import { notification } from 'ant-design-vue';

const keyOrderStorage = "Web-Order";
const keyCountdown = "examTimer";
const keySelection = "questions";

const keyStatusExam = "Examming";
const keyQuestionReads = "QuestioReads";
const keyPartListen = "PartListens";

const keyExamResult = "ExamResult";

const keyUserInfo = "UserInfo";
const keyOrderPayment = "OrderPayment";
// path Storage vật lý
// const prefixPathDefault = "C:\\Users\\ADMIN\\Desktop\\CLient serve\\english-test\\Fontend\\dq-fontend\\src";
class CommonFunc {
    convertImgSaveDB(img) {
        img = img.toString();
        if (img) {
            let res = img.split('\\');
            if (res) {
                img = res.at(res.length - 1);
                return img;
            }
        }
        return "";
    }
    async getBase64FromImage(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = error => reject(error);
        })
    }

    async getFileToByte(file) {
        return new Promise((resolve, reject) => {
            try {
                let reader = new FileReader();
                let fileByteArray = [];
                reader.readAsArrayBuffer(file);
                reader.onloadend = (evt) => {
                    if (evt.target.readyState == FileReader.DONE) {
                        let arrayBuffer = evt.target.result,
                            array = new Uint8Array(arrayBuffer);
                        if (array && array.length > 0) {
                            array.forEach(byte => {
                                fileByteArray.push(byte);
                            });
                        }
                    }
                    resolve(fileByteArray);
                }
            } catch (e) {
                reject(e);
            }
        })
    }

    /**
     * Thêm order vào giỏ hàng
     */
    addCart(userName, order) {
        let store = localStorage.getItem(keyOrderStorage)
        let orderStorage = !store ? {} : JSON.parse(store);
        if (!orderStorage[`${userName}`]) {
            orderStorage[`${userName}`] = {};
            orderStorage[`${userName}`].orders = [];
            orderStorage[`${userName}`].orders.push(order);
            orderStorage[`${userName}`] = {
                orders: orderStorage[`${userName}`].orders
            }
        } else {
            let exist = order && orderStorage[`${userName}`].orders.filter(x => x.id == order.id) && orderStorage[`${userName}`]
                .orders.filter(x => x.id == order.id && x.color_name == order.color_name && x.size_name && order.size_name).length > 0;
            if (exist) {
                let index = orderStorage[`${userName}`].orders.findIndex((obj => obj.id == order.id));
                orderStorage[`${userName}`].orders[index].total_amount += order.total_amount;
                orderStorage[`${userName}`].orders[index].number += order.number;
            } else {
                orderStorage[`${userName}`].orders.push(order);
                orderStorage[`${userName}`] = {
                    orders: orderStorage[`${userName}`].orders
                }
            }
        }
        localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderStorage));
    }

    addOrderPayment(orderPayment) {
        if (!orderPayment) return;
        localStorage.setItem(`${keyOrderPayment}`, JSON.stringify(orderPayment));
    }

    getOrderPayment() {
        let orderPayment = localStorage.getItem(keyOrderPayment)
        orderPayment = !orderPayment ? {} : JSON.parse(orderPayment);
        return orderPayment;
    }

    removeOrderPayment() {
        localStorage.removeItem(`${keyOrderPayment}`);
    }

    removeOrderPaymentById(id) {
        let orderPayment = localStorage.getItem(keyOrderPayment)
        orderPayment = !orderPayment ? {} : JSON.parse(orderPayment);
        if (orderPayment)
            return orderPayment;
    }

    /**
     * Lấy thông tin giỏ hàng của user
     */
    getCartByUser(userName) {
        let orderUserName = {};
        // Lấy dữ liệu trên storgare
        let store = localStorage.getItem(keyOrderStorage);
        if (!store) return orderUserName;

        // convert dữ liệu
        let orderStorage = JSON.parse(store);
        if (!orderStorage) return orderUserName;

        if (orderStorage[userName]) {
            orderUserName = {
                orders: orderStorage[userName].orders
            };
        }
        return orderUserName;
    }

    /**
     * reset dữ liệu trên storage của user
     */
    updateCartByUser(userName) {
        let store = localStorage.getItem(keyOrderStorage)
        let orderStorage = !store ? {} : JSON.parse(store);
        if (!orderStorage[`${userName}`]) {
            orderStorage[`${userName}`] = {};
        }
        if (orderStorage[`${userName}`].orders) {
            orderStorage[`${userName}`].orders = [...orderStorage[`${userName}`].orders.filter(x => !x.selected)];
            localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderStorage));
            return;
        }
        orderStorage[`${userName}`].orders = [];
        localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderStorage));
    }

    resetCartByUser(userName) {
        let store = localStorage.getItem(keyOrderStorage)
        let orderStorage = !store ? {} : JSON.parse(store);
        orderStorage[`${userName}`] = {};
        orderStorage[`${userName}`].orders = [];
        localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderStorage));
    }

    updateOrderUser(userName, orders) {
        let store = localStorage.getItem(keyOrderStorage)
        let orderStorage = !store ? {} : JSON.parse(store);
        orderStorage[`${userName}`] = {};
        orderStorage[`${userName}`].orders = orders;
        localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderStorage));
    }

    updateCartByUserAfterPayment(userName, ids) {
        let orderUserName = {};
        // Lấy dữ liệu trên storgare
        let store = localStorage.getItem(keyOrderStorage);
        if (!store) return orderUserName;

        // convert dữ liệu
        let orderStorage = JSON.parse(store);
        if (!orderStorage) return orderUserName;

        if (orderStorage[userName]) {
            let orders = orderStorage[userName].orders;
            if (ids && ids.length > 0) {
                orders = orderStorage[userName].orders.filter(x => !ids.includes(x.id));
            }
            orderUserName = {
                orders: orders
            };
        }
        localStorage.setItem(`${keyOrderStorage}`, JSON.stringify(orderUserName));
    }

    /**
     * Lấy tên tài khoản
     */
    getUserName() {
        let name = localStorage.getItem("userName");
        if (!name) {
            name = "";
        }
        return name;
    }

    updateUserInfo(user) {
        if (!user) return;
        localStorage.setItem(`${keyUserInfo}`, JSON.stringify(user));
    }

    getUserInfo() {
        let userInfo = localStorage.getItem(keyUserInfo)
        userInfo = !userInfo ? {} : JSON.parse(userInfo);
        return userInfo;
    }

    logoutUserInfo() {
        localStorage.removeItem(keyUserInfo);
    }

    getTotalMoneyOrderByUser(userName) {
        const me = this;
        if (userName) {
            let orders = [...me.getCartByUser(userName)];
            if (orders && orders.length > 1) {
                return orders.reduce((a, { amount, product }) => a + amount * product.productSalePrice, 0);
            }
            if (orders && orders.length == 1) {
                return orders[0].total_amount * orders[0].product.productSalePrice;
            }
            return null;
        }
        return null;
    }
    getAmountTotalOrderByUser(userName) {
        if (userName) {
            const me = this;
            let orders = [...me.getCartByUser(userName)];
            if (orders && orders.length > 1) {
                return orders.reduce((a, { amount }) => a + amount, 0);
            }
            if (orders && orders.length == 1) {
                return orders[0].total_amount;
            }
        }
        return null;
    }

    /**
     * format Data
     * @param {*} format 
     * @param {*} data 
     */
    formatData(format, data) {
        let res = null;
        switch (format) {
            case Enum.Format.Number:
                break;
            case Enum.Format.Money:
                res = new Intl.NumberFormat().format(data).replaceAll(",", ".");
                break;
            case Enum.Format.Date:
                res = moment(data).format("DD/MM/YYYY");
                break;
            case Enum.Format.Color:
                switch (data) {
                    case Enum.Color.Green:
                        res = "Màu xanh";
                        break;
                    case Enum.Color.Brown:
                        res = "Màu nâu";
                        break;
                    case Enum.Color.Yellow:
                        res = "Màu vàng";
                        break;
                    case Enum.Color.DarkBrown:
                        res = "Màu nâu sẫm";
                        break;
                    default:
                        res = data;
                        break;
                }
                break;
            case Enum.Format.PaymentMethods:
                switch (data) {
                    case Enum.PaymentMethods.None:
                        res = "Mặc định";
                        break;
                    case Enum.PaymentMethods.Cash:
                        res = "Tiền mặt";
                        break;
                    case Enum.PaymentMethods.TransferBank:
                        res = "Chuyển khoản ngân hàng";
                        break;
                    case Enum.PaymentMethods.TransferMomo:
                        res = "Thanh toán Momo";
                        break;
                    case Enum.PaymentMethods.TransferVNPay:
                        res = "Thanh toán VNPay";
                        break;
                    case Enum.PaymentMethods.TransferCoin:
                        res = "Thanh toán tiền ảo";
                        break;
                    case Enum.PaymentMethods.InternationalTransfer:
                        res = "Thanh toán quốc tế";
                        break;
                }
                break;
            case Enum.Format.OrderStatus:
                switch (data) {
                    case Enum.OrderStatus.None:
                        res = "Mặc định của đơn hàng";
                        break;
                    case Enum.OrderStatus.Order:
                        res = "Đặt hàng";
                        break;
                    case Enum.OrderStatus.Transfering:
                        res = "Đang đóng gói vận chuyển";
                        break;
                    case Enum.OrderStatus.Success:
                        res = "Giao hàng thành công";
                        break;
                    case Enum.OrderStatus.Fail:
                        res = "Giao hàng thất bại";
                        break;
                    case Enum.OrderStatus.Cancel:
                        res = "Đơn hàng bị hủy";
                        break;
                    default:
                        res = col;
                        break;
                }
        }
        return res;
    }

    startTimer(seconds, stop) {
        console.log(stop);
        if (stop) return;
        if (!seconds) {
            seconds = 0;
        }
        const second = 1000,
            minute = second * 60,
            hour = minute * 60,
            day = hour * 24;
        //I'm adding this section so I don't have to keep updating this pen every year :-)
        //remove this if you don't need it
        let today = new Date(),
            dd = String(today.getDate()).padStart(2, "0"),
            mm = String(today.getMonth() + 1).padStart(2, "0"),
            yyyy = today.getFullYear(),
            timeFisnish = this.addSeconds(new Date(), seconds);

        today = mm + "/" + dd + "/" + yyyy;
        //end
        const countDown = new Date(timeFisnish).getTime(),
            x = setInterval(function () {

                const now = new Date().getTime(),
                    distance = countDown - now;
                let h = Math.floor((distance % (day)) / (hour)) < 10 ? `0${Math.floor((distance % (day)) / (hour))}` : `${Math.floor((distance % (day)) / (hour))}`
                let m = Math.floor((distance % (hour)) / (minute)) < 10 ? `0${Math.floor((distance % (hour)) / (minute))}` : `${Math.floor((distance % (hour)) / (minute))}`
                let s = Math.floor((distance % (minute)) / second) < 10 ? `0${Math.floor((distance % (minute)) / second)}` : `${Math.floor((distance % (minute)) / second)}`
                let timer = h + ":" + m + ":" + s;
                let div = document.getElementById('countdownTimemer');
                if (!div) return;
                document.getElementById('countdownTimemer').innerText = timer;
                localStorage.setItem(keyCountdown, timer);
                //do something later when date is reached
                if (s <= 5) {
                    document.getElementById('countdownTimemer').classList.add("timmer-finish-animation");
                }
                if (distance < 0) {
                    document.getElementById('countdownTimemer').innerText = "00:00:00";
                    clearInterval(x);
                }
                //seconds
            }, 0)
    }

    continueCountdowExam() {
        let time = this.getTimerExam();
        if (time) {
            let arr = time.split(":");
            let hour = 0;
            let minute = 0;
            let second = 0;
            if (arr) {
                if (arr[0]) {
                    hour = parseInt(arr[0]);
                }
                if (arr[1]) {
                    minute = parseInt(arr[1]);
                }
                if (arr[2]) {
                    second = parseInt(arr[2]);
                }
            }
            let continueTime = hour * 60 * 60 + minute * 60 + second;
            this.startTimer(continueTime);
        }
    }
    getTimerExam() {
        return localStorage.getItem(keyCountdown);
    }
    addMinutes(date, minutes) {
        return new Date(date.getTime() + minutes * 60000);
    }
    addSeconds(date, seconds) {
        return new Date(date.getTime() + seconds * 1000);
    }
    getQuestionSelect(part) {
        let questions = localStorage.getItem(keySelection);
        let ques = questions ? JSON.parse(questions) : {};
        if (!part) return ques;
        if (ques) {
            return ques[`${part}`];
        }
        return ques;
    }
    saveQuestionPart(questions, part) {
        const me = this;
        if (questions) {
            questions = [...questions.map(x => ({
                options: x.options.map(option => ({ check: option.check }))
            }))];
            let ques = me.getQuestionSelect();
            if (!ques) {
                ques = {
                    [part]: []
                };
            }
            if (ques) {
                ques[`${part}`] = [];
                ques[`${part}`] = [...questions];
            }
            localStorage.setItem(keySelection, JSON.stringify(ques));
        }
    }
    setOptionToPart(questions, part) {
        const me = this;
        var ques = me.getQuestionSelect(part);
        if (!ques) return questions;
        for (let i = 0; i < questions.length; i++) {
            for (let j = 0; j < questions[i].options.length; j++) {
                questions[i].options[j]["check"] = ques[i].options[j]["check"];
            }
        }
        return questions;
    }
    setSelectToQuestion(questions, selectes) {
        if (questions && selectes) {
            let indexs = [...selectes.map(x => {
                let select = Object.keys(x).find(key => x[key] == true);
                if (select) return parseInt(select);
                return null;
            })]
            for (let i = 0; i < questions.length; i++) {
                if (!questions[i]["selected"]) {
                    questions[i]["selected"] = 0;
                }
                questions[i]["selected"] = indexs[i];
            }
            return questions;
        }
    }

    getExamForms() {
        let examForms = [
            {
                id: 1,
                examForm: Enum.ExamForm.SelectOne,
                examFormText: "Chọn 1 đáp án"
            },
            {
                id: 2,
                examForm: Enum.ExamForm.SelectMany,
                examFormText: "Chọn nhiều đáp án"
            },
            {
                id: 3,
                examForm: Enum.ExamForm.TrueFalse,
                examFormText: "Chọn đúng sai"
            }
        ];
        return examForms;
    }
    getSrcImageByPath(path) {
        if (path) {
            // path = path.replaceAll(prefixPathDefault,"");
            return require(`${path}`);
        }
        return path;
    }

    getBase64FromData(data) {
        if (data) {
            return `data:image/png;base64,${data}`;
        }
        return data;
    }

    getTextOption(index) {
        if (index == 0) return "A. ";
        if (index == 1) return "B. ";
        if (index == 2) return "C. ";
        if (index == 3) return "D. ";
    }
    removeTimmer() {
        localStorage.removeItem(keyCountdown);
    }
    runExam() {
        localStorage.setItem(keyStatusExam, true);
    }
    finishExam() {
        localStorage.removeItem(keyStatusExam);
    }
    getStatusExam() {
        return localStorage.getItem(keyStatusExam);
    }

    setQuestionReads(questionReads) {
        if (questionReads) {
            localStorage.setItem(keyQuestionReads, JSON.stringify(questionReads));
        }
    }
    deleteQuestionReadsStorage() {
        localStorage.removeItem(keyQuestionReads);
    }
    getQuestionReadsStorage() {
        let questions = localStorage.getItem(keyQuestionReads);
        if (questions) {
            return JSON.parse(questions);
        }
        return questions;
    }

    setPartListens(partListens) {
        if (partListens) {
            let res = [...partListens.map((x) => {
                return {
                    partListenId: x.partListenId,
                    questions: x.questions
                }
            })];
            let data = JSON.stringify(res);
            localStorage.setItem(keyPartListen, data);
        }
    }
    deletePartListensStorage() {
        localStorage.removeItem(keyPartListen);
    }
    getPartListensStorage() {
        let parts = localStorage.getItem(keyPartListen);
        if (parts) {
            return JSON.parse(parts);
        }
        return parts;
    }

    // Set dữ liệu kết quả lên localstorage
    setExamResult(result) {
        if (result) {
            let data = JSON.stringify(result);
            localStorage.setItem(keyExamResult, data);
        }
    }
    //Xóa dữ liệu kết quả khỏi storage
    deleteExamResult() {
        localStorage.removeItem(keyExamResult);
    }

    getExamResult() {
        let result = localStorage.getItem(keyExamResult);
        if (result) {
            return JSON.parse(result);
        }
        return result;
    }

    clearLocalStore() {
        localStorage.removeItem("examTimer");
        localStorage.removeItem("PartListens");
        localStorage.removeItem("PartListens");
        localStorage.removeItem("QuestioReads");
        localStorage.removeItem("examId");
        localStorage.removeItem("LevelNumber");
    }

    PeriodFilter(enumPeriod) {
        let text = '';
        switch (enumPeriod) {
            case Enum.PeriodFilter.ToDay:
                text = 'Ngày hôm nay';
                break;
            case Enum.PeriodFilter.ThisWeek:
                text = 'Tuần này';
                break;
            case Enum.PeriodFilter.BeforeMonth:
                text = 'Tháng trước';
                break;
            case Enum.PeriodFilter.ThisMonth:
                text = 'Tháng này';
                break;
            case Enum.PeriodFilter.AfterMonth:
                text = 'Tháng sau';
                break;
            case Enum.PeriodFilter.ThisQuarter:
                text = 'Quý này';
                break;
            case Enum.PeriodFilter.QuarterI:
                text = 'Quý 1';
                break;
            case Enum.PeriodFilter.QuarterII:
                text = 'Quý 2';
                break;
            case Enum.PeriodFilter.QuarterIII:
                text = 'Quý 3';
                break;
            case Enum.PeriodFilter.QuarterIV:
                text = 'Quý 4';
                break;
            case Enum.PeriodFilter.BeforeYear:
                text = 'Năm trước';
                break;
            case Enum.PeriodFilter.ThisYear:
                text = 'Năm nay';
                break;
            case Enum.PeriodFilter.AfterYear:
                text = 'Năm sau';
                break;
            case Enum.PeriodFilter.Option:
                text = 'Tùy chọn';
                break;
            default:
                break;
        }
        return text;
    }

    getDataEnum(keyObjectEnum, data) {
        let enumKeys = Enum[`${keyObjectEnum}`];
        let enumValues = i18nEnum[`${keyObjectEnum}`];
        let dataEnums = [];
        if (enumKeys) {
            for (var enumKey in enumKeys) {
                let dataEnum = {
                    key: enumKeys[`${enumKey}`],
                    value: enumValues[`${enumKey}`]
                }
                dataEnums.push(dataEnum);
            }
        }
        return dataEnums;
    }
    getValueStringByEnum(keyObjectEnum, value) {
        let enumValues = i18nEnum[`${keyObjectEnum}`];
        let enumKeys = Enum[`${keyObjectEnum}`];
        for (var enumKey in enumKeys) {
            if (enumKeys[`${enumKey}`] == value) {
                return enumValues[`${enumKey}`];
            }
        }
        return null;
    }

    getToolBarEditor() {
        return [
            ["bold", "italic", "underline", "strike"],
            [
                { align: "" },
                { align: "center" },
                { align: "right" },
                { align: "justify" }
            ],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
            [{ header: 1 }, { header: 2 }],
            ["blockquote", "code-block"],
            [{ list: "ordered" }, { list: "bullet" }, { list: "check" }],
            [{ script: "sub" }, { script: "super" }],
            [{ indent: "-1" }, { indent: "+1" }],
            [{ color: [] }, { background: [] }],
            // ["link", "", "video", "formula"],
            [{ direction: "rtl" }],
            ["clean"]
        ];
    }

    getSizeProduct(ProductSizeType) {
        let sizes = [];
        switch (ProductSizeType) {
            case Enum.ProductSizeType.SizeLetter:
                sizes = [
                    {
                        id: 'XS',
                        value: 'XS'
                    },
                    {
                        id: 'S',
                        value: 'S'
                    },
                    {
                        id: 'M',
                        value: 'M'
                    },
                    {
                        id: 'L',
                        value: 'L'
                    },
                    {
                        id: 'XL',
                        value: 'XL'
                    },
                    {
                        id: 'XXL',
                        value: 'XXL'
                    },
                    {
                        id: 'XXXL',
                        value: 'XXXL'
                    }
                ];
                break;
            case Enum.ProductSizeType.SizeNumber:
                sizes = [
                    {
                        id: '28',
                        value: '28'
                    },
                    {
                        id: '29',
                        value: '29'
                    },
                    {
                        id: '30',
                        value: '30'
                    },
                    {
                        id: '31',
                        value: '31'
                    },
                    {
                        id: '32',
                        value: '32'
                    },
                    {
                        id: '33',
                        value: '33'
                    },
                    {
                        id: '34',
                        value: '34'
                    }
                ];
                break;
            default:
                break;
        }
        return sizes;
    }


    showNotification(notificationStatus , option, callback) {
        if(!option){
            option = {
                duration : 1
            }
        }
        let type = 'success';
        switch (notificationStatus) {
            case Enum.NotificationStatus.Info:
                type = 'info';
                break;
            case Enum.NotificationStatus.Warning:
                type = 'warning';
                break;
            case Enum.NotificationStatus.Error:
                type = 'error';
                break;
        }
        notification[type]({
            message: `${option.title}`,
            description: `${option.message}`,
            onClick: () => {
                console.log('Notification Clicked!');
                if(callback){
                    callback('onclick')
                }
            },
            duration: option.duration ? option.duration : 1,
        });
    }
}

export default new CommonFunc();