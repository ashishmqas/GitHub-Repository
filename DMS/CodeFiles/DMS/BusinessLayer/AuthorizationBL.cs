using DataLayer;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class AuthorizationBL
    {
        AuthorizationDAL oAuthorizationDAL = null;

        public AuthorizationBL()
        {
            oAuthorizationDAL = new AuthorizationDAL();
        }
        public DataTable GetScreenInfo(string condtion, string role = null)
        {
            DataSet ds = oAuthorizationDAL.GetScreenInfo(condtion, role);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            else
                return null;
        }
        public int SaveRoleRights(AccessControlModel ac)
        {
            return oAuthorizationDAL.SaveRoleRights(ac);
        }
        public int SaveRole(AccessControlModel ac)
        {
            return oAuthorizationDAL.SaveRole(ac);
        }
        public void DeleteFunctionRole(AccessControlModel ac)
        {
            oAuthorizationDAL.DeleteFunctionRole(ac);
        }
        public DataTable AsignRoleSelectStatement(AccessControlModel ac)
        {
            DataSet ds = oAuthorizationDAL.AsignRoleSelectStatement(ac);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            else
                return null;
        }

        public List<string> Login(AccessControlModel ac)
        {
            DataSet ds = oAuthorizationDAL.Login(ac);
            List<string> ls = new List<string>();
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    ls.Add(dt.Rows[0][0].ToString());
                    ls.Add(dt.Rows[0][1].ToString());
                }
            }

            return ls;
        }


    }
}
