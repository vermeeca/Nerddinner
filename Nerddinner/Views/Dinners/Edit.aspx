<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Nerddinner.ViewModels.DinnerFormViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Dinner</h2>

   <% Html.RenderPartial("DinnerForm"); %> 
    

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

