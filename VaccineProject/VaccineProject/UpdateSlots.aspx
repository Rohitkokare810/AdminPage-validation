<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateSlots.aspx.cs" Inherits="VaccineProject.UpdateSlots" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style3 {
        width: 234px;
    }
    .auto-style4 {
        width: 195px;
    }
    .auto-style5 {
        width: 201px;
    }
    .auto-style6 {
        width: 251px;
    }
        .auto-style7 {
            width: 355px;
        }
        .auto-style8 {
            width: 234px;
            text-align: right;
        }
        .auto-style9 {
            width: 251px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="page-header" colspan="6">Update Slots Details</td>
    </tr>
    <tr>
        <td class="auto-style8">Choose Date Time</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtDate" runat="server" TextMode="DateTime" ValidationGroup="g12" placeholder="YYYY-MM-DD HH:MM:SS" Width="197px"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDate" ErrorMessage="*" ForeColor="Red" ValidationGroup="g12"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style9">Choose DateId to Delete</td>
        <td class="auto-style7">
            <asp:DropDownList ID="DDLDat" runat="server" DataSourceID="SqlDataSource1" DataTextField="DatetimeID" DataValueField="DatetimeID" ValidationGroup="g13">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VaccineManagementDbConnectionString10 %>" ProviderName="<%$ ConnectionStrings:VaccineManagementDbConnectionString10.ProviderName %>" SelectCommand="SELECT [DatetimeID] FROM [DateTimeSlots]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDLDat" ErrorMessage="*" ForeColor="Red" ValidationGroup="g13"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">
            <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add" ValidationGroup="g12" CssClass="button add-button"/>
        </td>
        <td class="auto-style5">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtDate" ErrorMessage="Please enter proper date and time" ValidationExpression="^(202[2-4])-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$" ForeColor="Red" ValidationGroup="g12"></asp:RegularExpressionValidator>
        </td>
        <td class="auto-style9">
            <asp:Label ID="LblMsg1" runat="server"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Button ID="BtnDel" runat="server" OnClick="BtnDel_Click" Text="Delete" ValidationGroup="g13" CssClass="button delete-button" />
        </td>
    </tr>
    <tr>
        <td class="auto-style8">
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </td>
        <td class="auto-style4">
            &nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style6">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style6">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style8">Enter City Name</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtCity" runat="server" TextMode="DateTime" ValidationGroup="g11" Width="194px"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtCity" ErrorMessage="*" ForeColor="Red" ValidationGroup="g11"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style9">Choose CityName to Delete </td>
        <td>
            <asp:DropDownList ID="DDLCity" runat="server" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityName" ValidationGroup="g14" ItemType="string">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VaccineManagementDbConnectionString11 %>" ProviderName="<%$ ConnectionStrings:VaccineManagementDbConnectionString11.ProviderName %>" SelectCommand="SELECT [CityName] FROM [Location]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDLCity" ErrorMessage="*" ForeColor="Red" ValidationGroup="g14"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">
            <asp:Button ID="BtnUpd" runat="server" OnClick="BtnUpd_Click" Text="Add City" ValidationGroup="g11" CssClass="button add-button"/>
        </td>
        <td class="auto-style5">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtCity" ErrorMessage="Enter Proper CityName" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z]*[a-zA-Z]$" ValidationGroup="g11"></asp:RegularExpressionValidator>
        </td>
        <td class="auto-style9">
            <asp:Label ID="LblMsg2" runat="server"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Button ID="BtnDlt2" runat="server" OnClick="BtnDlt2_Click" Text="Delete" ValidationGroup="g14" CssClass="button delete-button" />
        </td>
    </tr>
    <tr>
        <td class="auto-style8">
            <asp:Label ID="LblMsg0" runat="server"></asp:Label>
        </td>
        <td class="auto-style4">
            &nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style6">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style6">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td colspan="4">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/AdminDashboard.aspx" CssClass="custom-button">Back</asp:LinkButton>
        </td>
    </tr>
</table>
</asp:Content>
