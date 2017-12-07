using DataLayer;
using ModelEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class MenuBL
    {
        MenuDAL obj = null;
        public MenuBL()
        {
            obj = new MenuDAL();
        }
        public List<MenuEntity> GetMenus(string empId, string role)
        {
            return obj.GetMenus(empId, role);
        }

        public List<MenuModel> GetMenuModelList(string empId, string role)
        {
            List<MenuEntity> menuList = GetMenus(empId, role);
            List<MenuModel> modelList = new List<MenuModel>();
            MenuModel model = null;
            foreach (var menuEntity in menuList)
            {
                model = new MenuModel();
                model.MenuEntity = new MenuEntity();
                model.MenuEntity.Id = menuEntity.Id;
                model.MenuEntity.MenuName = menuEntity.MenuName;
                model.MenuEntity.PageName = menuEntity.PageName;
                model.MenuEntity.Url = menuEntity.Url.Replace("~", "");
                model.IsParentMenu = menuEntity.ParentMenuId == 0 ? true : false;
                model.MenuEntity.ParentMenuId = menuEntity.ParentMenuId;
                modelList.Add(model);
            }
            var parentList = from m in modelList where m.IsParentMenu == true select m;
            return FilterMenuModel(modelList, parentList.ToList());
        }

        private List<MenuModel> FilterMenuModel(List<MenuModel> fullList, List<MenuModel> parentList)
        {
            if (fullList != null)
            {
                foreach (var model in parentList)
                {
                    var childList = from m in fullList
                                    where m.MenuEntity.ParentMenuId == model.MenuEntity.Id
                                    select m;
                    model.ChildMenuList = new List<MenuModel>();
                    model.ChildMenuList = FilterMenuModel(fullList, childList.ToList());
                }
                return parentList.ToList();
            }
            return null;
        }
    }
}
