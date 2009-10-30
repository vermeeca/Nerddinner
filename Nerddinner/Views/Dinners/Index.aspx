<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Nerddinner.Models.Dinner>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                DinnerID
            </th>
            <th>
                Title
            </th>
            <th>
                EventDate
            </th>
            <th>
                Description
            </th>
            <th>
                HostedBy
            </th>
            <th>
                ContactPhone
            </th>
            <th>
                Address
            </th>
            <th>
                Country
            </th>
            <th>
                Latitude
            </th>
            <th>
                Longitude
            </th>
            <th>
                IsValid
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id=item.DinnerID }) %> |
                <%= Html.ActionLink("Details", "Details", new { id=item.DinnerID })%>
            </td>
            <td>
                <%= Html.Encode(item.DinnerID) %>
            </td>
            <td>
                <%= Html.Encode(item.Title) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.EventDate)) %>
            </td>
            <td>
                <%= Html.Encode(item.Description) %>
            </td>
            <td>
                <%= Html.Encode(item.HostedBy) %>
            </td>
            <td>
                <%= Html.Encode(item.ContactPhone) %>
            </td>
            <td>
                <%= Html.Encode(item.Address) %>
            </td>
            <td>
                <%= Html.Encode(item.Country) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Latitude)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Longitude)) %>
            </td>
            <td>
                <%= Html.Encode(item.IsValid) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

