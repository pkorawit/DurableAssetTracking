using DATrackingWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DATrackingWeb
{
    public partial class AddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvItemDetail_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            ItemDetail updatedItem = new ItemDetail();
            
            if (e.Values["ItemID"] != null)
                updatedItem.ItemID = e.Values["ItemID"].ToString();

            if (e.Values["Desciption"] != null)
                updatedItem.Desciption = e.Values["Desciption"].ToString();

            if (e.Values["AdditionalDetail"] != null)
                updatedItem.AdditionalDetail = e.Values["AdditionalDetail"].ToString();

            if (e.Values["BudgetSource"] != null)
                updatedItem.BudgetSource = e.Values["BudgetSource"].ToString();

            if (e.Values["FiscalYear"] != null)
                updatedItem.FiscalYear = e.Values["FiscalYear"].ToString();

            if (e.Values["Group1"] != null)
                updatedItem.Group1 = e.Values["Group1"].ToString();

            if (e.Values["DAType1"] != null)
                updatedItem.DAType1 = e.Values["DAType1"].ToString();

            if (e.Values["DAType2"] != null)
                updatedItem.DAType2 = e.Values["DAType2"].ToString();

            if (e.Values["SupplierName"] != null)
                updatedItem.SupplierName = e.Values["SupplierName"].ToString();

            if (e.Values["WarrantyYear"] != null)
                updatedItem.WarrantyYear = e.Values["WarrantyYear"].ToString();

            if (e.Values["Price"] != null)
            {
                double price;
                if (Double.TryParse(e.Values["Price"].ToString(), out price))
                    updatedItem.Price = price;
            }

            if (e.Values["CheckInDate"] != null)
            {
                DateTime checkinDate;
                if (DateTime.TryParse(e.Values["CheckInDate"].ToString(), out checkinDate))
                    updatedItem.CheckInDate = checkinDate;
            }

            if (e.Values["WarrantyExpiredDate"] != null)
            {
                DateTime warrantyExpiredDate;
                if (DateTime.TryParse(e.Values["WarrantyExpiredDate"].ToString(), out warrantyExpiredDate))
                    updatedItem.WarrantyExpiredDate = warrantyExpiredDate;
            }

            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            ItemDetail result = client.InsertItemDetail(updatedItem);

            if (!string.IsNullOrEmpty(result.ItemID))
            {
                linkNewItemID.HRef += result.ItemID;
                linkNewItemID.InnerText = result.ItemID;
                panelInsert.Visible = false;
                panelSuccess.Visible = true;
                txtItemID.Value = "";
            }
        }

        protected void btnItemidCheck_ServerClick(object sender, EventArgs e)
        {
            RestClient.DATrackingAPI client = new RestClient.DATrackingAPI();
            ItemDetail result = client.GetItemDetail(txtItemID.Value);
            if(result != null)
            {
                panelInsert.Visible = false;
                alertDupplicated.Visible = true;
                linkDuplicated.HRef += result.ItemID;
                linkDuplicated.InnerText = result.ItemID;
            }
            else
            {
                alertDupplicated.Visible = false;
                panelInsert.Visible = true;                
                TextBox txt = (TextBox)dvItemDetail.FindControl("txtNewItemID");
                if (txt != null)
                {
                    txt.Text = txtItemID.Value;
                }
            }
        }
    }
}