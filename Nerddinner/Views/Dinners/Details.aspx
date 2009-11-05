<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Nerddinner.Models.Dinner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%=Html.Encode(Model.Title) %></h2>

    <fieldset>
        <legend>Fields</legend>
        <p>
            <b>When: </b>
            <%= Html.Encode(Model.EventDate.ToShortDateString()) %> @ 
            <%=Html.Encode(Model.EventDate.ToShortTimeString()) %>
        </p>
        <p>
            <b>Where: </b>
            <%= Html.Encode(Model.Address) %>
        </p>
        <p>
            <b>Description: </b>
            <%= Html.Encode(Model.Description) %>
        </p>
        <p>
            <b>Organizer: </b>
            <%= Html.Encode(Model.HostedBy) %>
        </p>
        
        <%if (Request.IsAuthenticated)
          {%>
        
        <%if (Model.IsUserRegistered(User.Identity.Name))
          { %>
        
        <p>You are registered for this event</p>
        
        <%}
          else
          { %>
        <p>You are not registered for this event</p>
        <%} %>
        <%} %>
        
    </fieldset>
    <p>

        <%if (Model.IsHostedBy(User.Identity.Name))
          { %>
        <%=Html.ActionLink("Edit", "Edit", new { id = Model.DinnerID })%> |
        <%=Html.ActionLink("Delete Dinner", "Delete", new { id = Model.DinnerID })%>
        <%} %>
    </p>

</asp:Content>

