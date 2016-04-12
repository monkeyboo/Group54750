<%@ Page Language="VB" AutoEventWireup="false" %>

<!DOCTYPE html>
<script runat="server">

   
    Protected Sub CustomersButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("NewCustomerForm.aspx")
    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style11 {
            height: 302px;
        }
        .auto-style25 {
            text-align: center;
            width: 219px;
            height: 122px;
        }
        .auto-style26 {
            text-align: center;
            width: 220px;
            height: 122px;
        }
        .auto-style27 {
            text-align: center;
            height: 122px;
        }
        .auto-style28 {
            text-align: center;
            width: 219px;
            height: 123px;
        }
        .auto-style29 {
            text-align: center;
            height: 123px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
         <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" />
        </div>
        <div id="title">
            <br />
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" Font-Size="Large" ForeColor="Black" Font-Bold="True" Font-Italic="False">
                <CurrentNodeStyle ForeColor="#E6D9CC" />
                <NodeStyle Font-Bold="True" ForeColor="#A99583" />
                <PathSeparatorStyle Font-Bold="True" ForeColor="#E6D9CC" />
                <RootNodeStyle Font-Bold="True" ForeColor="#7A695A" />
            </asp:SiteMapPath>
        <br />
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <table align="center" class="auto-style11">
            <tr>
                <td class="auto-style25">
                    <asp:Button ID="CustomersButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Customers" Width="170px" OnClick="CustomersButton_Click" PostBackUrl="~/ManagerCustomer.aspx" Font-Bold="True" />
                </td>
                <td class="auto-style25">
                    <asp:Button ID="Button2" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Appointments" Width="170px" PostBackUrl="~/ManagerAppointments.aspx" Font-Bold="True" />
                </td>
                <td class="auto-style26">
                    <asp:Button ID="Button3" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Vendors" Width="170px" Font-Bold="True" PostBackUrl="~/Vendors.aspx" />
                </td>
                <td class="auto-style26">
                    <asp:Button ID="Button14" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Price List" Width="170px" Font-Bold="True" />
                </td>
                <td class="auto-style26">
                    <asp:Button ID="Button15" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Inventory" Width="170px" Font-Bold="True" />
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Button ID="Button20" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Sales Ticket" Width="170px" PostBackUrl="~/SalesTicket.aspx" Font-Bold="True" />
                </td>
                <td class="auto-style25">
                    <asp:Button ID="Button21" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Time Clock" Width="170px" PostBackUrl="~/EmployeeClockIn.aspx" Font-Bold="True" />
                </td>
                <td class="auto-style27">
                    <asp:Button ID="Button22" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Employees" Width="170px" PostBackUrl="~/Employee.aspx" Font-Bold="True" />
                </td>
                <td class="auto-style27">
                    <asp:Button ID="Button25" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="My Details" Width="170px" Font-Bold="True" />
                </td>
                <td class="auto-style27">
                    <asp:Button ID="Button26" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Management Funct." Width="170px" PostBackUrl="~/ManagementFunctions.aspx" Font-Bold="True" />
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style29">
                    &nbsp;</td>
                <td class="auto-style29">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
      </div><br />      
    </form>
</body>
</html>
