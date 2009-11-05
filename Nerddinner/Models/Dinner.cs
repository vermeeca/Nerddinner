using System;
using System.Collections.Generic;
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
using NerdDinner.Helpers;
using NerdDinner.Models;

namespace Nerddinner.Models
{
    public partial class Dinner
    {
        public bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }

        public bool IsUserRegistered(string name)
        {
            return RSVPs.Any(r => string.Compare(r.AttendeeName, name, true) == 0);
        }

        public IEnumerable<RuleViolation> GetRuleViolations()
        {

            if (String.IsNullOrEmpty(Title))
                yield return new RuleViolation("Title is required", "Title");

            if (String.IsNullOrEmpty(Description))
                yield return new RuleViolation("Description is required", "Description");

            if (String.IsNullOrEmpty(HostedBy))
                yield return new RuleViolation("HostedBy is required", "HostedBy");

            if (String.IsNullOrEmpty(Address))
                yield return new RuleViolation("Address is required", "Address");

            if (String.IsNullOrEmpty(Country))
                yield return new RuleViolation("Country is required", "Address");

            if (String.IsNullOrEmpty(ContactPhone))
                yield return new RuleViolation("Phone# is required", "ContactPhone");

            if (!PhoneValidator.IsValidNumber(ContactPhone, Country))
                yield return new RuleViolation("Phone# does not match country", "ContactPhone");

            yield break;
        }

        partial void OnValidate(ChangeAction action)
        {
            if (!IsValid)
                throw new ApplicationException("Rule violations prevent saving");
        }

        public bool IsHostedBy(string name)
        {
            return string.Compare(name, this.HostedBy, true) == 0;
        }
    }
}
