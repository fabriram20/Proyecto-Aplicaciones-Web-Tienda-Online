using ProyectoWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWeb.Controllers
{
    public class PartialController : Controller
    {
        [HttpGet]
        public ActionResult CategoriaList()
        {
            ModelStoreV1Container CL = new ModelStoreV1Container();
            // Your user information in HeaderModel
            return PartialView("CategoriaList", CL.CategoriaSet.ToList());
        }
    }
}