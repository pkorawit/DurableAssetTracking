﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DATrackingWeb
{
    public partial class Search : System.Web.UI.Page
    {
        string keyword = "";
        string param = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) 
            {
                keyword = Request.Form["search_keyword"].ToString();
                param = Request.Form["search_param"].ToString();
                SearchDAItems(keyword);                
            }
            else
            {
                if (Request.QueryString["id"] != null)
                {
                    keyword = Request.QueryString["id"].ToString();
                    param = "id";
                    keyword = Server.UrlDecode(keyword);
                    Response.Redirect("Item?itemid=" + keyword);               
                    //SearchDAItems(keyword);
                }

                if (Request.QueryString["keyword"] != null)
                {
                    keyword = Request.QueryString["keyword"].ToString();
                    param = "keyword";
                    SearchDAItems(keyword);
                }
            }
        }

        protected void SearchDAItems(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
            {
                RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
                DataTable dt = client.QuickSearch(keyword);              
                gvSearchResult.DataSource = dt;
                gvSearchResult.DataBind();               
            }
        }
    }
}