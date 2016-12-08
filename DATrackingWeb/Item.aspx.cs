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

        protected void dvItemDetail_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            dvItemDetail.ChangeMode(e.NewMode);
            ShowItemDetail(lbItemIDHead.Text);
            panelSuccess.Visible = false;
        }

        protected void dvItemDetail_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            ItemDetail updatedItem = new ItemDetail();

            if(e.NewValues["ItemID"] != null)
                updatedItem.ItemID = e.NewValues["ItemID"].ToString();

            if (e.NewValues["Desciption"] != null)
                updatedItem.Desciption = e.NewValues["Desciption"].ToString();

            if (e.NewValues["AdditionalDetail"] != null)
                updatedItem.AdditionalDetail = e.NewValues["AdditionalDetail"].ToString();

            if (e.NewValues["BudgetSource"] != null)
                updatedItem.BudgetSource = e.NewValues["BudgetSource"].ToString();

            if (e.NewValues["FiscalYear"] != null)
                updatedItem.FiscalYear = e.NewValues["FiscalYear"].ToString();

            if (e.NewValues["Group1"] != null)
                updatedItem.Group1 = e.NewValues["Group1"].ToString();

            if (e.NewValues["DAType1"] != null)
                updatedItem.DAType1 = e.NewValues["DAType1"].ToString();

            if (e.NewValues["DAType2"] != null)
                updatedItem.DAType2 = e.NewValues["DAType2"].ToString();

            if (e.NewValues["SupplierName"] != null)
                updatedItem.SupplierName = e.NewValues["SupplierName"].ToString();

            if (e.NewValues["WarrantyYear"] != null)
                updatedItem.WarrantyYear = e.NewValues["WarrantyYear"].ToString();

            if(e.NewValues["Price"] != null) { 
                double price;
                if (Double.TryParse(e.NewValues["Price"].ToString(), out price))
                    updatedItem.Price = price;
            }

            if (e.NewValues["CheckInDate"] != null)
            {
                DateTime checkinDate;
                if (DateTime.TryParse(e.NewValues["CheckInDate"].ToString(), out checkinDate))
                    updatedItem.CheckInDate = checkinDate;
            }

            if (e.NewValues["WarrantyExpiredDate"] != null)
            {
                DateTime warrantyExpiredDate;
                if (DateTime.TryParse(e.NewValues["WarrantyExpiredDate"].ToString(), out warrantyExpiredDate))
                    updatedItem.WarrantyExpiredDate = warrantyExpiredDate;
            }

            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            bool result = client.UpdateItemDetail(updatedItem);

            if(result == true)
            {
                ViewState.Remove("ItemDetail");
                dvItemDetail.ChangeMode(DetailsViewMode.ReadOnly);
                ShowItemDetail(lbItemIDHead.Text);
                panelSuccess.Visible = true;
            }
            
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            ItemDetail result = client.DeleteItemDetail(lbItemIDHead.Text);
            if (result != null)
            {
                panelEdit.Visible = false;
                panelDeleted.Visible = true;
            }
        }
    }
}