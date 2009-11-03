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
            return View(dinnerRepository.FindUpcomingDinners());
        }

        public ActionResult Details(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);
            return dinner == null ? View("NotFound") : View(dinner);
        }

        public ActionResult Edit(int id)
        {
            return View(dinnerRepository.GetDinner(id));
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection formValues)
        {
            var dinner = dinnerRepository.GetDinner(id);
            UpdateModel(dinner);

            if (!dinner.IsValid)
            {
                dinner.GetRuleViolations().ToList().ForEach(
                    v => ModelState.AddModelError(v.PropertyName, v.ErrorMessage));
                return View(dinner);
            }
            else
            {
                dinnerRepository.Save();
                return RedirectToAction("Details", new {id = dinner.DinnerID});
            }

        }


    }
}
