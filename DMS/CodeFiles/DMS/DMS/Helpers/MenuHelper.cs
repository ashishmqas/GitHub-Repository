using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using ModelEntity;

namespace QMSViews.Helpers
{
    public class MenuHelper
    {
        public const string JsCallBack = "javascript:void(0)";
        public static HtmlGenericControl GetMasterMenu(List<MenuModel> list)
        {
            var ul = new HtmlGenericControl("ul");
            ul.ID = "main-menu";
            ul.Attributes.Add("class", "sm sm-blue");

            foreach (var menuModel in list)
            {
                ul.Controls.Add(CreateMenues(menuModel));
            }
            return ul;
        }

        private static HtmlGenericControl CreateMenues(MenuModel model)
        {
            var anchor = new HtmlGenericControl("a");
            anchor.Attributes.Add("href", model.MenuEntity.Url == string.Empty ? JsCallBack : model.MenuEntity.Url);
            anchor.InnerText = model.MenuEntity.MenuName;
            var li = new HtmlGenericControl("li");
            li.Controls.Add(anchor);
            if (model.ChildMenuList != null && model.ChildMenuList.Count > 0)
            {
                var ul = new HtmlGenericControl("ul");
                foreach (var child in model.ChildMenuList)
                {
                    ul.Controls.Add(CreateMenues(child));
                }
                li.Controls.Add(ul);
            }
            return li;
        }
    }
}