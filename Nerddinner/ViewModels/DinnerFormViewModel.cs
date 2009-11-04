using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using NerdDinner.Helpers;
using Nerddinner.Models;

namespace Nerddinner.ViewModels
{
    public class DinnerFormViewModel
    {
        public Dinner Dinner { get; private set; }
        public SelectList Countries { get; private set; }

        public DinnerFormViewModel(Dinner dinner)
        {
            Dinner = dinner;
            Countries = new SelectList(PhoneValidator.Countries, dinner.Country);
        }
    }
}
