using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Nerddinner.Helpers;
using NerdDinner.Helpers;
using Nerddinner.Models;
using Nerddinner.ViewModels;

namespace Nerddinner.Controllers
{
    public class DinnersController : Controller
    {
        private DinnerRepository dinnerRepository = new DinnerRepository();


        //
        // GET: /Dinners/

        public ActionResult Index(int? page)
        {
            const int pageSize = 10;

            var upcoming = dinnerRepository.FindUpcomingDinners();
            var paginated = new PaginatedList<Dinner>(upcoming, (page ?? 0), pageSize);
            return View(paginated);
        }

        public ActionResult Details(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);
            return dinner == null ? View("NotFound") : View(dinner);
        }

        public ActionResult Edit(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);
            return View(new DinnerFormViewModel(dinner));
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection formValues)
        {
            var dinner = dinnerRepository.GetDinner(id);
            
            UpdateModel(dinner);

            if (!dinner.IsValid)
            {
                ModelState.AddRuleViolations(dinner.GetRuleViolations());
                return View(new DinnerFormViewModel(dinner));
            }
            else
            {  
                dinnerRepository.Save();
                return RedirectToAction("Details", new {id = dinner.DinnerID});
            }

        }

        public ActionResult Create()
        {
            Dinner dinner = new Dinner
                                {
                                    EventDate = DateTime.Now.AddDays(7)
                                };
            return View(new DinnerFormViewModel(dinner));

        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Dinner dinner)
        {
            dinner.HostedBy = "Craig";
            if(dinner.IsValid)
            {
                dinnerRepository.Add(dinner);
                dinnerRepository.Save();
                return RedirectToAction("Details", new {id = dinner.DinnerID});
            }
            else
            {
                ModelState.AddRuleViolations(dinner.GetRuleViolations());
                return View(dinner);
            }
        }

        public ActionResult Delete(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);
            return dinner == null ? View("NotFound") : View(dinner);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Delete(int id, string confirmButton)
        {
            var dinner = dinnerRepository.GetDinner(id);
            if(dinner == null)
            {
                return View("NotFound");
            }

            dinnerRepository.Delete(dinner);
            dinnerRepository.Save();

            return View("Deleted");
        }


    }
}
