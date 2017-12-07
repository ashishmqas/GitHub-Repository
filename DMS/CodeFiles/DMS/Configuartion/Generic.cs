using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ModelEntity
{
    public class GenericCls
    {
        public enum ISOType
        {
            ISO9001 = 1,
            ISO27001,
            ISO20000

        }

        public enum roles
        {
            Admin=1,
            Auditor=2,
            LeadAuditor=3,
            Observer=4,
            Trainee=5
        }
        public enum FindingType
        {
            Major = 1,
            Minor,
            Observation,
            Opportunity_for_Improvement,
            Strength
        }
        public static void WriteError(string strClassName, string strFunctionName, string errorMessage, string strStackTrace)
        {
            try
            {
                string path = HttpRuntime.AppDomainAppPath + "/ERROR LOG" + DateTime.Today.ToString("dd-mm-yy") + ".txt";
                if (!Directory.Exists(HttpRuntime.AppDomainAppPath + "/ERROR LOG"))
                    Directory.CreateDirectory(HttpRuntime.AppDomainAppPath + "/ERROR LOG");

                using (TextWriter w = File.AppendText(HttpRuntime.AppDomainAppPath + "/ERROR LOG/ErrorLog_" + System.DateTime.Now.ToString("ddMMyyHH") + ".txt"))
                {
                    w.WriteLine("\r\nLog Entry : ");
                    w.WriteLine("{0}", DateTime.Now.ToString(CultureInfo.InvariantCulture));
                    string err = strClassName + " " + " " + strFunctionName + " " + System.Web.HttpContext.Current.Request.Url.ToString() +
                                  ". Error Message:" + errorMessage;
                    w.WriteLine(err);
                    w.WriteLine(strStackTrace);
                    w.WriteLine("__________________________");
                    w.Flush();
                    w.Close();
                }
            }
            catch (Exception ex)
            {
                WriteError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message, ex.StackTrace);
            }

        }


        public string ConvertToMMDDYYYY(string d, bool time = false, char splitChar = '/', string format = "dd/mm/yyyy")
        {
            string tm = "";
            char[] splitOn = { '/' };
            if (d.Length > 10 && time)
            {
                tm = d.Substring(10);
                d = d.Substring(0, 10);
            }
            string[] a = d.Split(splitChar);
            if (a.Length > 1)
            {
                if (format == "dd/mm/yyyy")
                {
                    if (time)
                        return a[1] + "/" + a[0] + "/" + a[2].Substring(0, 4) + tm;
                    else
                        return a[1] + "/" + a[0] + "/" + a[2].Substring(0, 4);
                }
                else
                    return a[2].Substring(0, 4) + "-" + a[0] + "-" + a[1];

            }
            return string.Empty;
        }

        public static string Encrypt(string toEncrypt, bool useHashing)
        {
            byte[] keyArray;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            // Get the key from config file

            string key = (string)settingsReader.GetValue("SecurityKey",
                                                             typeof(String));
            //System.Windows.Forms.MessageBox.Show(key);
            //If hashing use get hashcode regards to your key
            if (useHashing)
            {
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //Always release the resources and flush data
                // of the Cryptographic service provide. Best Practice
                hashmd5.Clear();
            }
            else
                keyArray = UTF8Encoding.UTF8.GetBytes(key);

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes.
            //We choose ECB(Electronic code Book)
            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)

            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();
            //transform the specified region of bytes array to resultArray
            byte[] resultArray =
              cTransform.TransformFinalBlock(toEncryptArray, 0,
              toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor
            tdes.Clear();
            //Return the encrypted data into unreadable string format
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }

    }


}
