<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SqlServerVSProjectMain.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id ="main">
            Enter Name:<asp:TextBox ID="txtName" runat="server" CssClass="boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Must Enter Name"></asp:RequiredFieldValidator>
            <br />
            Enter Email:<asp:TextBox ID="txtEmail" runat="server" CssClass="boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must Enter Email Address"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must Enter a Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            Enter Date:<asp:TextBox ID="txtDate" runat="server" CssClass="boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="DateValidator" runat="server" ControlToValidate="txtDate" ErrorMessage="Must Enter a Date"></asp:RequiredFieldValidator>
            <br />

        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="DATEADDED" HeaderText="DATEADDED" SortExpression="DATEADDED" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:personTableConnectionString %>" DeleteCommand="DELETE FROM [PersonTable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PersonTable] ([EMAIL], [NAME], [DATEADDED]) VALUES (@EMAIL, @NAME, @DATEADDED)" SelectCommand="SELECT [EMAIL], [NAME], [Id], [DATEADDED] FROM [PersonTable]" UpdateCommand="UPDATE [PersonTable] SET [EMAIL] = @EMAIL, [NAME] = @NAME, [DATEADDED] = @DATEADDED WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter DbType="Date" Name="DATEADDED" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter DbType="Date" Name="DATEADDED" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
        </div>   
    </form>
</body>
</html>
