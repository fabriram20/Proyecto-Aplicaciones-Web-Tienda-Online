using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoWeb.Models;

namespace ProyectoWeb.Controllers
{
    public class CarritoController : Controller
    {
        private ModelStoreV1Container db = new ModelStoreV1Container();

        // GET: Carrito
        public ActionResult Index()
        {
            return View(db.CarritoSet.ToList());
        }

        // GET: Carrito/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carrito carrito = db.CarritoSet.Find(id);
            if (carrito == null)
            {
                return HttpNotFound();
            }
            return View(carrito);
        }

        // GET: Carrito/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Carrito/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdCarrito")] Carrito carrito)
        {
            if (ModelState.IsValid)
            {
                db.CarritoSet.Add(carrito);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(carrito);
        }

        // GET: Carrito/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carrito carrito = db.CarritoSet.Find(id);
            if (carrito == null)
            {
                return HttpNotFound();
            }
            return View(carrito);
        }

        // POST: Carrito/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdCarrito")] Carrito carrito)
        {
            if (ModelState.IsValid)
            {
                db.Entry(carrito).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(carrito);
        }

        // GET: Carrito/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Carrito carrito = db.CarritoSet.Find(id);
            if (carrito == null)
            {
                return HttpNotFound();
            }
            return View(carrito);
        }

        // POST: Carrito/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Carrito carrito = db.CarritoSet.Find(id);
            db.CarritoSet.Remove(carrito);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
