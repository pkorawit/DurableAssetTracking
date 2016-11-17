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
    public class ItemTrackingsController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/ItemTrackings
        public IQueryable<ItemTracking> GetItemTrackings()
        {
            return db.ItemTrackings;
        }

        // GET: api/ItemTrackings
        public IQueryable<ItemTracking> GetItemTrackings(string id)
        {
            return (IQueryable<ItemTracking>)db.ItemTrackings.Where(i => i.ItemID == id);
        }

        // GET: api/ItemTrackings/5
        [ResponseType(typeof(ItemTracking))]
        public IHttpActionResult GetItemTracking(string id, string year)
        {
            ItemTracking itemTracking = db.ItemTrackings.Find(id, year);
            if (itemTracking == null)
            {
                return NotFound();
            }

            return Ok(itemTracking);
        }

        // PUT: api/ItemTrackings/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutItemTracking(string id, ItemTracking itemTracking)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != itemTracking.ItemID)
            {
                return BadRequest();
            }

            db.Entry(itemTracking).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemTrackingExists(id))
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

        // POST: api/ItemTrackings
        [ResponseType(typeof(ItemTracking))]
        public IHttpActionResult PostItemTracking(ItemTracking itemTracking)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ItemTrackings.Add(itemTracking);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ItemTrackingExists(itemTracking.ItemID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = itemTracking.ItemID }, itemTracking);
        }

        // DELETE: api/ItemTrackings/5
        [ResponseType(typeof(ItemTracking))]
        public IHttpActionResult DeleteItemTracking(string id)
        {
            ItemTracking itemTracking = db.ItemTrackings.Find(id);
            if (itemTracking == null)
            {
                return NotFound();
            }

            db.ItemTrackings.Remove(itemTracking);
            db.SaveChanges();

            return Ok(itemTracking);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ItemTrackingExists(string id)
        {
            return db.ItemTrackings.Count(e => e.ItemID == id) > 0;
        }
    }
}