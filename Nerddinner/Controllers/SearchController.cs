using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Nerddinner.Models;

namespace Nerddinner.Controllers
{
    public class SearchController : Controller
    {
        private IDinnerRepository dinnerRepository = null;

        public SearchController() : this(new DinnerRepository())
        {
        }

        public SearchController(IDinnerRepository repo)
        {
            dinnerRepository = repo;
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SearchByLocation(float latitude, float longitude)
        {
            var dinners = dinnerRepository.FindByLocation(latitude, longitude);

            var jsonDinners = from dinner in dinners
                              select new JsonDinner
                                         {
                                             DinnerID = dinner.DinnerID,
                                             Latitude=dinner.Latitude,
                                             Longitude=dinner.Longitude,
                                             Title=dinner.Title,
                                             Description=dinner.Description,
                                             RSVPCount=dinner.RSVPs.Count
                                         };

            return Json(jsonDinners);
        }

    }
}
