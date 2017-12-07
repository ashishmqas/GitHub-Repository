using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfServiceDMS
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IUserLogin    {

       

        [OperationContract]
        List<string> LoginUserDetails(UserDetails composite);

        // TODO: Add your service operations here
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class UserDetails
    {
        string username = string.Empty;
        string password = string.Empty;
        string empid;

        [DataMember]
        public string UserName { get { return username; } set { username = value; } }

        [DataMember]
        public string Password { get { return password; } set { password = value; } }

    }
}
