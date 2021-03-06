﻿using System;
using System.Data;
using System.Configuration;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Nerddinner.Models
{
    public class DinnerRepository : IDinnerRepository
    {
        private NerdDinnerDataContext db = new NerdDinnerDataContext();

        public IQueryable<Dinner> FindAllDinners()
        {
            return db.Dinners;
        }

        public IQueryable<Dinner> FindUpcomingDinners()
        {
            return from dinner in db.Dinners
                   where dinner.EventDate > DateTime.Now
                   orderby dinner.EventDate
                   select dinner;

        }

        public Dinner GetDinner(int id)
        {
            return db.Dinners.SingleOrDefault(d => d.DinnerID == id);
        }

        public void Add(Dinner dinner)
        {
            db.Dinners.InsertOnSubmit(dinner);
        }

        public void Delete(Dinner dinner)
        {
            db.RSVPs.DeleteAllOnSubmit(dinner.RSVPs);
            db.Dinners.DeleteOnSubmit(dinner);
        }

        public void Save()
        {
            db.SubmitChanges();
        }

        public IQueryable<Dinner> FindByLocation(float latitude, float longitude)
        {
            var dinners = from dinner in FindUpcomingDinners()
                          join i in db.NearestDinners(latitude, longitude) on dinner.DinnerID equals i.DinnerID
                          select dinner;

            return dinners;
        }


    }
}
