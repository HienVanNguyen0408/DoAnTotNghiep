import Enum from '@/enum/enum';
import moment from 'moment';
class DateRange{
    convertDateToMoment(date,format = "DD/MM/YYYY"){
        if(!date) return null;
        let dateT = new Date(date);
        let dateM = moment(dateT,format);
        return dateM;
    }

    convertDate(date, format="DD/MM/YYYY"){
        if(!date) return null;
        return moment(date).format(format);
    }

    calculatorDateRange(fromD,toD, period){
        let me = this;
        let fromDate = null,toDate = null;
        let toDay = new Date();
        // ngày thứ bao nhiêu trong tuần
        let numberDay = toDay.getDay();
        let day = toDay.getDate();
        let month = toDay.getMonth();
        let year = toDay.getFullYear();

        switch (period) {
            case Enum.PeriodFilter.ToDay:
                fromDate = me.formatDateToString(toDay);
                toDate = me.formatDateToString(toDay);
                break;
            case Enum.PeriodFilter.ThisWeek:
                fromDate = me.formatDateToString(new Date(year,month,day-numberDay+1));
                toDate = me.formatDateToString(new Date(year,month,day-numberDay + 7));
                break;
            case Enum.PeriodFilter.LastMonth:
                month = month-1;
                fromDate = me.formatDateToString(new Date(year,month,1));
                toDate = me.formatDateToString(new Date(year,month,me.getDayOfMonth(new Date(year,month,1))));
                break;
            case Enum.PeriodFilter.ThisMonth:
                fromDate = me.formatDateToString(new Date(year,month,1));
                toDate = me.formatDateToString(new Date(year,month,me.getDayOfMonth(toDay)));
                break;
            case Enum.PeriodFilter.NextMonth:
                month = month+1;
                fromDate = me.formatDateToString(new Date(year,month,1));
                toDate = me.formatDateToString(new Date(year,month,me.getDayOfMonth(new Date(year,month,1))));
                break;
            case Enum.PeriodFilter.ThisQuarter:
                let dateQuarter = me.getDateOfQuarter(month+1);
                if(dateQuarter){
                    fromDate = dateQuarter.fromDate;
                    toDate = dateQuarter.toDate;
                }
                break;
            case Enum.PeriodFilter.QuarterI:
                let dateQuarter1 = me.getDateOfQuarter(1);
                if(dateQuarter1){
                    fromDate = dateQuarter1.fromDate;
                    toDate = dateQuarter1.toDate;
                }
                break;
            case Enum.PeriodFilter.QuarterII:
                let dateQuarter2 = me.getDateOfQuarter(4);
                if(dateQuarter2){
                    fromDate = dateQuarter2.fromDate;
                    toDate = dateQuarter2.toDate;
                }
                break;
            case Enum.PeriodFilter.QuarterIII:
                let dateQuarter3 = me.getDateOfQuarter(7);
                if(dateQuarter3){
                    fromDate = dateQuarter3.fromDate;
                    toDate = dateQuarter3.toDate;
                }
                break;
            case Enum.PeriodFilter.QuarterIV:
                let dateQuarter4 = me.getDateOfQuarter(10);
                if(dateQuarter4){
                    fromDate = dateQuarter4.fromDate;
                    toDate = dateQuarter4.toDate;
                }
                break;
            case Enum.PeriodFilter.FirstSixMonth:
                fromDate = me.formatDateToString(new Date(year,0,1));
                toDate = me.formatDateToString(new Date(year,5,30));
                break;
            case Enum.PeriodFilter.LastSixMonth:
                fromDate = me.formatDateToString(new Date(year,6,1));
                toDate = me.formatDateToString(new Date(year,11,31));
                break;
            case Enum.PeriodFilter.LastYear:
                fromDate = me.formatDateToString(new Date(year-1,0,1));
                toDate = me.formatDateToString(new Date(year-1,11,me.getDayOfMonth(new Date(year-1,11,1))));
                break;
            case Enum.PeriodFilter.ThisYear:
                fromDate = me.formatDateToString(new Date(year,0,1));
                toDate = me.formatDateToString(new Date(year,11,me.getDayOfMonth(new Date(year,11,1))));
                break;
            case Enum.PeriodFilter.NextYear:
                fromDate = me.formatDateToString(new Date(year+1,0,1));
                toDate = me.formatDateToString(new Date(year+1,11,me.getDayOfMonth(new Date(year,11,1))));
                break;
            case Enum.PeriodFilter.Option:  
            default:
                break;
        }   
        return {
            fromDate : convertDateToMoment(fromDate),
            toDate : convertDateToMoment(toDate),
            period : period
        };
    }
    /**
     * 
     * @param {Từ ngày} fromDate  String
     * @param {Đến ngày} toDate  String
     * @param {Danh sách enum các kỳ} periods 
     * @returns 
     */
    calculatorPeriod(fromDate,toDate,periods){
        let me = this;
        if(!periods || periods.length <= 0 || !fromDate || !toDate) return Enum.PeriodFilter.Option;
        let periodCheck = Enum.PeriodFilter.Option;
        periods.forEach(period => {
            if(periodCheck != Enum.PeriodFilter.Option) return;
            let dateRange = me.calculatorDateRange(fromDate,toDate,period.key);
            if(dateRange){
                if(dateRange.fromDate == fromDate && dateRange.toDate == toDate){
                    periodCheck = dateRange.period;
                }
            }
        });
        return periodCheck;
    }

    getPeriod(periods, period){
        return periods[`${Enum.PeriodFilter.ToDay}`] ?? Enum.PeriodFilter.Option
    }

    formatDateToString(date, format='DD/MM/YYYY'){
        if(!date) return null;
        return moment(date).format(format);
    }

    /**
     * 
     * @param {Loại mốc thời gian} typeTime 
     * @param {Thời điểm của thời gian} statusTime 
     */
    getTimeByTypeTime(typeTime,statusTime){
        let toDay = new Date;
        switch(typeTime){
            case Enum.Time.Day:
                break;
            case Enum.Time.Week:
                break;
            case Enum.Time.Month:
                break;
            case Enum.Time.Quarter:
                break;
            case Enum.Time.Year:
                break;   
        }
    }

    getTimeByTypeTimeStatusTime(statusTime){
        switch(statusTime){
            case Enum.StatusTime.Last:
                break;
            case Enum.StatusTime.Present:
                break;
            case Enum.StatusTime.Future:
                break; 
        }
    }

    /**
     * Số ngày trong 1 tháng
     */
    getDayOfMonth(date){
        let dateT =  new Date(date);
        let month = dateT.getMonth() + 1;
        let year = dateT.getFullYear();
        if(month == 1  || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) return 31;
        if(month == 4  || month == 6 || month == 9 || month == 11) return 30;
        if(month == 2){
            //năm nhuận 
            if((year % 4 == 0 && year % 4 != 0) || (year % 100 == 0 && year % 400 == 0)) return 29;
            return 28;
        }
        return null;
    }
    /**
     * Quý thứ bao nhiêu trong năm 
     */
     getDateOfQuarter(month){
        let me = this;
        let toDay = new Date();
        let year = toDay.getFullYear();
        if(month <= 3 && month >= 1){
            return {
                fromDate: me.formatDateToString(new Date(toDay.getFullYear(),0,1)),
                toDate: me.formatDateToString(new Date(toDay.getFullYear(),2,me.getDayOfMonth(new Date(year,2,1))))
            };
        };
        if(month >= 4 && month <= 6) {
            return {
                fromDate: me.formatDateToString(new Date(toDay.getFullYear(),3,1)),
                toDate: me.formatDateToString(new Date(toDay.getFullYear(),5,me.getDayOfMonth(new Date(year,5,1))))
            };
        }
        if(month >= 7 && month <= 9) {
            return {
                fromDate: me.formatDateToString(new Date(toDay.getFullYear(),6,1)),
                toDate: me.formatDateToString(new Date(toDay.getFullYear(),8,me.getDayOfMonth(new Date(year,8,1))))
            };
        }
        if(month >= 10 && month <= 12){
            return {
                fromDate: me.formatDateToString(new Date(toDay.getFullYear(),9,1)),
                toDate: me.formatDateToString(new Date(toDay.getFullYear(),11,me.getDayOfMonth(new Date(year,11,1))))
            };
        }
        return null;
    }

    getDateDefaultFilter(){
        let me = this;
        return me.formatDateToString(new Date());
    }

    getDateDefault(){
        return new Date();
    }
}

export default new DateRange();