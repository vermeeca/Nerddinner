<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Nerddinner.Models.Dinner>" %>

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
                <%= Html.TextBox("Title") %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="EventDate">EventDate:</label>
                <%= Html.TextBox("EventDate") %>
                <%= Html.ValidationMessage("EventDate", "*") %>
            </p>
            <p>
                <label for="Description">Description:</label>
                <%= Html.TextBox("Description") %>
                <%= Html.ValidationMessage("Description", "*") %>
            </p>
            <p>
                <label for="Address">Address:</label>
                <%= Html.TextBox("Address") %>
                <%= Html.ValidationMessage("Address", "*") %>
            </p>
            <p>
                <label for="Country">Country:</label>
                <%= Html.TextBox("Country") %>
                <%= Html.ValidationMessage("Country", "*") %>
            </p>
            <p>
                <label for="ContactPhone">ContactPhone:</label>
                <%= Html.TextBox("ContactPhone") %>
                <%= Html.ValidationMessage("ContactPhone", "*") %>
            </p>
            <p>
                <label for="Latitude">Latitude:</label>
                <%= Html.TextBox("Latitude") %>
                <%= Html.ValidationMessage("Latitude", "*") %>
            </p>
            <p>
                <label for="Longitude">Longitude:</label>
                <%= Html.TextBox("Longitude") %>
                <%= Html.ValidationMessage("Longitude", "*") %>
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

