using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;
using System.Web.Http.Description;

namespace DATrackingAPI.Controllers
{
    public class SearchController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/Search/Quick/keyword=?
        [Route("api/search/quick/")]
        public DataTable GetItemTrackingByIdOrDesc(string keyword)
        {
            var output = db.ItemDetails.Where(i => i.ItemID.Contains(keyword) || i.Desciption.Contains(keyword));
            DataTable dt = LINQToDataTable<ItemDetail>(output.AsEnumerable<ItemDetail>());
            dt.TableName = "ItemDetail";
            return dt;
        }

        // GET: api/Search/Id/keyword=?
        [Route("api/search/id/")]
        public IQueryable<ItemDetail> GetItemTrackingById(string keyword)
        {
            return db.ItemDetails.Where(i => i.ItemID.Contains(keyword));
        }

        // GET: api/Search/Description/keyword=?
        [Route("api/search/desc/")]
        public IQueryable<ItemDetail> GetItemTrackingByDescriptions(string keyword)
        {
            return db.ItemDetails.Where(i => i.Desciption.Contains(keyword));
        }

        public DataTable LINQToDataTable<T>(IEnumerable<T> varlist)
        {
            DataTable dtReturn = new DataTable();

            // column names
            PropertyInfo[] oProps = null;

            if (varlist == null) return dtReturn;

            foreach (T rec in varlist)
            {
                // Use reflection to get property names, to create table, Only first time, others will follow
                if (oProps == null)
                {
                    oProps = ((Type)rec.GetType()).GetProperties();
                    foreach (PropertyInfo pi in oProps)
                    {
                        Type colType = pi.PropertyType;

                        if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition() == typeof(Nullable<>)))
                        {
                            colType = colType.GetGenericArguments()[0];
                        }

                        dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                    }
                }
                DataRow dr = dtReturn.NewRow();

                foreach (PropertyInfo pi in oProps)
                {
                    dr[pi.Name] = pi.GetValue(rec, null) == null ? DBNull.Value : pi.GetValue(rec, null);
                }

                dtReturn.Rows.Add(dr);
            }
            return dtReturn;
        }

    }
}
