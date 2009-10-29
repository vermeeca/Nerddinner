using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Nerddinner.Models;

namespace Nerddinner.Controllers
{
    public class DinnersController : Controller
    {
        private DinnerRepository dinnerRepository = new DinnerRepository();


        //
        // GET: /Dinners/

        public ActionResult Index()
        {
            return View("Index", dinnerRepository.FindUpcomingDinners().ToList());
        }

        public ActionResult Details(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);
            return dinner == null ? View("NotFound") : View("Details", dinner);
        }


    }
}