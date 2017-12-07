using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using BusinessLayer;
using ModelEntity.Model;
using ModelEntity;
using System.Reflection;

namespace WcfServiceDMS
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class UserLogin : IUserLogin
    {
        public List<string> LoginUserDetails(UserDetails userInfo)
        {
            List<string> usr = new List<string>();
            try
            {
                AccessControlModel ac = new AccessControlModel();
                AuthorizationBL oAuthorizationBL = new AuthorizationBL();
                ac.Userid = userInfo.UserName;
                ac.Password = userInfo.Password;
                usr = oAuthorizationBL.Login(ac);
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return usr;
        }
    }
}
