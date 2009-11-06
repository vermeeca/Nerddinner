using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Nerddinner.Models;

namespace Nerddinner.Controllers
{
    public class RSVPController : Controller
    {
        private DinnerRepository dinnerRepository = new DinnerRepository();

        //
        // GET: /RSVP/

        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(int id)
        {
            var dinner = dinnerRepository.GetDinner(id);

            if(!dinner.IsUserRegistered(User.Identity.Name))
            {
                RSVP rsvp = new RSVP();
                rsvp.AttendeeName = User.Identity.Name;

                dinner.RSVPs.Add(rsvp);
                dinnerRepository.Save();
             
            }

            return Content("Thanks - we'll see you there!");
        }

    }
}
