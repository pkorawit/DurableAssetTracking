using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DATrackingWeb.Models;

namespace DATrackingWeb
{
    public partial class Item : System.Web.UI.Page
    {
        string itemID;

        protected void Page_Load(object sender, EventArgs e)
        {                        
            if (!string.IsNullOrEmpty(Request.QueryString["itemid"]))
            {
                itemID = Request.QueryString["itemid"].ToString();
                DataBind(itemID);
            }
        }

        private void DataBind(string itemID)
        {
            lbItemIDHead.Text = itemID;

            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            ItemDetail item = client.GetItemDetail(itemID);
            List<ItemDetail> items = new List<ItemDetail>();
            items.Add(item);
            dvItemDetail.DataSource = items;
            dvItemDetail.DataBind();
        }

        protected void dvItemDetail_ModeChanged(object sender, EventArgs e)
        {
           
        }

        protected void dvItemDetail_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            dvItemDetail.ChangeMode(e.NewMode);
            DataBind();
        }
    }
}