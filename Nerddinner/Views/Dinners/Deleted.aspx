<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Dinner Deleted
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
    <p>Your dinner was successfully deleted</p>
    </div>
    <div>
    <p><%=Html.ActionLink("Click here for upcoming dinners", "Index") %></p>
    </div>

</asp:Content>
