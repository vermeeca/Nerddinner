using System;
using System.Collections.Generic;
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
using NerdDinner.Models;

namespace Nerddinner.Helpers
{
    public static class ControllerHelpers
    {
        public static void AddRuleViolations(this ModelStateDictionary state, IEnumerable<RuleViolation> issues)
        {
            issues.ForEach(r => state.AddModelError(r.PropertyName, r.ErrorMessage));
        }

        public static void ForEach<T>(this IEnumerable<T> items, Action<T> action)
        {
            foreach(var item in items)
            {
                action(item);
            }
        }
    }
}
