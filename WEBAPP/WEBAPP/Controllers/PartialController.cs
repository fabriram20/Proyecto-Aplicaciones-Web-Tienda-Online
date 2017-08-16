using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBAPP;

namespace WEBAPP.Controllers
{
    public class PartialController : Controller
    {
        [HttpGet]
        public ActionResult CategoriaList()
        {
            ModelStoreContainer CL = new ModelStoreContainer();
            // Your user information in HeaderModel
            return PartialView("CategoriaList", CL.CategoriaSet.ToList());
        }
    }
}