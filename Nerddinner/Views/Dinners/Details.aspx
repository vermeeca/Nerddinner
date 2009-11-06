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
        
    </fieldset>
    <%
        Html.RenderPartial("RSVPStatus");
        Html.RenderPartial("EditAndDeleteLinks");
        %>
   

</asp:Content>

