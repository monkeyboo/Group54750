﻿<%@ Page Language="VB" AutoEventWireup="true" %>

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

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Home</title>
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
                    <asp:Button ID="ManagersButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Managers" Width="170px" PostBackUrl="~/ManagerMainMenu.aspx" Font-Bold="True" />
                </td>
                <td>
                    <asp:Button ID="EmployeesButton" runat="server" BackColor="#A99583" BorderStyle="Outset" Height="100px" Text="Employees" Width="170px" PostBackUrl="~/EmployeeMainMenu.aspx" Font-Bold="True" />
                </td>
                
            </tr>
            
          </table>
        </div>
      <br />      
    </form>
</body>
</html>
