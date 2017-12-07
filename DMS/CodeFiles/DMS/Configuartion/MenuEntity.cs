using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity
{
    public class MenuEntity : BaseEntity
    {
        public string MenuName { get; set; }
        public string PageName { get; set; }
        public string  Url { get; set; }
        public int ParentMenuId { get; set; }
        public bool IsActive { get; set; }  
    }
}
