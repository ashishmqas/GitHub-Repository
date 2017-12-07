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
    public class AuditorTimeBL
    {
        AuditorTimeDAL oAuditorTimeDAL = null;

        public AuditorTimeBL()
        {
            oAuditorTimeDAL = new AuditorTimeDAL();
        }
        public DataTable GetAuditorTime(AuditorTimeModel at)
        {
            DataSet ds = oAuditorTimeDAL.GetAuditorTime(at);
            if (ds != null)
                return ds.Tables[0];
            else
                return null;
        }

        public int SaveAuditorTime(AuditorTimeModel at)
        {
            return oAuditorTimeDAL.SaveAuditorTime(at);
        }
    }
}
