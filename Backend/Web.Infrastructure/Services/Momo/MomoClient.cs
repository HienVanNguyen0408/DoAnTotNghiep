using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Services;
using Web.Models.Entities.MOMO;
using Web.Models.Settings.Momo;

namespace Web.Infrastructure.Services.Momo
{
    public class MomoClient : IMomoClient
    {
        private readonly MomoSettings _momoSettings;
        public MomoClient()
        {
            _momoSettings = new MomoSettings();
        }
        public async Task<bool> PaymentMomoAsync(PaymentRequest request)
        {
            await Task.CompletedTask;
            var serectkey = _momoSettings.AccessKey;
            request = new PaymentRequest
            {
                PartnerCode = _momoSettings.PartnerCode,
                Amount = 100000,
                ExtraData = "",
                IpnUrl = "https://momo.vn",
                OrderId = $"{Guid.NewGuid()}",
                OrderInfo = "Thanhtoandonhang",
                RedirectUrl = "https://momo.vn",
                RequestId = $"{Guid.NewGuid()}",
                RequestType = $"captureWallet",
                Lang = "vi"
            };

            //UkiIyWSXrZRCjMqQDlve7QcysZdCdlUi
            //UkiIyWSXrZRCjMqQDlve7QcysZdCdlUi
            var rawHash = "accessKey=" + serectkey + "&amount=" + request.Amount + "&extraData=" + request.ExtraData + "&ipnUrl=" + request.IpnUrl + "&orderId=" + request.OrderId 
                + "&orderInfo=" + request.OrderInfo + "&partnerCode=" + request.PartnerCode + "&redirectUrl=" + request.RedirectUrl + "&requestId=" + request.RequestId + "&requestType=" + request.RequestType;

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.SignSHA256(rawHash, serectkey);
            JObject message = new JObject
            {
                { "partnerCode", request.PartnerCode },
                { "partnerName", "Test" },
                { "storeId", request.PartnerCode },
                { "requestType", request.RequestType },
                { "ipnUrl", request.OrderInfo },
                { "redirectUrl", request.RedirectUrl },
                { "amount", request.Amount },
                { "lang", request.Lang },
                { "autoCapture", false },
                { "requestId", request.RequestId },
                { "orderId", request.OrderId },
                { "extraData", request.ExtraData },
                { "signature", signature }
            };
            string responseFromMomo = SendPaymentRequest(_momoSettings.ApiEnpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            return false;
        }

        public string SendPaymentRequest(string endpoint, string postJsonString)
        {

            try
            {
                HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(endpoint);

                var postData = postJsonString;

                var data = Encoding.UTF8.GetBytes(postData);

                httpWReq.ProtocolVersion = HttpVersion.Version11;
                httpWReq.Method = "POST";
                httpWReq.ContentType = "application/json";

                httpWReq.ContentLength = data.Length;
                httpWReq.ReadWriteTimeout = 30000;
                httpWReq.Timeout = 15000;
                Stream stream = httpWReq.GetRequestStream();
                stream.Write(data, 0, data.Length);
                stream.Close();

                HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();

                string jsonresponse = "";

                using (var reader = new StreamReader(response.GetResponseStream()))
                {

                    string temp = null;
                    while ((temp = reader.ReadLine()) != null)
                    {
                        jsonresponse += temp;
                    }
                }
                //todo parse it
                return jsonresponse;
                //return new MomoResponse(mtid, jsonresponse);

            }
            catch (WebException e)
            {
                return e.Message;
            }
        }
    }
}
