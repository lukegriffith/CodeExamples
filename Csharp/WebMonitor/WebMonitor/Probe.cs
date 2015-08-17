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

            // Initiating WebRequest Object
            HttpWebRequest HttpWReq = (HttpWebRequest)WebRequest.Create(url);
            // Setting Timeout
            HttpWReq.Timeout = timeout;

            Debug.Write(string.Format("testing {0}.", url));
            
            // Setting date for response time
            DateTime departure = System.DateTime.Now;
            
            // initiating request
            HttpWebResponse Resp = (HttpWebResponse)HttpWReq.GetResponse();
            
            // Last date point for response time
            DateTime arrival = System.DateTime.Now;
            
            // Downloading web content - to use in future 
            WebClient client = new WebClient();
            string s = client.DownloadString(url);


            // Calculating response
            TimeSpan ResponseTime = arrival - departure;

            Debug.Write(string.Format("{0} responded.", url));

            this.Website = HttpWReq.RequestUri.Authority;
            this.ResponseTime = ResponseTime;

        }



    }
}
