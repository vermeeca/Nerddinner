<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Nerddinner.Models.Dinner>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <h2><%=Html.Encode(Model.Title) %></h2>


    
        <div id="dinnerDiv" style="float:left;width:400px;">
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
        
        <%
        Html.RenderPartial("RSVPStatus");
        Html.RenderPartial("EditAndDeleteLinks");
       %>
        
        </div>
        
    
    
    <div id="mapDiv" style="float:left">
        <%
            Html.RenderPartial("Map", Model); %>
        </div>
   

</asp:Content>

