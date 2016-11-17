using DATrackingWeb.Models;
using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DATrackingWeb.RestClient
{
    public class DATrackingAPI
    {
        string BaseUrl = WebConfigurationManager.AppSettings["apiEndPoint"];

        public DATrackingAPI()
        {
            
        }

        public T Execute<T>(RestRequest request) where T : new()
        {
            var client = new RestSharp.RestClient();
            client.BaseUrl = new Uri(BaseUrl);            
            var response = client.Execute<T>(request);
            return JsonConvert.DeserializeObject<T>(response.Content);
        }

        public DataTable QuickSearch(string keyword)
        {
            var request = new RestRequest();
            request.Resource = "search/quick";
            request.AddParameter("keyword", keyword, ParameterType.QueryString);

            return Execute<DataTable>(request);
        }

        public ItemDetail GetItemDetail(string itemID)
        {
            var request = new RestRequest();
            request.Resource = "itemdetails";
            request.AddParameter("id", itemID, ParameterType.QueryString);

            return Execute<ItemDetail>(request);
        }

    }
}