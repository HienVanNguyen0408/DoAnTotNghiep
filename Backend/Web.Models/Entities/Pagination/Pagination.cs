using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Models.Entities
{
    public class Pagination
    {
        public int PageIndex { get; set; } = 1;
        public int PageSize { get; set; } = 10;

        public string Filter { get; set; }

        public string OrderBy { get; set; }

        public string FieldSearch { get; set; }
        public List<string> ListFieldSeach { get; set; }

        public string FiledSort { get; set; }

        public SortType SortType { get; set; } = SortType.DESC;
    }
    public enum SortType
    {
        DESC = 1,
        ASC = 2
    }
}
