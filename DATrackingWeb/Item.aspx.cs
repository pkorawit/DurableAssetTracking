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
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["itemid"]))
                {
                    itemID = Request.QueryString["itemid"].ToString();                                       
                    ShowItemDetail(itemID);
                }
            }
        }

        private void ShowItemDetail(string itemID)
        {
            lbItemIDHead.Text = itemID;
            ItemDetail dataSource;
            if (ViewState["ItemDetail"] == null)
            {
                RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
                dataSource = client.GetItemDetail(itemID);
                ViewState.Add("ItemDetail", dataSource);
            }
            else
            {
                dataSource = (ItemDetail)ViewState["ItemDetail"];
            }
            List<ItemDetail> items = new List<ItemDetail>();
            items.Add(dataSource);
            dvItemDetail.DataSource = items;
            dvItemDetail.DataBind();
        }

        protected void dvItemDetail_ModeChanged(object sender, EventArgs e)
        {
           
        }

        protected void dvItemDetail_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            dvItemDetail.ChangeMode(e.NewMode);
            ShowItemDetail(lbItemIDHead.Text);
        }

        protected void dvItemDetail_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            ItemDetail updatedItem = new ItemDetail();
            updatedItem.ItemID = e.NewValues["ItemID"].ToString();
            updatedItem.Desciption = e.NewValues["Desciption"].ToString();
            updatedItem.AdditionalDetail = e.NewValues["AdditionalDetail"].ToString();            
            updatedItem.BudgetSource = e.NewValues["BudgetSource"].ToString();
            updatedItem.FiscalYear = e.NewValues["FiscalYear"].ToString();
            updatedItem.Group1 = e.NewValues["Group1"].ToString();
            updatedItem.DAType1 = e.NewValues["DAType1"].ToString();
            updatedItem.DAType2 = e.NewValues["DAType2"].ToString();
            updatedItem.SupplierName = e.NewValues["SupplierName"].ToString();
            updatedItem.WarrantyYear = e.NewValues["WarrantyYear"].ToString();

            double price;
            if (Double.TryParse(e.NewValues["Price"].ToString(), out price))
                updatedItem.Price = price;

            DateTime checkinDate;
            if (DateTime.TryParse(e.NewValues["CheckInDate"].ToString(), out checkinDate))
                updatedItem.CheckInDate = checkinDate;

            DateTime warrantyExpiredDate;
            if (DateTime.TryParse(e.NewValues["WarrantyExpiredDate"].ToString(), out warrantyExpiredDate))
                updatedItem.WarrantyExpiredDate = warrantyExpiredDate;
            

            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            bool result = client.UpdateItemDetail(updatedItem);

            if(result == true)
            {
                ViewState.Remove("ItemDetail");
                dvItemDetail.ChangeMode(DetailsViewMode.ReadOnly);
                ShowItemDetail(lbItemIDHead.Text);
            }
            
        }

        protected void dvItemDetail_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            
        }
    }
}