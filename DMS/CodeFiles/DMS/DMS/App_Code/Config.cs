using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace DMS.App_Code
{
    public static class Config
    {
        public static string insertNotificationmsg = ConfigurationManager.AppSettings["msgInsert"].ToString();
      
        public static string updateNotificationmsg = ConfigurationManager.AppSettings["msgUpdate"].ToString();
        public static string deleteNotificationmsg = ConfigurationManager.AppSettings["msgDelete"].ToString();
        public static string existNotificationmsg = ConfigurationManager.AppSettings["msgExist"].ToString();
    }
}