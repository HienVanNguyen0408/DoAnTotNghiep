using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Enum;

namespace Web.AppCore.Entities
{
    public class Pagination
    {
        public int PageIndex { get; set; } = 1;
        public int PageSize { get; set; } = 10;

        public string TextSearch { get; set; }

        public string OrderBy { get; set; }

        public string FieldSearch { get; set; }
        public List<string> ListFieldSeach { get; set; }

        public QuestionType QuestionType { get; set; } = QuestionType.All;
    }
}
