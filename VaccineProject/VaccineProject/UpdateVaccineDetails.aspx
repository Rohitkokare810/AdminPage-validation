<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateVaccineDetails.aspx.cs" Inherits="VaccineProject.UpdateVaccineDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        text-align: center;
    }
    .auto-style3 {
        width: 384px;
    }
    .auto-style4 {
        width: 243px;
    }
    .auto-style5 {
            width: 38px;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style2" colspan="4">Update Vaccine Details</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Vaccine Name</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVacName" runat="server" ValidationGroup="g1"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtVacName" ErrorMessage="*" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TxtVacName" ErrorMessage="Enter Correct Vaxin Name" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z]*[a-zA-Z]$" ValidationGroup="g1"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Manufacturer</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVacMan" runat="server" ValidationGroup="g1"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtVacMan" ErrorMessage="*" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtVacMan" ErrorMessage="Enter Proper Manufacturer Detail" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z]*[a-zA-Z]$" ValidationGroup="g1"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Stock</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVaxStock" runat="server" ValidationGroup="g1" TextMode="Number"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtVaxStock" ErrorMessage="*" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtVaxStock" ErrorMessage="Enter Proper Stock" ForeColor="Red" ValidationExpression="^[0-9]\d*$" ValidationGroup="g1"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </td>
        <td class="auto-style4">
            <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add New Vaccines" ValidationGroup="g1" />
        </td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="VaccineName" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="VaccineID" HeaderText="VaccineID" InsertVisible="False" ReadOnly="True" SortExpression="VaccineID" />
                    <asp:BoundField DataField="VaccineName" HeaderText="VaccineName" ReadOnly="True" SortExpression="VaccineName" />
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:VaccineManagementDbConnectionString7 %>" DeleteCommand="DELETE FROM [VaccineDetails] WHERE [VaccineName] = @original_VaccineName AND [VaccineID] = @original_VaccineID AND (([Manufacturer] = @original_Manufacturer) OR ([Manufacturer] IS NULL AND @original_Manufacturer IS NULL)) AND (([Stock] = @original_Stock) OR ([Stock] IS NULL AND @original_Stock IS NULL))" InsertCommand="INSERT INTO [VaccineDetails] ([VaccineName], [Manufacturer], [Stock]) VALUES (@VaccineName, @Manufacturer, @Stock)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:VaccineManagementDbConnectionString7.ProviderName %>" SelectCommand="SELECT * FROM [VaccineDetails]" UpdateCommand="UPDATE [VaccineDetails] SET [VaccineID] = @VaccineID, [Manufacturer] = @Manufacturer, [Stock] = @Stock WHERE [VaccineName] = @original_VaccineName AND [VaccineID] = @original_VaccineID AND (([Manufacturer] = @original_Manufacturer) OR ([Manufacturer] IS NULL AND @original_Manufacturer IS NULL)) AND (([Stock] = @original_Stock) OR ([Stock] IS NULL AND @original_Stock IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_VaccineName" Type="String" />
                    <asp:Parameter Name="original_VaccineID" Type="Int32" />
                    <asp:Parameter Name="original_Manufacturer" Type="String" />
                    <asp:Parameter Name="original_Stock" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="VaccineName" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="Stock" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VaccineID" Type="Int32" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="Stock" Type="Int32" />
                    <asp:Parameter Name="original_VaccineName" Type="String" />
                    <asp:Parameter Name="original_VaccineID" Type="Int32" />
                    <asp:Parameter Name="original_Manufacturer" Type="String" />
                    <asp:Parameter Name="original_Stock" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">VaccineID</td>
        <td class="auto-style4">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="VaccineID" DataValueField="VaccineID" ValidationGroup="g2">
            </asp:DropDownList>
        </td>
        <td class="auto-style5">
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Vaccine Name</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVaxName2" runat="server" ValidationGroup="g2"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="g2" ControlToValidate="TxtVaxName2"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtVaxName2" ErrorMessage="Enter Proper Vaxin Name" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z]*[a-zA-Z]$" ValidationGroup="g2"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Manufacturer</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVacMan2" runat="server" ValidationGroup="g2"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="g2" ControlToValidate="TxtVacMan2"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtVacMan2" ErrorMessage="Enter Proper Manufacturer Name" ForeColor="Red" ValidationExpression="^[a-zA-Z][a-zA-Z]*[a-zA-Z]$" ValidationGroup="g2"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">Stock</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtVaxStock2" runat="server" ValidationGroup="g2" TextMode="Number"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="g2" ControlToValidate="TxtVaxStock2"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TxtVaxStock2" ErrorMessage="Enter Proper StockNo" ForeColor="Red" ValidationExpression="^[0-9]\d*$" ValidationGroup="g2"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="LblMsg2" runat="server"></asp:Label>
        </td>
        <td class="auto-style4">
            <asp:Button ID="BtnUpd" runat="server" OnClick="BtnUpd_Click" Text="Update Vaccines" ValidationGroup="g2" />
        </td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">Enter VaccineId To Delete</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtDlt" runat="server" ValidationGroup="g3"></asp:TextBox>
        </td>
        <td class="auto-style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ValidationGroup="g3" ForeColor="Red" ControlToValidate="TxtDlt"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TxtDlt" ErrorMessage="Enter Proper Id" ForeColor="Red" ValidationExpression="^[0-9]\d*$" ValidationGroup="g3"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">
            <asp:Button ID="BtnDlt" runat="server" OnClick="BtnDlt_Click" Text="Delete" ValidationGroup="g3" />
        </td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/AdminDashboard.aspx">Back</asp:LinkButton>
        </td>
    </tr>
</table>
</asp:Content>
