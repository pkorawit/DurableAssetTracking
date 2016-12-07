using System;
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
            if (!IsPostBack) {
                ViewState.Clear();
                if (Request.QueryString["id"] != null)
                {
                    keyword = Request.QueryString["id"].ToString();
                    param = "id";
                    keyword = Server.UrlDecode(keyword);
                    Response.Redirect("Item?itemid=" + keyword);
                }

                if (Request.QueryString["keyword"] != null)
                {
                    keyword = Request.QueryString["keyword"].ToString();
                    param = "keyword";
                    
                    ShowSearchResult();
                    
                }
            }
        }

        private void ShowSearchResult()
        {
            DataTable dt;

            if (ViewState["result"] == null)
            {
                RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
                dt = client.QuickSearch(keyword);
                ViewState.Add("result", dt);
            }
            else
            {
                dt = (DataTable)ViewState["result"];
            }

            gvSearchResult.DataSource = dt;
            gvSearchResult.DataBind();
        }

        protected void gvSearchResult_PageIndexChanged(object sender, EventArgs e)
        {
             
        }

        protected void gvSearchResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSearchResult.PageIndex = e.NewPageIndex;
            ShowSearchResult();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            keyword = txtSearch.Value;
            param = "keyword";
            ViewState.Clear();
            ShowSearchResult();
        }
    }
}