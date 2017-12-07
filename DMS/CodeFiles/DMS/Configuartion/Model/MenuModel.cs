using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity
{
    public class MenuModel
    {
        public MenuModel()
        {
            //this.MenuEntity = new MenuEntity();
        }

        public List<MenuModel> ChildMenuList { get; set; }
        public MenuEntity MenuEntity { get; set; }
        public bool IsParentMenu { get; set; }

    }
}
