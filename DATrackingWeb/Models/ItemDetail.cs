using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DATrackingWeb.Models
{
    [Serializable]
    public class ItemDetail
    {

        public string ItemID { get; set; }
        public string Desciption { get; set; }
        public string AdditionalDetail { get; set; }
        public Nullable<double> Price { get; set; }
        public string BudgetSource { get; set; }
        public string FiscalYear { get; set; }
        public string Group1 { get; set; }
        public string DAType1 { get; set; }
        public string DAType2 { get; set; }
        public string SupplierName { get; set; }
        public Nullable<System.DateTime> CheckInDate { get; set; }
        public string WarrantyYear { get; set; }
        public Nullable<System.DateTime> WarrantyExpiredDate { get; set; }
        public string ImagePath { get; set; }
        public string ImportSource { get; set; }
    }
}