<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Nerddinner.Models.Dinner>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <h2>Upcoming Dinners</h2>
    <ul>

    <% foreach (var dinner in Model) { %>
    
    <li>
        <%=Html.ActionLink(dinner.Title, "Details", new { id=dinner.DinnerID })%>
        on
        <%=Html.Encode(dinner.EventDate.ToShortDateString()) %>
        @
        <%=Html.Encode(dinner.EventDate.ToLongDateString()) %>
    </li>
       
    
    <% } %>
    
    </ul>

</asp:Content>

