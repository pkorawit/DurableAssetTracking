using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using DATrackingAPI;

namespace DATrackingAPI.Controllers
{
    public class ItemDetailsController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/ItemDetails
        public IQueryable<ItemDetail> GetItemDetails()
        {
            return db.ItemDetails;
        }

        // GET: api/ItemDetails/5
        public IHttpActionResult GetItemDetail(string id)
        {
            ItemDetail itemDetail = db.ItemDetails.Find(id);
            if (itemDetail == null)
            {
                return NotFound();
            }

            return Ok(itemDetail);
        }

        // PUT: api/ItemDetails/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutItemDetail(string id, ItemDetail itemDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != itemDetail.ItemID)
            {
                return BadRequest();
            }

            db.Entry(itemDetail).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemDetailExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ItemDetails
        [ResponseType(typeof(ItemDetail))]
        public IHttpActionResult PostItemDetail(ItemDetail itemDetail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ItemDetails.Add(itemDetail);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ItemDetailExists(itemDetail.ItemID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = itemDetail.ItemID }, itemDetail);
        }

        // DELETE: api/ItemDetails/5
        [ResponseType(typeof(ItemDetail))]
        public IHttpActionResult DeleteItemDetail(string id)
        {
            ItemDetail itemDetail = db.ItemDetails.Find(id);
            if (itemDetail == null)
            {
                return NotFound();
            }

            db.ItemDetails.Remove(itemDetail);
            db.SaveChanges();

            return Ok(itemDetail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemDetailExists(string id)
        {
            return db.ItemDetails.Count(e => e.ItemID == id) > 0;
        }

    }
}