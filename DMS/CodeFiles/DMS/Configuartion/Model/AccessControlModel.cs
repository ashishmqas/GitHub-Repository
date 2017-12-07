using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntity.Model
{
    public class AccessControlModel
    {
        public string Id { get; set; }
        public string Read { get; set; }
        public string Write { get; set; }       
        public string Role { get; set; }
        public string Userid { get; set; }
        public string ScreenId { get; set; }
        public string Condition { get; set; }
        public string  Password { get; set; }
    }
}
