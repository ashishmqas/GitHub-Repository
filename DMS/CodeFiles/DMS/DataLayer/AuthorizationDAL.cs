using Microsoft.Practices.EnterpriseLibrary.Data;
using ModelEntity;
using ModelEntity.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;

namespace DataLayer
{
    public class AuthorizationDAL
    {
        Database objDB;
        //   static string ConnectionString;
        public AuthorizationDAL()
        {
            // ConnectionString = ConfigurationManager.ConnectionStrings["DMS"].ToString();
            DatabaseProviderFactory factory = new DatabaseProviderFactory();
            objDB = factory.Create("DMS");
        }
        public DataSet GetScreenInfo(string condtion,string role=null)
        {
            DataSet ds = null;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_admin_select_statement"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, condtion);
                    objDB.AddInParameter(oCMD, "@role", DbType.Int32, (role!=""?role:null));
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public int SaveRoleRights(AccessControlModel ac)
        {
            int i = 0;
            using (DbConnection conn = objDB.CreateConnection())
            {
                conn.Open();
                DbTransaction trans = conn.BeginTransaction();
                try
                {
                   

                    using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_save_role_rights"))
                    {
                        objDB.AddInParameter(oCMD, "@userid", DbType.String, ac.Userid);
                        objDB.AddInParameter(oCMD, "@screenid", DbType.Int32, ac.ScreenId);
                        objDB.AddInParameter(oCMD, "@read", DbType.Int32, ac.Read);
                        objDB.AddInParameter(oCMD, "@write", DbType.Int32, ac.Write);
                        objDB.AddInParameter(oCMD, "@role", DbType.Int32, ac.Role);
                        objDB.AddInParameter(oCMD, "@condition", DbType.String, ac.Condition);
                        objDB.ExecuteScalar(oCMD, trans);
                    }
                    trans.Commit();
                    i = 1;
                }
                catch (Exception ex)
                {
                    GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
                    trans.Rollback();
                }
                conn.Close();
            }
            return i;
        }

        public int SaveRole(AccessControlModel ac)
        {
            int i = 0;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_save_role_rights"))
                {
                    objDB.AddInParameter(oCMD, "@userid", DbType.String, ac.Userid);                   
                    objDB.AddInParameter(oCMD, "@role", DbType.Int32, ac.Role);
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, ac.Condition);
                    objDB.ExecuteScalar(oCMD);
                    i = 1;
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return i;
        }

        public void DeleteFunctionRole(AccessControlModel ac)
        {
            try
            {
                using (DbCommand oCMD = objDB.GetSqlStringCommand("DELETE FROM map_role_rights WHERE roleid='" + ac.Role + "'"))
                {
                    objDB.ExecuteScalar(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
        }

        public DataSet AsignRoleSelectStatement(AccessControlModel ac)
        {
            DataSet ds = null;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_assign_roles_select_statement"))
                {
                    objDB.AddInParameter(oCMD, "@condition", DbType.String, ac.Condition);
                    objDB.AddInParameter(oCMD, "@userid", DbType.String, ac.Userid);
                    objDB.AddInParameter(oCMD, "@roleid", DbType.String, (ac.Role != "" ? ac.Role : null));
                  ds=  objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
               GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public DataSet Login(AccessControlModel ac)
        {
            DataSet ds = null;
            try
            {
                using (DbCommand oCMD = objDB.GetStoredProcCommand("sp_check_authentication"))
                {
                    //objDB.AddInParameter(oCMD, "@condition", DbType.String, ac.Condition);
                    objDB.AddInParameter(oCMD, "@userid", DbType.String, ac.Userid);
                    objDB.AddInParameter(oCMD, "@password", DbType.String, ac.Password);
                    ds = objDB.ExecuteDataSet(oCMD);
                }
            }
            catch (Exception ex)
            {
                GenericCls.WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }
            return ds;
        }

    }
}
