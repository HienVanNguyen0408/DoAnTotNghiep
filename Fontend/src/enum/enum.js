export default {
    Role: {
        Admin: 0,
        User: 1
    },
    PaymentMethods: {
        /// <summary>
        /// Chuyển khoản
        /// </summary>
        Transfer: 0,
        /// <summary>
        /// Tiền mặt, thanh toán khi nhận hàng
        /// </summary>
        Cash: 1,
    },

    Color: {
        Green: 1,
        Brown: 2,
        Yellow: 3,
        DarkBrown: 4
    },

    Format: {
        Number: 1,
        Money: 2,
        Date: 3,
        Color: 4,
        PaymentMethods: 5,
        OrderStatus: 6,
        Gender : 7
    },

    SortStatus: {
        None: 0,
        Desc: 1,
        Asc: 2
    },

    OrderStatus: {
        // chờ xác nhận
        WaitConfirm: 5,
        // chờ lấy hàng
        WaitProduct: 1,
        // Đang giao
        Delivering: 2,
        // Đã giao
        Fail: 3,
        Success: 4,
    },
    Part: {
        Part1: "Part1",
        Part2: "Part2",
        Part3: "Part3",
        Part4: "Part4",
        Part5: "Part5",
        Part6: "Part6",
        Part7: "Part7",
    },
    UpdateType:{
        Insert: 1,
        Edit : 2
    },

    Mode:{
        // Thêm
        Add : 1,
        //Sửa 
        Edit : 2
    },
    ExamForm :{
        SelectOne : 1,
        SelectMany : 2,
        TrueFalse : 3,
    },
    Question :{
        All : 2,
        Read : 0,
        Listen : 1
    },
    Status : {
        Ok : 200,
        Created : 201,
        Accepted : 202,
        NoContent  : 204,
        BadRequest : 400,
        Authorized : 401,
        NotFound : 404,
        ServerError : 500,
        BadGateway : 502,
    },
    LevelNumber :{
        Beginner : 0,
        HighBeginner :200,
        LowIntermediate :350,
        Intermediate :400,
        HighIntermediate :550,
        LowAdvanced :650,
        Advanced :800,
    },
    PeriodFilter:{
        //Ngày hôm nay
        ToDay : 1,
        //Tuần này
        ThisWeek : 7,
        //Tháng trước
        LastMonth: 29,
        //Tháng này
        ThisMonth: 30,
        //Tháng sau
        NextMonth: 31,
        //Quý này 
        ThisQuarter : 90,
        //Quý 1
        QuarterI : 91,
        //Quý 2
        QuarterII : 92,
        //Quý 3
        QuarterIII : 93,
        //Quý 4
        QuarterIV : 94,
        //Năm trước
        LastYear : 364,
        //Năm nay
        ThisYear : 365,
        //Năm sau
        NextYear : 366,
        //6 tháng đầu năm
        FirstSixMonth : 188,
        //6 tháng cuối năm
        LastSixMonth : 189,
        //Tùy chọn
        Option : 999
    },
    Time : {
        Day:1,
        Week : 2,
        Month : 3,
        Quarter : 4,
        Year : 5
    },
    StatusTime : {
        //Quá khứ
        Last : 1,
        //Hiện tại
        Present: 2,
        //tương lai
        Future : 3
    },
    WorkStatus:{
        /// <summary>
        /// Việc chưa thực hiện/ chưa làm
        /// </summary>
        YetProcess : 1,
        /// <summary>
        /// Đang làm
        /// </summary>
        Doing : 2,
        /// <summary>
        /// Hoàn thành
        /// </summary>
        Success : 3,
    },
    WorkPriority:{
        /// <summary>
        /// Quan trọng, khẩn cấp 
        /// </summary>
        Work1 : 1,
        /// <summary>
        ///  Quan trọng, không khẩn cấp
        /// </summary>
        Work2 : 2,
        /// <summary>
        /// Không quan trọng, khẩn cấp
        /// </summary>
        Work3 : 3,
        /// <summary>
        /// Không quan trọng, không khẩn cấp
        /// </summary>
        Work4 : 4,
    },
    ProductSizeType :{
        //Size bằng chữ: S, M , XL, XXL
        SizeLetter : 1,
        //Size bằng số: 29,30...
        SizeNumber : 2
    }

}