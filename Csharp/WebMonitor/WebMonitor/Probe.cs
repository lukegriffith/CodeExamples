using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Net;

namespace WebMonitor
{
    public class Probe
    {


        public string Website { get; set; }

        public TimeSpan ResponseTime { get; set; }

        

        public void TestURL(string url, int timeout)
        {


            HttpWebRequest HttpWReq = (HttpWebRequest)WebRequest.Create(url);
            HttpWReq.Timeout = timeout;

            Debug.Write(string.Format("testing {0}.", url));

            DateTime departure = System.DateTime.Now;
            HttpWebResponse Resp = (HttpWebResponse)HttpWReq.GetResponse();
            DateTime arrival = System.DateTime.Now;
            

            WebClient client = new WebClient();
            string s = client.DownloadString(url);



            TimeSpan ResponseTime = arrival - departure;

            Debug.Write(string.Format("{0} responded.", url));

            this.Website = HttpWReq.RequestUri.Authority;
            this.ResponseTime = ResponseTime;

        }



    }
}
