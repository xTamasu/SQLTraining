using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace SQLTutorial
{
    public class SessionStorage
    {
        public Dictionary<Guid, string> answers = new Dictionary<Guid, string>();

        public static string ToJSON(SessionStorage storage)
        {
            return JsonConvert.SerializeObject(storage);
        }

        public static SessionStorage FromJSON(string json)
        {
            return JsonConvert.DeserializeObject<SessionStorage>(json);
        }
    }
}
