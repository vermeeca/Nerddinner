<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Nerddinner.ViewModels.DinnerFormViewModel>" %>

 <%= Html.ValidationSummary("Please correct the errors and try again.") %>

<script src="../../Scripts/jquery-1.3.2.js" type="text/javascript"></script>

<% using (Html.BeginForm()) {%>

        <fieldset>
            <div id="dinnerDiv">
            <legend>Fields</legend>
            <p>
                <label for="Title">Title:</label>
                <%= Html.TextBox("Title", Model.Dinner.Title, new { size = 30, @class = "myclass" })%>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            <p>
                <label for="EventDate">EventDate:</label>
                <%= Html.TextBox("EventDate", String.Format("{0:g}", Model.Dinner.EventDate)) %>
                <%= Html.ValidationMessage("EventDate", "*") %>
            </p>
            <p>
                <label for="Description">Description:</label>
                <%= Html.TextBox("Description", Model.Dinner.Description)%>
                <%= Html.ValidationMessage("Description", "*") %>
            </p>
            <p>
                <label for="Address">Address:</label>
                <%= Html.TextBox("Address", Model.Dinner.Address)%>
                <%= Html.ValidationMessage("Address", "*") %>
            </p>
            <p>
                <label for="Country">Country:</label>
                <%= Html.DropDownList("Country", Model.Countries) %>
                <%= Html.ValidationMessage("Country", "*") %>
            </p>
            <p>
                <label for="ContactPhone">ContactPhone:</label>
                <%= Html.TextBox("ContactPhone", Model.Dinner.ContactPhone)%>
                <%= Html.ValidationMessage("ContactPhone", "*") %>
            </p>
            <p>
                <label for="Latitude">Latitude:</label>
                <%= Html.TextBox("Latitude", String.Format("{0:F}", Model.Dinner.Latitude))%>
                <%= Html.ValidationMessage("Latitude", "*") %>
            </p>
            <p>
                <label for="Longitude">Longitude:</label>
                <%= Html.TextBox("Longitude", String.Format("{0:F}", Model.Dinner.Longitude))%>
                <%= Html.ValidationMessage("Longitude", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
            </div>
            
            <div id="mapDiv">
            <%
    Html.RenderPartial("Map", Model.Dinner); %>
            </div>
            
            <script type="text/javascript">
            $(document).ready(function()
            {
                $("#Address").blur(function(evt)
                {
                    $("#Latitude").val("");
                    $("#Longitude").val("");
                    
                    var address = jQuery.trim($("#Address").val());
                    if(address.length < 1)
                        return;
                    
                    FindAddressOnMap(address);
                });
            
            });
            </script>
            
        </fieldset>

    <% } %>

