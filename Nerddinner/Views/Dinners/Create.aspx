<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Nerddinner.ViewModels.DinnerFormViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Title">Title:</label>
                <%= Html.TextBox("Dinner.Title") %>
                <%= Html.ValidationMessage("Dinner.Title", "*")%>
            </p>
            <p>
                <label for="EventDate">EventDate:</label>
                <%= Html.TextBox("Dinner.EventDate") %>
                <%= Html.ValidationMessage("Dinner.EventDate", "*") %>
            </p>
            <p>
                <label for="Description">Description:</label>
                <%= Html.TextBox("Dinner.Description")%>
                <%= Html.ValidationMessage("Dinner.Description", "*")%>
            </p>
            <p>
                <label for="Address">Address:</label>
                <%= Html.TextBox("Dinner.Address")%>
                <%= Html.ValidationMessage("Dinner.Address", "*")%>
            </p>
            <p>
                <label for="Country">Country:</label>
                <%= Html.DropDownList("Dinner.Country", Model.Countries)%>
                <%= Html.ValidationMessage("Dinner.Country", "*")%>
            </p>
            <p>
                <label for="ContactPhone">ContactPhone:</label>
                <%= Html.TextBox("Dinner.ContactPhone") %>
                <%= Html.ValidationMessage("Dinner.ContactPhone", "*") %>
            </p>
            <p>
                <label for="Latitude">Latitude:</label>
                <%= Html.TextBox("Dinner.Latitude")%>
                <%= Html.ValidationMessage("Dinner.Latitude", "*")%>
            </p>
            <p>
                <label for="Longitude">Longitude:</label>
                <%= Html.TextBox("Dinner.Longitude")%>
                <%= Html.ValidationMessage("Dinner.Longitude", "*")%>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

