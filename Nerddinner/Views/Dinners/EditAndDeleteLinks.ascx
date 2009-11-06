<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Nerddinner.Models.Dinner>" %>

 <p>

        <%if (Model.IsHostedBy(Context.User.Identity.Name))
          { %>
        <%=Html.ActionLink("Edit", "Edit", new { id = Model.DinnerID })%> |
        <%=Html.ActionLink("Delete Dinner", "Delete", new { id = Model.DinnerID })%>
        <%} %>
    </p>