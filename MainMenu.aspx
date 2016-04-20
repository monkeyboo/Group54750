<%@ Page Language="VB" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
    
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        ' If Session("user") IsNot "manager" Then
        'Response.Redirect("login.aspx")
        'End If
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub

    Protected Sub Button14_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button21_Click(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manager Menu</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <div id="logo">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/twoRiversLogo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
         <div id="logoutbutton">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="50px" ImageUrl="~/logoutbutton1.fw.png" BorderStyle="Outset" OnClick="ImageButton1_Click" />
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
        </div> 
        <br />
        
<div id="main" class="container2">
        <table align="center" class="mainTable">
            <tr>
                <td >
                    <asp:Button ID="CustomersButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Customers" Width="170px" PostBackUrl="~/Customer.aspx" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="AppointmentsButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Appointments" Width="170px" PostBackUrl="~/Appointments.aspx" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="ManagerFButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="My Details" Width="170px" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="Button26" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Manager Functions" Width="170px" PostBackUrl="~/ManagerFunctions.aspx" Font-Bold="True" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SalesTicketButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Sales Ticket" Width="170px" PostBackUrl="~/SalesTicket.aspx" Font-Bold="True" />
                </td>
                <td >
                    <asp:Button ID="PriceListButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Price List" Width="170px" Font-Bold="True" OnClick="Button14_Click" />
                </td>
                <td>
                    <asp:Button ID="TimeClockButton0" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Clock In" Width="170px" Font-Bold="True" OnClick="Button21_Click" />
                </td>
                <td>
                    <asp:Button ID="TimeClockButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Clock Out" Width="170px" Font-Bold="True" OnClick="Button21_Click" />
                </td>
            </tr>
          </table>
        </div>
      <br />      
    </form>
</body>
</html>
